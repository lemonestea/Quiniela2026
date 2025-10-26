const express = require('express')
const router = express.Router()
const db = require("../db")
const admin = require("../controllers/admin")

function requireAdmin(req, res, next) {
    
    if(!req.session.user || req.session.user.username != "Yoyo"){
        return res.redirect('/');   //Negar el paso a la pagina admin
    }
    next();
}


//ADMIN
router.get('/', requireAdmin, admin.home)

//GETs
router.get('/meter-resultados', requireAdmin, admin.juegos)
router.get('/meter-resultados/:fase', requireAdmin, admin.fase)
router.get('/random/:fase', requireAdmin, admin.random)
router.get('/randomAll',requireAdmin, admin.TodosLosResultadosRandom)
router.get('/deleteAll/:fase', requireAdmin, admin.deleteAll)
router.get('/quiniela-controles', requireAdmin, admin.quinielaControles)
router.get('/jugadores-quinielas', requireAdmin, admin.showQuinielasJugadores)
router.get('/borrar-todas-las-quinielas', requireAdmin, admin.borrarTodasLasQuinielas)
router.get('/crear-quinielas-random', requireAdmin, admin.TodasLasQuinielasRandom)
router.get('/games', requireAdmin, admin.games)
router.get('/games/:fase', requireAdmin, admin.gamesFase)
router.get('/quinielas-faltantes',requireAdmin,admin.quinielasFaltantes)

//POSTs
router.post('/cargar/:fase', requireAdmin, admin.cargar)
router.post('/quiniela-controles/:fase', requireAdmin, admin.updateControles)
router.post('/jugadores-quiniela/:fase',requireAdmin, admin.borrarQuinielas)
router.post('/cambiarPartido/:id', requireAdmin, admin.cambiarPartido)


module.exports = router;