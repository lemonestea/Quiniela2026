const express = require('express')
const router = express.Router()
const db = require("../db");
const teamsController = require('../controllers/teams')
const homeController = require('../controllers/home')
const profileController = require('../controllers/profile')
const leaderboardController = require('../controllers/leaderboard')
const teamController = require('../controllers/team')
const playController = require('../controllers/play')
const quinielasController = require('../controllers/quinielas')
const matchController = require('../controllers/match')


function requireAuth(req, res, next) {
    if (!req.session.user) {
        return res.redirect('/'); // Redirige al inicio si no está autenticado
    }
    next(); // Continúa si está autenticado
}

function checkIfQuinielaIsSent(req, res, next) {
    user_id = req.session.user["id"];
    fase = req.params.fase;
    db.query("SELECT abierta FROM quinielas_control WHERE fase = ?",[fase], (error, control) => {
        
        if(error){
            console.log(error);
            return res.render("error");
        }
        db.query("SELECT * FROM quinielas_envios WHERE fase = ? AND usuario_id = ?",[fase,user_id], (error, enviado) => {
            if(error){
                console.log(error);
                return res.render("error");
            }

            if(control[0].abierta && enviado.length == 0){
                next()
            }
            else{
                return res.redirect("/play")
            }
        })
        
    })
}

router.get('/', homeController.renderHomePage)

router.get('/register', (req,res) =>{
    res.render('register')
})

router.get('/login', (req,res) =>{
    res.render('login')
})

router.get('/forgotpassword', (req,res) =>{
    res.render('forgotpassword')
})

//HOME
router.get('/rules', requireAuth, homeController.renderRules)
router.get('/howtoplay', requireAuth, homeController.renderHTP)
router.get('/tournament', requireAuth, homeController.renderTournament)

//TEAMS
router.get('/teams', requireAuth, teamsController.teams )
router.post('/loadfavteam', requireAuth, teamsController.loadFavTeam)


//PROFILE
router.get('/profile',requireAuth, profileController.renderProfile)


//LEADERBOARD
router.get('/leaderboard',requireAuth, leaderboardController.renderLeaderboard)


//TEAM
router.get('/team/:id',requireAuth, teamController.team)


//PLAY
router.get('/play',requireAuth,playController.renderPlay)
router.post('/load_max_goleador',requireAuth,playController.loadPlayers)
router.get('/play/:fase',requireAuth,checkIfQuinielaIsSent, playController.renderFasePlay)
router.post('/sendQuiniela/:fase',requireAuth,checkIfQuinielaIsSent, playController.sendQuiniela)

//QUINIELA
router.get('/misQuinielas',requireAuth, quinielasController.showFases)
router.get('/misQuinielas/:fase',requireAuth, quinielasController.showQuiniela)

//MATCH
router.get('/match/:id', requireAuth, matchController.showMatch )

module.exports = router;