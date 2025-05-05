const db = require("../db")
const axios = require("axios")

//funcion para renderizar la pagina de perfil con los datos del usuario
exports.renderProfile = async (req, res) => {
    try {
        const username = req.session.user.username;
        const id = req.session.user.id;
        let points = await getPoints(id);

        db.query('SELECT * FROM users WHERE user = ?', [username], (error, results) => {
            if (error) {
                console.log(error);
                return res.render("error");
            }

            if (results.length === 0) {
                return res.render("error");
            }

            db.query('SELECT short_name FROM teams JOIN favteam ON favteam.teamid = teams.id WHERE favteam.user_id = ?', [results[0].id], (error, results2) => {
                if (error) {
                    console.log(error);
                    return res.render("error");
                }
                SQL_COMMAND = `
            SELECT 
                sp.user_id,
                p1.name AS maximo_goleador_name,
                p2.name AS maximo_asistidor_name,
                p3.name AS mejor_jugador_name,
                p4.name AS mejor_portero_name
            FROM 
                selected_players sp
                LEFT JOIN players p1 ON sp.maximo_goleador = p1.id
                LEFT JOIN players p2 ON sp.maximo_asistidor = p2.id
                LEFT JOIN players p3 ON sp.mejor_jugador = p3.id
                LEFT JOIN players p4 ON sp.mejor_portero = p4.id
            WHERE
                sp.user_id = ?
        `;
                db.query(SQL_COMMAND,[results[0].id], (error, selected_players) => {
                    if (error){
                        console.log(error);
                        return res.render("error");
                    }
                    if(selected_players.length == 0){
                        return res.render("profile", {
                            username: results[0].user,
                            id: results[0].id,
                            fav_team: (results2 && results2.length > 0) ? results2[0].short_name : "por_definir",
                            puntos: points.puntos,
                            rank: points.ranking
                        });
                    }
                    else{
                        return res.render("profile",{
                            username: results[0].user,
                            id: results[0].id,
                            fav_team: (results2 && results2.length > 0) ? results2[0].short_name : "por_definir", // Manejo si no tiene equipo favorito,
                            players_selected: 1,
                            maximo_goleador: selected_players[0].maximo_goleador_name,
                            maximo_asistidor: selected_players[0].maximo_asistidor_name,
                            mejor_jugador: selected_players[0].mejor_jugador_name,
                            mejor_portero: selected_players[0].mejor_portero_name,
                            puntos: points.puntos,
                            rank: points.ranking
                        })
                    }
                })
                
            });
        });
    } catch (err) {
        console.log(err);
        return res.render("error");
    }
};

function getPoints(user_id) {
    return new Promise((resolve, reject) => {
        const sql = `
            SELECT usuario_id, puntos, ranking FROM (
                SELECT 
                    usuario_id,
                    puntos,
                    DENSE_RANK() OVER (ORDER BY puntos DESC) AS ranking
                FROM leaderboard
            ) AS ranking
            WHERE usuario_id = ?;`;

        db.query(sql, [user_id], (error, resultados) => {
            if (error) return reject(error);
            resolve(resultados[0] || null);
        });
    });
}