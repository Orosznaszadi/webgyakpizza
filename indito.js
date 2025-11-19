const express = require('express');
const session = require('express-session');
const mysql = require('mysql2');
const bcrypt = require('bcryptjs');

const app = express();
const PORT = 3000;

// Template engine
app.set('view engine', 'ejs');

// Form data
app.use(express.urlencoded({ extended: true }));

// Session
app.use(session({
    secret: 'nagyonTitkosJelszo123',
    resave: false,
    saveUninitialized: true
}));

// MySQL kapcsolat
const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'studb151',
    password: 'Studb151#2024',
    database: 'db151'
});

// Teszt kapcsolat
db.connect((err) => {
    if (err) throw err;
    console.log("MySQL kapcsolat sikeres!");
});

// Főoldal
app.get('/', (req, res) => {
    res.send("A szerver működik 👍");
});

// --- REGISZTRÁCIÓ ---
app.post('/regisztracio', (req, res) => {
    const { felhasznalo, jelszo } = req.body;

    const hash = bcrypt.hashSync(jelszo, 10);

    db.query('INSERT INTO users (username, password) VALUES (?, ?)',
        [felhasznalo, hash],
        (err) => {
            if (err) return res.send("Hiba: " + err);
            res.send("Sikeres regisztráció! <a href='/bejelentkezes'>Bejelentkezés</a>");
        }
    );
});

// --- BEJELENTKEZÉS ---
app.post('/bejelentkezes', (req, res) => {
    const { felhasznalo, jelszo } = req.body;

    db.query('SELECT * FROM users WHERE username = ?', [felhasznalo], (err, eredmeny) => {
        if (err) return res.send("Hiba: " + err);
        if (eredmeny.length === 0) return res.send("Nincs ilyen felhasználó.");

        const user = eredmeny[0];

        // bcrypt összehasonlítás
        const jelszoEgyezik = bcrypt.compareSync(jelszo, user.password);

        if (!jelszoEgyezik) {
            return res.send("Hibás jelszó!");
        }

        req.session.user = user;
        res.send("Sikeres bejelentkezés!");
    });
});

// --- KIJELENTKEZÉS ---
app.get('/kijelentkezes', (req, res) => {
    req.session.destroy((err) => {
        if (err) return res.send("Hiba kijelentkezéskor: " + err);
        res.send("Sikeresen kijelentkeztél! <a href='/bejelentkezes'>Bejelentkezés</a>");
    });
});

// --- OLDALAK ---
app.get('/regisztracio', (req, res) => {
    res.render('regisztracio');
});

app.get('/bejelentkezes', (req, res) => {
    res.render('bejelentkezes');
});

// Start
app.listen(PORT, () => {
    console.log(`Szerver fut: http://localhost:${PORT}`);
});

// Kapcsolat űrlap megjelenítése
app.get('/kapcsolat', (req, res) => {
    res.render('kapcsolat');
});

// Kapcsolat POST
app.post('/kapcsolat', (req, res) => {
    const { nev, email, uzenet } = req.body;

    const sql = "INSERT INTO kapcsolat (nev, email, uzenet, kuldve) VALUES (?, ?, ?, NOW())";

    db.query(sql, [nev, email, uzenet], (err) => {
        if (err) throw err;
        res.send("Üzenet sikeresen elküldve!");
    });
});
