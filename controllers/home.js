const db = require('../db');

exports.renderHomePage = (req, res) => {
    if(req.session.user){
        db.query("SELECT * FROM leaderboard", (error,participantes)=>{
            if(error){
                console.log(error)
                return res.render("error")
            }
        })

        db.query("SELECT favteam.user_id, teams.id AS teamid, teams.name AS teamname, teams.short_name AS shortname FROM favteam INNER JOIN teams ON favteam.teamid = teams.id WHERE favteam.user_id = ?;",
            req.session.user.id, (error, results) => {
            if (error) {
                console.log(error);
                return res.render('error', { message: 'Error al cargar los equipos' });
            }
            if (results.length > 0){
            
                return res.render('index', { 
                    isAuthenticated: req.session.user ? true : false,
                    fav_team: results[0].shortname.toLowerCase()
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
                        teams: results
                    })
                })
                
            }
            
        });
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

exports.renderTournament = (req, res) => {
    return res.render("tournament")
}