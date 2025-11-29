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


function adminOnly(req, res, next) {
    if (!req.session.user) return res.redirect('/login');
    if (req.session.user.role !== 'admin') return res.status(403).send("Nincs jogosultságod ide belépni!");
    next();
}

const adminRoutes = express.Router();
adminRoutes.use(adminOnly);
app.use('/admin', adminRoutes);





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

    db.query('SELECT * FROM pizzas ORDER BY id DESC', (err, results) => {
        if (err) throw err;
        res.render('pages/menu', { pizzas: results });
    });

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


// Megrendelés űrlap pizza_id alapján
app.get('/rendeles/:pizzaId', (req, res) => {
    if (!req.session.user) {
        return res.send("Előbb jelentkezz be a rendeléshez!");
    }

    const pizzaId = req.params.pizzaId;

    db.query('SELECT * FROM pizzas WHERE id = ?', [pizzaId], (err, results) => {
        if (err) return res.send("Hiba történt a pizza lekérésekor.");

        if (results.length === 0) return res.send("Nincs ilyen pizza!");

        const pizza = results[0];
        const user = req.session.user;

        res.render('pages/order_form', { pizza, user, error: null });
    });
});


// Megrendelés leadása
app.post('/rendeles', (req, res) => {
    if (!req.session.user) {
        return res.send("Előbb jelentkezz be a rendeléshez!");
    }

    const userId = req.session.user.id;
    const { pizzaId, darab, cim } = req.body;

    if (!darab || !cim) {
        return res.send("Kérlek, add meg a darabszámot és a címet!");
    }

    const sql = `
        INSERT INTO rendeles (pizza_id, user_id, darab, cim, felvetel)
        VALUES (?, ?, ?, ?, NOW())
    `;

    db.query(sql, [pizzaId, userId, darab, cim], (err, results) => {
        if (err) {
            console.error(err);
            return res.send("Hiba történt a rendelés leadásakor.");
        }

       // res.send("Rendelés sikeresen leadva!");
        res.redirect('/rendeles_siker');
    });
});

app.get('/rendeles_siker', (req, res) => {
    res.render('pages/rendeles_siker');
});

//admin





// Üzenetek
adminRoutes.get('/messages', (req, res) => {
    db.query('SELECT * FROM contacts ORDER BY created_at DESC', (err, results) => {
        if (err) throw err;
        res.render('admin/messages', { messages: results });
    });
});

//Pizza

adminRoutes.get('/pizzas', (req, res) => {
    db.query('SELECT * FROM pizzas ORDER BY id DESC', (err, results) => {
        if (err) throw err;
        res.render('admin/pizzas', { pizzas: results });
    });
});

// Új pizza űrlap (Create)
adminRoutes.get('/pizzas/create', (req, res) => {
    res.render('admin/pizzas/create', {error: null} );
});

adminRoutes.post('/pizzas/create', (req, res) => {
    const { name,  category, vegetarian, price, image } = req.body;
    db.query('INSERT INTO pizzas (name, category, vegetarian, price) VALUES (?, ?, ?, ?)',
        [name, category, vegetarian, price],
        (err) => {
            if (err) throw err;
            res.redirect('/admin/pizzas');
        }
    );
});

// Szerkesztés (Update)
adminRoutes.get('/pizzas/edit/:id', (req, res) => {
    const id = req.params.id;
    db.query('SELECT * FROM pizzas WHERE id = ?', [id], (err, results) => {
        if (err) throw err;
        res.render('admin/pizzas/edit', { pizza: results[0], error: null});
    });
});


adminRoutes.post('/pizzas/update/:id', (req, res) => {
    const id = req.params.id;
    const { name, category, vegetarian, price, image } = req.body;
    db.query('UPDATE pizzas SET name=?, category=?, vegetarian=?, price=? WHERE id=?',
        [name, category, vegetarian, price, id],
        (err) => {
            if (err) throw err;
            res.redirect('/admin/pizzas');
        }
    );
});

// Törlés (Delete)
adminRoutes.get('/pizzas/delete/:id', (req, res) => {
    const id = req.params.id;
    db.query('DELETE FROM pizzas WHERE id=?', [id], (err) => {
        if (err) throw err;
        res.redirect('/admin/pizzas');
    });
});

// Rendelések
adminRoutes.get('/orders', (req, res) => {
    const sql = `
        SELECT rendeles.*, pizzas.name AS pizza_name, users.username AS user_name
        FROM rendeles
        JOIN pizzas ON rendeles.pizza_id = pizzas.id
        JOIN users ON rendeles.user_id = users.id
        ORDER BY rendeles.felvetel DESC
    `;

    db.query(sql, (err, results) => {
        if (err) throw err;
        res.render('admin/orders', { orders: results });
    });
});


app.use('/admin', adminRoutes);
