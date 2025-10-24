const session = require("express-session");
const db = require("../db");
const puntos_por_fase = require('./puntos.json');

exports.showMatch = (req, res)=> {
    partido_id = req.params.id
    jugador_id = req.session.user.id

    sql = `
    SELECT 
    p.goles1 AS r_goles1, p.goles2 AS r_goles2, 
    p.penales1 AS r_penales1, p.penales2 AS r_penales2,
    t1.name AS team1_name, t2.name AS team2_name,
    b.goles1 AS b_goles1, b.goles2 AS b_goles2,
    b.penales1 AS b_penales1, b.penales2 AS b_penales2,
    t1.short_name AS team1_short_name,
    t2.short_name AS team2_short_name,
    p.fase, p.stadium, p.fecha
    FROM partidos p
    LEFT JOIN teams t1 ON t1.id = p.team1_id
    LEFT JOIN teams t2 ON t2.id = p.team2_id
    LEFT JOIN bets b ON b.partido_id = p.id
    WHERE p.id = ? AND b.user_id = ?;
`

    db.query(sql,[partido_id,jugador_id], (error, results) => {
        if( error ){
            console.log(error)
            return res.redirect("/misQuinielas")
        }
        const r_ganador = obtenerGanadorDelDuelo(
            results[0].r_goles1,
            results[0].r_goles2, 
            results[0].r_penales1, 
            results[0].r_penales2);

        const b_ganador = obtenerGanadorDelDuelo(
            results[0].b_goles1,
            results[0].b_goles2, 
            results[0].b_penales1, 
            results[0].b_penales2);

        results[0].r_ganador = obtenerNombreGanador(
            r_ganador, 
            results[0].team1_short_name, 
            results[0].team2_short_name)

        results[0].b_ganador = obtenerNombreGanador(
            b_ganador,
            results[0].team1_short_name,
            results[0].team2_short_name
        )

        puntos = obtenerPuntosPorFase(results[0].fase)
        results[0].puntos_por_goles = puntos[0]
        results[0].puntos_por_resultado = puntos[1]
        results[0].puntos_por_penales = puntos[2]

        return res.render("match",{data: results[0]})
    })
    
}

function obtenerGanadorDelDuelo(goles1, goles2, penales1, penales2) {

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

function obtenerPuntosPorFase(fase) {

    switch (fase) {
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
    return [puntos_fase_gol, puntos_fase_resultado, puntos_fase_penales];
}

function obtenerNombreGanador(ganador, team1, team2){
    let nombre_del_ganador = (ganador === '1') ? "Ha ganado " + team1 : (ganador === '2') ? "Ha ganado " + team2 : "Empataron"
    return nombre_del_ganador;
}