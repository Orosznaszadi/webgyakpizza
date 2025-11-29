const mysql = require('mysql2');

// MySQL kapcsolat (UGYANAZ mint az indito.js-ben)
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// A 3 tábla lekérése
module.exports.getAdatbazis = (req, res) => {

    db.query("SELECT * FROM pizzas", (err, pizzak) => {
        if (err) throw err;

        db.query("SELECT * FROM kategoria", (err2, kategoriak) => {
            if (err2) throw err2;

            db.query("SELECT * FROM rendeles", (err3, rendelesek) => {
                if (err3) throw err3;

                res.render("pages/adatbazis", {
                    pizzak,
                    kategoriak,
                    rendelesek
                });
            });
        });
    });

};
