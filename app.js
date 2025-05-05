const express = require("express")
const session = require("express-session")
const mysql = require("mysql")
const dotenv = require("dotenv")
const path = require("path")
const db = require("./db")
const hbs = require('hbs');
const pointUpdater = require('./controllers/pointUpdater');

const app = express()

// Middleware para verificar si el usuario está autenticado
function checkAuth(req, res, next) {
    if (req.session.user) {
        res.locals.isAuthenticated = true; // Variable global para la vista
        res.locals.username = req.session.user.username; // Pasar el nombre de usuario si es necesario
    } else {
        res.locals.isAuthenticated = false;
    }
    next();
}


const publicDirectory = path.join(__dirname, './public')
app.use(express.static(publicDirectory))

//Parsing URL encoded bodies from html forms
app.use(express.urlencoded({ extended: false}))
//Parsing JSON bodies from API clients 
app.use(express.json())

// Configuración del middleware de sesión
app.use(
    session({
        secret: "1998#1",
        resave: false,
        saveUninitialized: true,
        cookie: { secure: false },
    })
);


app.set("view engine", "hbs")
app.use(checkAuth);
app.use('/',require('./routes/pages'))
app.use('/auth',require('./routes/auth'))
app.use('/admin-amrdq12s', require('./routes/admin'))
app.set('views', path.join(__dirname, 'views'))

setInterval(() => {
    pointUpdater.actualizarPuntos();
}, 10000);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`Server started on ${PORT}`)
})

hbs.registerHelper('toLowerCase', function(str) {
    return str ? str.toLowerCase() : "";
});

hbs.registerHelper("eq", function(a, b) {
    return a === b;
});

hbs.registerHelper("formatDate", function (dateString) {
    const date = new Date(dateString);
    const day = String(date.getUTCDate()).padStart(2, "0");
    const month = String(date.getUTCMonth() + 1).padStart(2, "0");
    const year = date.getUTCFullYear();
    const hours = String(date.getUTCHours()).padStart(2, "0");
    const minutes = String(date.getUTCMinutes()).padStart(2, "0");

    return `${day}/${month}/${year}\n${hours}:${minutes}`;
});

hbs.registerHelper("isDefined", function(value) {
    return typeof value !== "undefined";
});

hbs.registerHelper("isNotNull", function(value) {
    return value != null;
});

// Registrar helper para comprobar si un índice es par
hbs.registerHelper('isEven', function (index) {
    return index % 2 === 0;
});

hbs.registerHelper('capitalize', function (text) {
    if (typeof text !== 'string') return '';
    return text.charAt(0).toUpperCase() + text.slice(1).toLowerCase();
});

hbs.registerHelper('ifEquals', function(arg1, arg2, options) {
    return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
});