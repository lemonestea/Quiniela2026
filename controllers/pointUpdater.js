const db = require('../db');
const puntos_por_fase = require('./puntos.json');

exports.actualizarPuntos = () => {

    let puntos;
    const SQL = "SELECT user, id FROM users;";
    db.query(SQL, (error, users) => {
        if (error) {
            console.log("Error al obtener usuarios:", error);
            return;
        } else {
            puntos = calcularPuntos(users);
        }
    });
}

// Función para calcular puntos
function calcularPuntos(users) {
    if (!Array.isArray(users)) {
        console.log("Error: Se esperaba un array de usuarios.");
        return;
    }

    const SQL = "SELECT id, goles1, penales1, goles2, penales2, fase FROM partidos ORDER BY id ASC;";

    db.query(SQL, (error, partidos) => {
        if (error) {
            console.log("Error al obtener partidos:", error);
            return;
        }

        users.forEach(USER => {
            // Logica para calcular las quinielas de cada jugador de la quiniela
            let sql = "SELECT partido_id, goles1, penales1, goles2, penales2 FROM bets WHERE user_id = ?";
            let points = 0;

            db.query(sql, USER.id, (error, results) => {
                if (error) {
                    console.log(`Error al obtener apuestas del usuario ${USER.id}:`, error);
                    return;
                }

                results.forEach(RESULT => {
                    const partido = partidos.find(p => p.id === RESULT.partido_id);
                    if (partido) {
                        points += sumarPuntos(RESULT, partido);
                    }
                });
                
                const insertSQL = `
                    INSERT INTO leaderboard (usuario_id, puntos)
                    VALUES (?, ?)
                    ON DUPLICATE KEY UPDATE puntos = VALUES(puntos)
                `;

                db.query(insertSQL, [USER.id, points], (insertErr, result) => {
                    if (insertErr) {
                        console.log(`Error insertando puntos para usuario ${USER.id}:`, insertErr);
                    }
                });
            });
        });
    });
}

function sumarPuntos(bet, partido) {
    if (partido.goles1 === null || partido.goles2 === null) {
        return 0;
    }

    let puntos_fase_gol;        // Determina cuántos puntos por gol se darán dependiendo de la fase
    let puntos_fase_resultado;  // Determina cuántos puntos por resultado se darán dependiendo de la fase
    let puntos_fase_penales;    // Determina cuántos puntos por penales se darán dependiendo de la fase

    let puntos_finales = 0;
    switch (partido.fase) {
        case "FDG":
            puntos_fase_gol = puntos_por_fase.PUNTOS_FDG_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_FDG_RESULTADO;
            puntos_fase_penales = 0;    //Porque no hay penales en FDG
            break;

        case "16VOS":
            puntos_fase_gol = puntos_por_fase.PUNTOS_16_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_16_RESULTADO;
            puntos_fase_penales = puntos_por_fase.PUNTOS_16_PENALES;
            break;

        case "OCTAVOS":
            puntos_fase_gol = puntos_por_fase.PUNTOS_8_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_8_RESULTADO;
            puntos_fase_penales = puntos_por_fase.PUNTOS_8_PENALES;
            break;

        case "CUARTOS":
            puntos_fase_gol = puntos_por_fase.PUNTOS_4_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_4_RESULTADO;
            puntos_fase_penales = puntos_por_fase.PUNTOS_4_PENALES;
            break;

        case "SEMIS":
            puntos_fase_gol = puntos_por_fase.PUNTOS_S_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_S_RESULTADO;
            puntos_fase_penales = puntos_por_fase.PUNTOS_S_PENALES;
            break;

        case "TERCER_PUESTO":
            puntos_fase_gol = puntos_por_fase.PUNTOS_3_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_3_RESULTADO;
            puntos_fase_penales = puntos_por_fase.PUNTOS_3_PENALES;
            break;

        case "FINAL":
            puntos_fase_gol = puntos_por_fase.PUNTOS_F_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_F_RESULTADO;
            puntos_fase_penales = puntos_por_fase.PUNTOS_F_PENALES;
            break;

        default:
            console.log("Error 315 - Fase no definida.");
            break;
    }

    let acierto_goles1 = bet.goles1 === partido.goles1;
    let acierto_goles2 = bet.goles2 === partido.goles2;
    if (acierto_goles1) puntos_finales += puntos_fase_gol;
    if (acierto_goles2) puntos_finales += puntos_fase_gol;

    let ganadorBet = obtenerGanadorDelDuelo(bet);
    let ganadorReal = obtenerGanadorDelDuelo(partido);
    
    if (ganadorBet === ganadorReal) {
        puntos_finales += puntos_fase_resultado;
    }
    
    // Si hay penales y se quiere agregar puntos extra por atinar al penal
    if (partido.fase !== "FDG" && bet.penales1 != null && partido.penales1 != null) {

        let penalesBet = obtenerResultado(bet.penales1, bet.penales2);
        let penalesReal = obtenerResultado(partido.penales1, partido.penales2);
        
        if (penalesBet === penalesReal) {
            puntos_finales += puntos_fase_penales;
        }
    }

    return puntos_finales;
}

function obtenerResultado(g1, g2) {
    return g1 === g2 ? 'E' : (g1 > g2 ? '1' : '2');
}

// ✅ Esta función evalúa quién gana el duelo, incluyendo penales si los hay
function obtenerGanadorDelDuelo(partido) {
    const { goles1, goles2, penales1, penales2 } = partido;

    if (goles1 > goles2) return '1';
    if (goles2 > goles1) return '2';

    // Si empataron en goles, y hay penales
    if (penales1 != null && penales2 != null) {
        if (penales1 > penales2) return '1';
        if (penales2 > penales1) return '2';
    }

    // Empate total
    return 'E';
}