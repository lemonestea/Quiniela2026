const db = require("../db");
const axios = require("axios");
const puntos_por_fase = require('./puntos.json');

exports.showFases = (req, res) => {
    return res.render('quinielas');
}

exports.showQuiniela = (req, res) => {
    const fase = req.params.fase;
    const user_id = req.session.user.id;

    try {
        const username = req.session.user.username;
        SQL = `SELECT 
                b.goles1, 
                b.goles2, 
                b.penales1, 
                b.penales2, 
                t1.name AS team1, 
                t2.name AS team2,
                p.goles1 AS r_goles1,
                p.goles2 AS r_goles2,
                p.penales1 AS r_penales1,
                p.penales2 AS r_penales2,
                p.id AS id,
                p.fase AS fase
            FROM bets b
            LEFT JOIN partidos p ON b.partido_id = p.id
            LEFT JOIN teams t1 ON p.team1_id = t1.id
            LEFT JOIN teams t2 ON p.team2_id = t2.id

            WHERE b.user_id = ? AND p.fase = ?
            ORDER BY p.id;`
        db.query(SQL, [user_id, fase], (error, quinielas) => {
            if (error) {
                console.log(error);
                return res.render("error");
            }
            let puntos = 0;
            if (quinielas.length !== 0) {
                quinielas.forEach(quiniela => {
                    quiniela.puntos = calcularPuntos(quiniela)
                    puntos += quiniela.puntos
                });
                
                return res.render('quinielas', { quinielas : quinielas, puntos : puntos});
            }
            else{
                return res.render('quinielas', { quinielasNotSent: "Aún no has mandado tu Quiniela." })
            }
        });

    }catch (err) {
        console.log(err);
        return res.render("error");
    }

}

function calcularPuntos(quiniela){
    
    if (quiniela.r_goles1 === null || quiniela.r_goles2 === null) {
        return null;
    }

    let puntos_fase_gol;        // Determina cuántos puntos por gol se darán dependiendo de la fase
    let puntos_fase_resultado;  // Determina cuántos puntos por resultado se darán dependiendo de la fase
    let puntos_fase_penales;    // Determina cuántos puntos por penales se darán dependiendo de la fase

    let puntos_finales = 0;
    switch (quiniela.fase) {
        case "FDG":
            puntos_fase_gol = puntos_por_fase.PUNTOS_FDG_GOL;
            puntos_fase_resultado = puntos_por_fase.PUNTOS_FDG_RESULTADO;
            puntos_fase_penales = 0;
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

    let acierto_goles1 = quiniela.goles1 === quiniela.r_goles1;
    let acierto_goles2 = quiniela.goles2 === quiniela.r_goles2;
    if (acierto_goles1) puntos_finales += puntos_fase_gol;
    if (acierto_goles2) puntos_finales += puntos_fase_gol;

    let resultadoBet = obtenerGanador(quiniela.goles1, quiniela.goles2, quiniela.penales1, quiniela.penales2);
    let resultadoReal = obtenerGanador(quiniela.r_goles1, quiniela.r_goles2, quiniela.r_penales1, quiniela.r_penales2);
    
    if (resultadoBet === resultadoReal) {
        puntos_finales += puntos_fase_resultado;
    }

    if (quiniela.fase !== "FDG" && quiniela.penales1 && quiniela.r_penales1) {
        let penalesBet = obtenerResultado(quiniela.penales1, quiniela.penales2);
        let penalesReal = obtenerResultado(quiniela.r_penales1, quiniela.r_penales2);
        if (penalesBet === penalesReal) {
            puntos_finales += puntos_fase_penales;
        }
    }

    return puntos_finales;
}

function obtenerResultado(g1, g2) {
    return g1 === g2 ? 'E' : (g1 > g2 ? '1' : '2');
}

function obtenerGanador(goles1, goles2, penales1, penales2) {

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