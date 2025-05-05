const session = require("express-session");
const db = require("../db")

exports.teams = (req, res) => {
    try {
        db.query('SELECT team_group, name, short_name, id FROM teams ORDER BY team_group, id', (error, results) => {
            if (error) {
                console.error(error);
                return res.render('teams', { error: 'Error al cargar los equipos' });
            }

            const groupedTeams = results.reduce((groups, team) => {
                if (!groups[team.team_group]) {
                    groups[team.team_group] = [];
                }

                // Agregar la ruta de la bandera
                team.flagPath = `/img/flags/${team.short_name}.png`.toLowerCase();

                groups[team.team_group].push(team);
                return groups;
            }, {});

            res.render('teams', { groupedTeams });
        });
    } catch (err) {
        console.log(err);
        res.render('teams', { error: 'Error inesperado al cargar los equipos' });
    }
};

exports.loadFavTeam = (req,res) =>{
    try{
        const user_id = req.session.user['id']
        const {fav_team} = req.body
        if( !user_id || !fav_team){
            return res.render("index")
        }
        db.query("INSERT INTO favteam (user_id,teamid) VALUES (?,?)",[user_id,fav_team])
        return res.redirect("/")

    }catch( err ){
        console.log(err)
    }
}