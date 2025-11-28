const express = require('express');
const expressLayouts = require('express-ejs-layouts');
const path = require('path');
const session = require('express-session');
const mysql = require('mysql2');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const app = express();
const PORT = 3000;


// EJS beállítás
app.set('layout', 'layout');  // ha a layoutod views/layouts/main.ejs
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// express-ejs-layouts használata
app.use(expressLayouts);

// statikus mappa
app.use(express.static(path.join(__dirname, 'public')));

// Template engine

// Form data
app.use(express.urlencoded({ extended: true }));

// Session
app.use(session({
    secret: 'nagyonTitkosJelszo123',
    resave: false,
    saveUninitialized: true
}));

app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    res.locals.successMessage = null;
    res.locals.errorMessage = null;
    next();
});



// MySQL kapcsolat
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// Teszt kapcsolat
db.connect((err) => {
    if (err) throw err;
    console.log("MySQL kapcsolat sikeres!");
});



// Főoldal
app.get('/', (req, res) => {
    res.render('pages/home');
});

// --- REGISZTRÁCIÓ ---
app.post('/register', (req, res) => {
    const { felhasznalo, jelszo } = req.body;

    const hash = bcrypt.hashSync(jelszo, 10);

    db.query('INSERT INTO users (username, password) VALUES (?, ?)',
        [felhasznalo, hash],
        (err) => {
            if (err) return res.send("Hiba: " + err);
            res.send("Sikeres regisztráció! <a href='/login'>Bejelentkezés</a>");

        }
    );
});



// --- KIJELENTKEZÉS ---
app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) return res.send("Hiba kijelentkezéskor: " + err);
       // res.send("Sikeresen kijelentkeztél! <a href='/bejelentkezes'>Bejelentkezés</a>");
        res.redirect("/");
    });
});

// --- OLDALAK ---
app.get('/register', (req, res) => {
    res.render('pages/regisztracio');
});

app.get('/login', (req, res) => {
    res.render('pages/bejelentkezes');
});


// --- BEJELENTKEZÉS ---
app.post('/login', (req, res) => {
    const { felhasznalo, jelszo } = req.body;

    db.query('SELECT * FROM users WHERE username = ?', [felhasznalo], (err, eredmeny) => {
        if (err) {
            return res.render('pages/bejelentkezes', {
                errorMessage: "Hiba történt a bejelentkezés során."
            });
        }

        if (eredmeny.length === 0) {
            return res.render('pages/bejelentkezes', {
                errorMessage: "Nincs ilyen felhasználó."
            });
        }

        const user = eredmeny[0];

        const jelszoEgyezik = bcrypt.compareSync(jelszo, user.password);

        if (!jelszoEgyezik) {
            return res.render('pages/bejelentkezes', {
                errorMessage: "Hibás jelszó!"
            });
        }

        req.session.user = user;
        res.redirect("/"); // Sikeres bejelentkezéskor a főoldalra irányít
    });
});




// Start
app.listen(PORT, () => {
    console.log(`Szerver fut: http://localhost:${PORT}`);
});

app.get('/menu', (req, res) => {
    res.render('pages/menu', { successMessage: null });
});


// Kapcsolat űrlap megjelenítése
app.get('/kapcsolat', (req, res) => {
    res.render('pages/kapcsolat', { successMessage: null, errorMessage: null });
});



// Kapcsolat POST
app.post('/kapcsolat', (req, res) => {
    console.log("POST /kapcsolat megérkezett:", req.body);

    const { nev, email, uzenet } = req.body;
    const sql = "INSERT INTO contacts (name, email, message, created_at) VALUES (?, ?, ?, NOW())";

    db.query(sql, [nev, email, uzenet], (err) => {
        if (err) {
            console.error("MySQL hiba:", err);
            return res.render('pages/kapcsolat', {
                successMessage: null,
                errorMessage: "Hiba történt az üzenet küldésekor."
            });
        }

        return res.render('pages/kapcsolat', {
            successMessage: "Üzenet sikeresen elküldve!",
            errorMessage: null
        });
    });
});



//admin



// Üzenetek
app.get('admin/messages', (req, res) => {
    db.query('SELECT * FROM contacts ORDER BY created_at DESC', (err, results) => {
        if (err) throw err;
        res.render('admin/messages', { messages: results });
    });
});
