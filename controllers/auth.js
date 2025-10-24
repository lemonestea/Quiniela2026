const db = require("../db")
const bcrypt = require("bcryptjs")
const crypto = require("crypto")
const nodemailer = require("nodemailer")
const fs = require('fs');
const path = require('path');


exports.register = async (req, res) => {
    try {
        const { user, email, password, passwordConfirm } = req.body;

        if(!isValidEmail(email)){
            return res.render('register', {
                error: 'Email inválido',
                user: [user],
                email: [email],
                emailerror: 'background-color: #ff00003d;'
            })
        }
        // Verificar si las contraseñas coinciden
        if (password !== passwordConfirm) {
            return res.render('register', { 
                error: 'Las contraseñas son diferentes',
                user: [user],
                email: [email],
                pwerror: 'background-color: #ff00003d;'
            });
        }

        // Verificar si el email ya está registrado
        const emailCheck = await new Promise((resolve, reject) => {
            db.query('SELECT email FROM users WHERE email = ?', [email], (error, results) => {
                if (error) return reject(error);
                resolve(results.length > 0);
            });
        });

        if (emailCheck) {
            return res.render('register', { 
                error: 'Ese Email ya está registrado',
                user: [user],
                email: [email],
                emailerror: 'background-color: #ff00003d;',
            });
        }

        // Verificar si el usuario ya existe
        const userCheck = await new Promise((resolve, reject) => {
            db.query('SELECT user FROM users WHERE user = ?', [user], (error, results) => {
                if (error) return reject(error);
                resolve(results.length > 0);
            });
        });

        if (userCheck) {
            return res.render('register', { 
                error: 'Usuario ya existe',
                user: [user],
                usererror: 'background-color: #ff00003d;',
                email: [email]
            });
        }

        // Hashear la contraseña
        const hashedPassword = await bcrypt.hash(password, 8);

        // Generar un ID único
        const randomNumber = Math.floor(Math.random() * 1000000);
        const id = randomNumber.toString().padStart(7, '0');

        // Insertar el nuevo usuario en la base de datos
        await new Promise((resolve, reject) => {
            db.query(
                "INSERT INTO users SET ?", 
                { id: id, user: user, email: email, password: hashedPassword },
                (error, results) => {
                    if (error) return reject(error);
                    resolve();
                }
            );
        });

        // Crear sesión automáticamente
        req.session.user = {
            id: id,
            username: user,
            email: email
        }

        // Escribir en login.log si quieres
        writeRegisterLog(user)

        // Redirigir a home
        return res.redirect("/");

    } catch (error) {
        console.error(error);
        return res.render('register', { error: 'Ha ocurrido un error inesperado' });
    }
};


exports.login = async(req,res) => {
    try{
        const {user, password} = req.body

        if (!user){
            return res.render('login',{error: 'Usuario no reconocido'})
        }
        if (!password){
            return res.render('login',{error: 'Contraseña no válida'})
        }
        db.query("SELECT * FROM users WHERE user = ? OR email = ?", [user,user], 
        async (error, results) =>{
            if (error){
                console.log(error)
                return res.render('login', {error: 'Ha ocurrido un error inesperado'})
            }

            if (results.length === 0){
                return res.render('login',{error: 'Usuario o contraseña incorrectos'})
            }

            const isMatch = await bcrypt.compare(password, results[0].password)

            if(!isMatch){
                return res.render('login',{error: 'Usuario o contraseña incorrectos'})
            }
            
            req.session.user = {
                id: results[0].id,
                username: results[0].user,
                email: results[0].email
            }

            writeLogingLog(results[0].user, "Inició")
            
            res.redirect("/")
        })

    }catch(error){
        console.log(error)
        res.render('login', {error: "Ha ocurrido un error"})
    }
}

function writeLogingLog(user, accion){
    const logPath = path.join('logs/login.log');
    const logData = `${getFormattedDate()} ${accion} sesión ${user}\n`;
    fs.appendFile(logPath, logData, (err) => {
        if (err) {
            console.error('Error al escribir en login.log:', err);
        }
    })
}

function writeRegisterLog(user){
    const logPath = path.join('logs/register.log');
    const logData = `${getFormattedDate()} ${user} se ha registrado\n`;
    fs.appendFile(logPath, logData, (err) => {
        if (err) {
            console.error('Error al escribir en register.log:', err);
        }
    })
}

exports.logout = (req, res) => {
    writeLogingLog(req.session.user.username, "Cerró")

    req.session.destroy((err) => {
        if (err) {
            console.error(err);
            
            return res.render("error", { message: "Error al cerrar sesión" });
        }
        res.redirect("/"); // Redirigir al índice
    });
};

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

exports.forgotPassword = async (req, res) => {
    const { email } = req.body;

    try {
        // Verificar si el email existe
        const user = await new Promise((resolve, reject) => {
            db.query("SELECT * FROM users WHERE email = ?", [email], (error, results) => {
                if (error) return reject(error);
                resolve(results[0]);
            });
        });

        if (!user) {
            return res.render("forgot-password", { error: "Email no registrado." });
        }

        // Generar un token único
        const token = crypto.randomBytes(32).toString("hex");

        // Guardar el token en la base de datos con una expiración
        await new Promise((resolve, reject) => {
            db.query(
                "UPDATE users SET reset_token = ?, reset_token_expires = DATE_ADD(NOW(), INTERVAL 1 HOUR) WHERE email = ?",
                [token, email],
                (error, results) => {
                    if (error) return reject(error);
                    resolve();
                }
            );
        });

        // Enviar el token por correo
        const transporter = nodemailer.createTransport({
            service: "gmail", // Cambia según el proveedor que uses
            auth: {
                user: process.env.EMAIL, // Configura tu email en variables de entorno
                pass: process.env.EMAIL_PASSWORD,
            },
        });
        //Aqui cambias el link del host para que sirva, de momento esta puesto localhost
        const resetLink = `${req.protocol}://${req.get("host")}/auth/reset-password/${token}`;

        await transporter.sendMail({
            from: '"Quiniela Yoyo" <' + process.env.EMAIL + '>',
            to: email,
            subject: "Restaurar Contraseña",
            html: `<p>Para restaurar tu contraseña, haz clic en el enlace siguiente:</p>
                   <a href="${resetLink}">Restaurar Contraseña</a>
                   <p>Si no solicitaste este cambio, ignora este mensaje.</p>`,
        });

        res.render("forgotpassword", { success: "Correo enviado con instrucciones." });
    } catch (error) {
        console.error(error);
        res.render("forgotpassword", { error: "Hubo un problema, intenta de nuevo." });
    }
};

exports.renderResetPasswordPage = (req, res) => {
    const { token } = req.params;
    res.render("reset-password", { token });
};

exports.resetPassword = async (req, res) => {
    const { token, password, passwordConfirm } = req.body;

    if (password !== passwordConfirm) {
        return res.render("reset-password", { error: "Las contraseñas no coinciden.", token });
    }

    try {
        const user = await new Promise((resolve, reject) => {
            db.query(
                "SELECT * FROM users WHERE reset_token = ? AND reset_token_expires > NOW()",
                [token],
                (error, results) => {
                    if (error) return reject(error);
                    resolve(results[0]);
                }
            );
        });

        if (!user) {
            return res.render("reset-password", { error: "El token es inválido o ha expirado.", token });
        }

        const hashedPassword = await bcrypt.hash(password, 8);

        await new Promise((resolve, reject) => {
            db.query(
                "UPDATE users SET password = ?, reset_token = NULL, reset_token_expires = NULL WHERE id = ?",
                [hashedPassword, user.id],
                (error, results) => {
                    if (error) return reject(error);
                    resolve();
                }
            );
        });

        res.redirect("/login");
    } catch (error) {
        console.error(error);
        res.render("reset-password", { error: "Hubo un problema, intenta de nuevo.", token });
    }
};


function getFormattedDate() {
    const now = new Date();

    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0'); // ¡Ojo! Los meses van de 0 a 11
    const year = now.getFullYear();

    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2,'0');

    return `[${day}-${month}-${year} @${hours}:${minutes}:${seconds}]`;
}