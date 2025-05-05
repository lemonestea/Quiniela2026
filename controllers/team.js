const session = require("express-session");
const db = require("../db")

exports.team = (req,res)=>{

    try {
        teamID = req.params.id;
        SQL = `
            SELECT 
                t.team_group, 
                t.name, 
                t.short_name, 
                t.id AS team_id,
                p.fecha, 
                p.stadium, 
                p.fase, 
                p.goles1, 
                p.goles2, 
                p.penales1, 
                p.penales2,
                t1.name AS team1_name, 
                t1.short_name AS team1_short_name,
                t2.name AS team2_name, 
                t2.short_name AS team2_short_name
            FROM teams t
            JOIN partidos p 
                ON t.id = p.team1_id OR t.id = p.team2_id
            JOIN teams t1 
                ON p.team1_id = t1.id
            JOIN teams t2 
                ON p.team2_id = t2.id
            WHERE t.id = ?;`;

        db.query(SQL,[teamID], (error, team_info) => {
            if (error) {
                console.error(error);
                return res.render('team', { error: 'Error al cargar al equipo' });
            }
            res.render('team', {team: team_info[0], partidos: team_info});
        });

    } catch (err) {
        console.log(err);
        res.render('team', { error: 'Error inesperado al cargar al equipo' });
    }
    
}