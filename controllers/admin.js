const db = require("../db")

exports.home = (req, res) => {
    return res.render("admin/admin-dashboard");
}

exports.juegos = (req,res) => {
    return res.render("admin/juegos-fases")
}

exports.fase = (req,res) => {
    let fase = req.params.fase;
    let sql = `SELECT 
            p.id AS partido_id,
            t1.id AS team1_id, 
            t1.name AS team1_nombre,
            p.goles1,
            p.penales1,
            t2.id AS team2_id, 
            t2.name AS team2_nombre,
            p.goles2,
            p.penales2,
            t1.short_name AS team1_shortname,
            t2.short_name AS team2_shortname,
            fecha
            FROM partidos p 
            LEFT JOIN teams t1 ON p.team1_id = t1.id
            LEFT JOIN teams t2 ON p.team2_id = t2.id 
            WHERE fase = ?
            ORDER BY p.id;`
    db.query(sql,[fase], (error, partidos) => {
        if(error){
            console.log(error)
            return res.status(500).send("Error en la base de datos.");
        }
        else{
            
            return res.render("admin/partidos-admin", {fase: fase, partidos: partidos})
        }
        
    })
    
}

exports.cargar = (req,res) => {
    const fase = req.params.fase;
    const {partido_id, action} = req.body
    let goles1 = Number(req.body.goles1);
    let goles2 = Number(req.body.goles2);
    let penales1 = Number(req.body.penales1);
    let penales2 = Number(req.body.penales2);

    if(action === "DEL"){
        sql = `
        UPDATE partidos
        SET
            goles1 = NULL,
            penales1 = NULL,
            goles2 = NULL,
            penales2 = NULL
        WHERE id = ?;`
        db.query(sql, [partido_id], (error, success) => {
            if(error){  console.log(error) }
            else{
                return res.redirect(`/admin-amrdq12s/meter-resultados/${fase}`);
            }
        })
        return;
    }

    const penales1_ = (penales1 === 0 && penales2 === 0) ? null : penales1;
    const penales2_ = (penales1 === 0 && penales2 === 0) ? null : penales2;
    
    sql = `
        UPDATE partidos 
        SET
            goles1 = ?,
            penales1 = ?,
            goles2 = ?,
            penales2 = ?
        WHERE id = ?;`
    
    db.query(sql,[goles1,penales1_,goles2,penales2_,partido_id],
        (error, success) => {
            if(error){ console.log(error)}

            else{
                return res.redirect(`/admin-amrdq12s/meter-resultados/${fase}`);
            }
        }   
    
    )
    
}

exports.random = (req,res) => {
    const fase = req.params.fase;
    sql = `SELECT id FROM partidos WHERE fase = ?;`;

    db.query(sql, [fase], async (error, ids) => {
        if (error) {
            console.log(error); 
            return;
        } 

        if (ids.length > 0) {
            try {
                await Promise.all(ids.map(obj => cargarRandom(obj.id, fase)));
            } catch (err) {
                console.log("Error cargando partidos random:", err);
            }

            return res.redirect(`/admin-amrdq12s/meter-resultados/${fase}`);
        } else {
            console.log(`No hay partidos en ${fase}`);
            return res.redirect(`/admin-amrdq12s/meter-resultados/${fase}`);
        }
    });
}

exports.deleteAll = (req,res) => {
    const fase = req.params.fase
    
    if(fase === "ALL"){
        deleteAllPartidos();
        return res.redirect(`/admin-amrdq12s/meter-resultados`)
    }

    sql = `
    UPDATE partidos
    SET
        goles1 = NULL,
        goles2 = NULL,
        penales1 = NULL,
        penales2 = NULL
    WHERE 
        fase = ?; 
    `

    db.query(sql,[fase], (error,success) => {
        if(error){
            console.log(error);
            return;
        } 
        else{
            return res.redirect(`/admin-amrdq12s/meter-resultados/${fase}`);
        }
    })
}

exports.quinielaControles = (req, res) => {
    sql = `SELECT fase, abierta FROM quinielas_control`
    db.query(sql, (error,controles) => {
        if(error){
            console.log(error);
            return res.redirect("/admin-amrdq12s")
        }
        return res.render("admin/control-quiniela", {fases: controles})
    })
    
    
}

exports.updateControles = (req, res) => {
    const fase = req.params.fase
    const sql_select = `SELECT fase, abierta FROM quinielas_control WHERE fase = ?;`

    db.query(sql_select,[fase], (error, control) => {
        if(control.length > 0){
            let abierto = (control[0].abierta === 0) ? 1 : 0
            let sql= `UPDATE quinielas_control SET abierta = ? WHERE fase = ?`
            db.query(sql,[abierto,control[0].fase])

        }
        else{
            console.log(fase," no es una fase valida.")
        }
    })
    return res.redirect("/admin-amrdq12s/quiniela-controles")
}

exports.showQuinielasJugadores = (req,res) => {
    let sql = ` SELECT 
                    e.usuario_id, e.fase, u.user
                FROM quinielas_envios e
                JOIN users u ON e.usuario_id = u.id;`

    db.query(sql, (error, rows) => {
        if (error) {
            console.log(error);
            return;
        }
    
        const usersMap = {};
    
        rows.forEach(row => {
            const { usuario_id, user, fase } = row;
    
            if (!usersMap[usuario_id]) {
                usersMap[usuario_id] = {
                    usuario_id,
                    user,
                    fases: []
                };
            }
    
            usersMap[usuario_id].fases.push(fase);
        });
    
        const users = Object.values(usersMap); // Convertimos el map a array para pasarlo al HBS
        return res.render("admin/quinielas-jugadores", { users });
    });
}

exports.borrarQuinielas = (req,res) => {
    const fase = req.params.fase;           // viene de la URL
    const usuario_id = req.body.usuario_id; // viene del input hidden

    const sql = `DELETE FROM quinielas_envios WHERE fase = ? AND usuario_id = ?`;

    db.query(sql, [fase, usuario_id], (error, result) => {
        if(error){
            console.log(error)
            return res.status(500).send("Error al borrar la quiniela.")
        }
    })

    const sql2 = `DELETE b FROM bets b JOIN partidos p ON b.partido_id = p.id WHERE p.fase = ? AND b.user_id = ?;`

    db.query(sql2, [fase, usuario_id], (error, result) => {
        if(error){
            console.log(error)
            return res.status(500).send("Error al borrar la quiniela.")
        }
    })
    return res.redirect("/admin-amrdq12s/jugadores-quinielas");
}

exports.borrarTodasLasQuinielas = (req, res) => {
    const sql1 = `TRUNCATE TABLE bets`
    const sql2 = `TRUNCATE TABLE quinielas_envios`
    db.query(sql1)
    db.query(sql2)
    return res.redirect("/admin-amrdq12s/jugadores-quinielas");
}

exports.TodasLasQuinielasRandom = (req, res) => {
    db.query('TRUNCATE TABLE bets')
    db.query('TRUNCATE TABLE quinielas_envios')

    sql = `SELECT id FROM users`
    db.query(sql, (error,users) => {
        if(error){
            console.log(error)
        }
        users.forEach(user => {
            mandarQuinielasRandom(user.id)
            mandarEnvioQuiniela(user.id)
        });
        return res.redirect("/admin-amrdq12s/jugadores-quinielas");
    })
    
}

exports.TodosLosResultadosRandom = (req, res) => {
    const sql = `SELECT id, fase FROM partidos`
    db.query(sql, (error, results) => {
        if(error){
            console.log(error)
        }
        else{
            results.forEach(partido => {
                cargarRandom(partido.id, partido.fase)
            })
        }
    })
    return res.redirect("/admin-amrdq12s/meter-resultados");
}

//Pagina para ver las fases y modificar los equipos
//que juegan los partidos
exports.games = (req, res) => {
    return res.render("admin/games")
}

function getGamesByFase(fase, callback) {
    const sql = `
    SELECT t1.name AS team1_name, t2.name AS team2_name, 
    t1.id AS team1_id, t2.id AS team2_id, goles1, goles2,
    penales1, penales2, p.id
    FROM partidos p 
    LEFT JOIN teams t1 ON p.team1_id = t1.id 
    LEFT JOIN teams t2 ON p.team2_id = t2.id 
    WHERE fase = ?;`;

    db.query(sql, [fase], (error, results) => {
        if (error) {
            console.log(error);
            callback(null); 
        } else {
            callback(results);
        }
    });
}

function getTeams(callback){
    sql = `SELECT name, id FROM teams;`
    db.query(sql, (error, teams) => {
        if (error){
            console.log(error);
            callback(null);
        }
        callback(teams);
    })
}

exports.gamesFase = (req, res) => {
    const fase = req.params.fase;

    getGamesByFase(fase, function(games) {
        getTeams(function(teams) {
            return res.render("admin/games", {games: games, fase: fase, teams: teams})
        })
    });
};



function mandarQuinielasRandom(user_id){
    const sql = `SELECT id, fase FROM partidos`

    db.query(sql, (error, partidos) => {
        partidos.forEach(partido => {
            cargarQuinielaRandom(partido.id, user_id, partido.fase) 
        })
    })

}

function cargarQuinielaRandom(partido_id, user_id, fase){
    let sql = '';
    const goles1 = Math.floor(Math.random() * 5);
    const goles2 = Math.floor(Math.random() * 5);

    if(fase !== 'FDG' && goles1 === goles2){
        let p1 = Math.floor(Math.random() * 6);
        let p2 = Math.floor(Math.random() * 6);

        while (p1 === p2) {
            p2 = Math.floor(Math.random() * 6);
        }
        
        sql = `INSERT INTO bets
            (partido_id, user_id, goles1, goles2, penales1, penales2) 
            VALUES (?, ?, ?, ?, ${p1}, ${p2})`
        
    }
    else{
        sql = `INSERT INTO bets
            (partido_id, user_id, goles1, goles2, penales1, penales2)
            VALUES(?, ?, ?, ?, NULL, NULL)`
    }
    
    db.query(sql, [partido_id, user_id, goles1, goles2], (error, success) => {
        if(error){
            console.log(error) 
        }
    })
}

function mandarEnvioQuiniela(id){
    fases = ["FDG","16VOS","OCTAVOS","CUARTOS","SEMIS","TERCER_PUESTO","FINAL"]

    fases.forEach(fase => {
        let sql = `INSERT INTO quinielas_envios
        (usuario_id, fase, enviado)
        VALUES
        (?, ?, 1)`
        
        db.query(sql, [id, fase])
    })
}

function cargarRandom(id, fase){
    let sql = '';
    const goles1 = Math.floor(Math.random() * 5);
    const goles2 = Math.floor(Math.random() * 5);

    if(fase !== 'FDG' && goles1 === goles2){
        let p1 = Math.floor(Math.random() * 6);
        let p2 = Math.floor(Math.random() * 6);

        while (p1 === p2) {
            p2 = Math.floor(Math.random() * 6);
        }
        
        sql = `
        UPDATE partidos
        SET
            goles1 = ?,
            goles2 = ?,
            penales1 = ${p1},
            penales2 = ${p2}
        WHERE
            id = ?;`
    }
    else{
        sql = `UPDATE partidos
            SET
                goles1 = ?,
                goles2 = ?,
                penales1 = NULL,
                penales2 = NULL
            WHERE
                id = ?;`
    }
    
    db.query(sql, [goles1, goles2, id], (error, success) => {
        if(error){
            console.log(error) 
        }
    })
}

function deleteAllPartidos(){
    const sql = `
    UPDATE partidos
    SET
        goles1 = NULL,
        goles2 = NULL,
        penales1 = NULL,
        penales2 = NULL
    WHERE 1;`

    db.query(sql)
    return;
}

exports.cambiarPartido = (req, res) => {
    const id = req.params.id
    const control = req.body.control
    const fase = req.body.fase
    let team1, team2
    
    let sql = `UPDATE partidos SET team1_id = ?,  team2_id = ? WHERE id = ?`
    switch (control) {
        case "update":
            team1 = req.body.team1_id ?? null
            team2 = req.body.team2_id ?? null
            
            break;
        case "remove":
            team1 = null
            team2 = null
            
            break;
        default:
            return res.status(400).send("Acción inválida.")
    }

    db.query(sql, [team1, team2, id])

    return res.redirect(`/admin-amrdq12s/games/${fase}`)
}