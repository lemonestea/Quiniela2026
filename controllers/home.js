const db = require('../db');

exports.renderHomePage = (req, res) => {
    if(req.session.user){
        db.query("SELECT * FROM leaderboard", (error,participantes)=>{
            if(error){
                console.log(error)
                return res.render("error")
            }
        })
        sql_query = `SELECT 
            partidos.id,
            t1.short_name AS team1_short_name,
            t1.name       AS team1_name,
            t2.name       AS team2_name,
            t2.short_name AS team2_short_name,
            partidos.fecha,
            partidos.fase
            FROM partidos
            INNER JOIN teams t1 ON t1.id = partidos.team1_id
            INNER JOIN teams t2 ON t2.id = partidos.team2_id
            WHERE partidos.fecha > NOW()
            ORDER BY partidos.fecha ASC
            LIMIT 2;`
            
        db.query(sql_query, (error, partidos) => {
            db.query("SELECT favteam.user_id, teams.id AS teamid, teams.name AS teamname, teams.short_name AS shortname FROM favteam INNER JOIN teams ON favteam.teamid = teams.id WHERE favteam.user_id = ?;",
            req.session.user.id, (error, results) => {
            if (error) {
                console.log(error);
                return res.render('error', { message: 'Error al cargar los equipos' });
            }
            if (results.length > 0){
            
                return res.render('index', { 
                    isAuthenticated: req.session.user ? true : false,
                    fav_team: results[0].shortname.toLowerCase(),
                    partidos: partidos
                })
            }
            else{
                db.query("SELECT id, name FROM teams", (error,results) =>{
                    if(error){
                        console.log(error)
                        return res.render('index',{message: 'Error al cargar los equipos'})
                    }
                    return res.render('index',{
                        isAuthenticated: req.session.user ? true:false,
                        teams: results,
                        partidos: partidos
                    })
                })
                
            }
            
        });
        })
        
    }   
    else{
        return res.render('index', {isAuthenticated: false})
    }  
};

exports.renderRules = (req,res) =>{
    return res.render("rules")
}

exports.renderHTP = (req,res) => {
    return res.render("howtoplay")
}

exports.renderTournament = async (req, res) => {
    try {
        const teams = await getTeamsAndPoints();
        return res.render("tournament", { teams: teams });

    } catch (error) {
        console.log(error);
        return res.redirect("/");
    }
}

// getTeamsAndPoints devuelve una Promesa
function getTeamsAndPoints() {
    return new Promise((resolve, reject) => {
        const sqlGrupos = `SELECT DISTINCT team_group FROM teams;`;

        db.query(sqlGrupos, (error, grupos) => {
            if (error) {
                return reject(error);
            }

            // Creamos un array de promesas para cada grupo
            const promesas = grupos.map(grupo => {
                return new Promise((res, rej) => {
                    const sqlEquipos = `
                       SELECT
    name,
    team_group,
    total_points,
    goals_for,
    goals_against,
    CONCAT(
        CASE 
            WHEN COALESCE(dg_numerico, 0) > 0 THEN '+'
            ELSE ''
        END,
        COALESCE(dg_numerico, 0)
    ) AS DG
FROM (
    SELECT
        t.name,
        t.team_group,
        SUM(
            CASE
                WHEN (t.id = p.team1_id AND p.goles1 > p.goles2) OR 
                     (t.id = p.team2_id AND p.goles2 > p.goles1) THEN 3
                WHEN p.goles1 = p.goles2 THEN 1
                ELSE 0
            END
        ) AS total_points,
        SUM(
            CASE WHEN t.id = p.team1_id THEN COALESCE(p.goles1, 0) 
            ELSE COALESCE(p.goles2, 0) END
        ) AS goals_for,
        SUM(
            CASE 
            WHEN t.id = p.team1_id THEN COALESCE(p.goles2, 0) 
            ELSE COALESCE(p.goles1, 0) END
        ) AS goals_against,
        SUM(
            CASE 
            WHEN t.id = p.team1_id THEN COALESCE(p.goles1, 0) - COALESCE(p.goles2, 0)
            ELSE COALESCE(p.goles2, 0) - COALESCE(p.goles1, 0)
            END
        ) AS dg_numerico
    FROM partidos p
    JOIN teams t ON t.id = p.team1_id OR t.id = p.team2_id
    WHERE t.team_group = ?
    GROUP BY t.name, t.team_group
) AS tabla_clasificada
ORDER BY total_points DESC, dg_numerico DESC, goals_for DESC;

                    `;

                    db.query(sqlEquipos, [grupo.team_group], (err, equipos) => {
                        if (err) return rej(err);
                        // Aquí puedes llamar a getPoints(equipos) si quieres procesarlos
                        let m = getPoints(equipos, grupo.team_group);
                        res({ grupo: grupo.team_group, equipos });
                    });
                });
            });

            // Esperamos a que todas las consultas terminen
            Promise.all(promesas)
                .then(resultados => {
                    resolve(resultados); // Esto será un array con los grupos y sus equipos
                })
                .catch(err => {
                    reject(err);
                });
        });
    });
}

function getPoints(equipos, team_group){
    sql=`SELECT p.*
        FROM partidos p
        JOIN teams t ON p.team1_id = t.id OR p.team2_id = t.id
        WHERE t.id = '1000001' AND p.fase = 'FDG'`;
    //console.log(equipos[0].puntos)
}