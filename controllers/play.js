const db = require("../db");
const axios = require("axios");


exports.renderPlay = (req, res) => {
    try {
        const username = req.session.user.username;
        const user_id = req.session.user['id'];
        
        //Los jugadores (MAX GOLEADOR, MAX ASISTIDOR, ETC) han
        //sido seleccionados si 0, no han sido seleccionados si 1
        selected_players = 0;

        //ACCESOS A LAS FASES
        FDG = 0;    //Fase de Grupos
        R32 = 0;    //Dieciseisavos
        R16 = 0;    //Octavos
        R8 = 0;     //Cuartos
        SF = 0;     //Semi Finales
        TP = 0;     //Tercer Puesto
        F = 0;      //Final

        //FASES ENVIADAS
        //0 = NO ENVIADA
        //1 = ENVIADA
        FDG_SENT = 0;    //Fase de Grupos
        R32_SENT = 0;    //Dieciseisavos
        R16_SENT = 0;    //Octavos
        R8_SENT = 0;     //Cuartos
        SF_SENT = 0;     //Semi Finales
        TP_SENT = 0;     //Tercer Puesto
        F_SENT = 0;      //Final

        const SQL_command = `
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
                sp.user_id = ?;
        `;

        db.query(SQL_command,[user_id], (error, selected_players) => {
            if (error) {
                console.log(error);
                return res.render("error");
            }

            if (selected_players.length > 0) {
                selected_players = 1;
            }

            // Si no hay jugadores seleccionados, obtener la lista completa
            db.query(`  SELECT 
                            players.id, players.name, teams.short_name 
                        FROM players 
                        JOIN teams ON teams.id = players.team_id;`
                , (error, players) => {
                if (error) {
                    console.log(error);
                    return res.render("error");
                }

                if (players.length === 0) {
                    return res.render("error");
                }

                // Obtener solo los porteros
                db.query(`  SELECT 
                            players.id, players.name, teams.short_name 
                        FROM players 
                        JOIN teams ON teams.id = players.team_id
                        WHERE players.posicion = "PORTERO";`, (error, porteros) => {
                    if (error) {
                        console.log(error);
                        return res.render("error");
                    }
                    
                    db.query('SELECT * FROM quinielas_control', (error,control) => {
                        if (error){
                            console.log(error)
                            return res.render("error");
                        }
                        //Recogemos informacion sobre si la fase esta abierta
                        //o cerrada desde la base de datos
                        FDG = control.find(f => f.fase === "FDG").abierta;
                        R32 = control.find(f => f.fase === "16VOS").abierta;
                        R16 = control.find(f => f.fase === "OCTAVOS").abierta;
                        R8 = control.find(f => f.fase === "CUARTOS").abierta;
                        SF = control.find(f => f.fase === "SEMIS").abierta;
                        TP = control.find(f => f.fase === "TERCER_PUESTO").abierta;
                        F = control.find(f => f.fase === "FINAL").abierta;
                        
                        db.query("SELECT * FROM quinielas_envios WHERE usuario_id = ?",[user_id], (error, envios) =>{
                            if(error){
                                console.log(error)
                                return res.render("error");
                            }

                            FDG_SENT = envios.find(f => f.fase === "FDG") ? 1 : 0;
                            R32_SENT = envios.find(f => f.fase === "16VOS") ? 1 : 0;
                            R16_SENT = envios.find(f => f.fase === "OCTAVOS") ? 1 : 0;
                            R8_SENT = envios.find(f => f.fase === "CUARTOS") ? 1 : 0;
                            SF_SENT = envios.find(f => f.fase === "SEMIS") ? 1 : 0;
                            TP_SENT = envios.find(f => f.fase === "TERCER_PUESTO") ? 1 : 0;
                            F_SENT = envios.find(f => f.fase === "FINAL") ? 1 : 0;
                            
                            return res.render("play",{
                                FDG: FDG , FDG_SENT: FDG_SENT,
                                R32: R32, R32_SENT: R32_SENT,
                                R16: R16, R16_SENT: R16_SENT,
                                R8: R8, R8_SENT: R8_SENT,
                                SF: SF, SF_SENT: SF_SENT,
                                TP: TP, TP_SENT: TP_SENT,
                                F: F, F_SENT: F_SENT,
                                players: players, porteros: porteros,
                                players_selected: selected_players });
                        })
                        
                    })
                    
                    
                });
            });
        });
    } catch (err) {
        console.log(err);
        return res.render("error");
    }
};



exports.loadPlayers = (req, res) => {
    try {
        const user_id = req.session.user['id'];
        const { maximo_goleador, maximo_asistidor, mejor_jugador, mejor_portero } = req.body;
        if (!user_id || !maximo_goleador || !maximo_asistidor || !mejor_portero || !mejor_jugador) {
            return res.render("index");
        }
        db.query("INSERT INTO selected_players (user_id,maximo_goleador,maximo_asistidor,mejor_jugador,mejor_portero) VALUES (?,?,?,?,?)",
            [user_id, maximo_goleador, maximo_asistidor, mejor_jugador, mejor_portero]);
        return res.redirect("/play");

    } catch (err) {
        console.log(err);
    }
};


exports.renderFasePlay = (req, res) => {
    fase = req.params.fase;
    
    SQL = `SELECT 
            p.id AS partido_id,
            t1.id AS team1_id, 
            t1.name AS team1_nombre, 
            t2.id AS team2_id, 
            t2.name AS team2_nombre,
            t1.short_name AS team1_shortname,
            t2.short_name AS team2_shortname,
            fecha
            FROM partidos p 
            LEFT JOIN teams t1 ON p.team1_id = t1.id
            LEFT JOIN teams t2 ON p.team2_id = t2.id 
            WHERE fase = ?
            ORDER BY p.id;`;

    db.query(SQL,[fase], (error,partidos) => {
        if( error ){
            console.log(error);
            return res.redirect("error");
        }
        else{
            return res.render("playfase",{partidos: partidos, fase: fase.trim()});
        }
    })
}

exports.sendQuiniela = (req, res) => {
    const user_id = req.session.user['id'];
    const resultados = req.body;
    
    
    const SQL = `
        INSERT INTO
        bets (partido_id, user_id, goles1, goles2, penales1, penales2)
        VALUES
        (?, ?, ?, ?, ?, ?);
    `;
    if( Array.isArray(resultados.partido_id) ){

        resultados.partido_id.forEach((partido, index) => {
            let goles1 = resultados.team1_goles[index];
            let goles2 = resultados.team2_goles[index];
            let penales1 = null;
            let penales2 = null;
            if(resultados.team1_penales !== undefined){
                penales1 = resultados.team1_penales[index] || null;
                penales2 = resultados.team2_penales[index] || null;             
            }        
    
            db.query(SQL, [partido, user_id, goles1, goles2, penales1, penales2], (error, sql) => {
                if (error) {
                    console.log(error);
                }            
            });
        });
    }

    else{
        let partido = resultados.partido_id;
        let goles1 = resultados.team1_goles;
        let goles2 = resultados.team2_goles;
        let penales1 = null;
        let penales2 = null;
        if(resultados.team1_penales !== undefined){
            penales1 = resultados.team1_penales || null;
            penales2 = resultados.team2_penales || null;             
        }        

        db.query(SQL, [partido, user_id, goles1, goles2, penales1, penales2], (error, sql) => {
            if (error) {
                console.log(error);
            }            
        });
    }
    

    db.query(`INSERT INTO quinielas_envios (usuario_id, fase, enviado)
        VALUES ( ?, ?, ?)`,[user_id, resultados.fase, 1], (error, sql) => {
            if(error){
                console.log(error);
            }
        });
    return res.redirect('/play');
}