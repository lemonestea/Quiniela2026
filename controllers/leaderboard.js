const db = require("../db")
const axios = require("axios")


exports.renderLeaderboard = (req, res) => {
    const user = req.session.user.username;
    
    sql = `SELECT 
        ranked.usuario_id, 
        u.user, 
        ranked.puntos, 
        ranked.ranking 
    FROM (
        SELECT 
            usuario_id,
            puntos,
            DENSE_RANK() OVER (ORDER BY puntos DESC) AS ranking
        FROM leaderboard
    ) AS ranked
    JOIN users u ON ranked.usuario_id = u.id
    ORDER BY puntos DESC;`;

    db.query(sql, (error, leaderboard) => {
        if (error) {
            console.log(error);
        } else {
            return res.render("leaderboard", { leaderboard: leaderboard, user: user });
        }
    });
};
