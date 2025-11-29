-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2025 at 10:28 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza_webgy`
--

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalok`
--

CREATE TABLE `felhasznalok` (
                                `id` int(10) UNSIGNED NOT NULL,
                                `csaladi_nev` varchar(45) NOT NULL DEFAULT '',
                                `utonev` varchar(45) NOT NULL DEFAULT '',
                                `bejelentkezes` varchar(12) NOT NULL DEFAULT '',
                                `jelszo` varchar(256) NOT NULL DEFAULT '',
                                `jogosultsag` varchar(3) NOT NULL DEFAULT '_1_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `csaladi_nev`, `utonev`, `bejelentkezes`, `jelszo`, `jogosultsag`) VALUES
                                                                                                         (1, 'Rendszer', 'Admin', 'Admin', '$2y$10$ddawaPrQWvNedDL4g9990OK1G19mj3opCZduhghmCn5wNhKXkzgk6', '__1'),
                                                                                                         (2, 'Családi2', 'Utónév2', 'Login2', '$2y$10$9nBksKil4rXXMPuOMmcnI.bFi.urcvn.pIKInBk7R9ms/HQa4pYum', '_1_'),
                                                                                                         (3, 'Családi3', 'Utónév3', 'Login3', '$2y$10$4XKmIZ2N0jXnGxix7IJh5Omur9pF8BLxJXcQcoJYHR.uBwtu7aIgC', '_1_'),
                                                                                                         (4, 'Családi4', 'Utónév4', 'Login4', '$2y$10$OAHF1rtRkAAAU.ASPFUDEuH2m8hxgSZtHu4ocpMM4KysgayA5Dtem', '_1_'),
                                                                                                         (5, 'Családi5', 'Utónév5', 'Login5', '$2y$10$hI001nAL9WMUezbWVcp2/OzGeCHbJ5ej3tP/jiMM55QcMEpyqxXye', '_1_'),
                                                                                                         (6, 'Családi6', 'Utónév6', 'Login6', '$2y$10$FZWEHZwMlpse5wAZ81fOcOzeCtQLrpy74zAiEmDoJFYkL0Dc6imQa', '_1_'),
                                                                                                         (7, 'Családi7', 'Utónév7', 'Login7', '$2y$10$k1nxQc4V5Jb8nzF05VB/refCWE5H3QailLP3XxdfDV/JYdnYMTaX6', '_1_'),
                                                                                                         (8, 'Családi8', 'Utónév8', 'Login8', '$2y$10$vw6QmMwyTb5zPnP4V8Otr.Xp2zvrX0GBVyddDGoSKqZ8pb3k4A502', '_1_'),
                                                                                                         (9, 'Családi9', 'Utónév9', 'Login9', '$2y$10$PpUzPwc/dHYYM.GyCV8Wq.rlrXeJbkfUmIyHqbqfM5gN46artAxOW', '_1_'),
                                                                                                         (10, 'Családi10', 'Utónév10', 'Login10', '$2y$10$sqYZSb2LYS6WCx0Gbr1VYurqZOuI4vqSdbw50fdv4XuNHoT/y3ooK', '_1_'),
                                                                                                         (11, 'Családi11', 'Utónév11', 'Login11', '$2y$10$cUmJMTywo5unQaSBS/OHSeOb46jboo4vZYADqWvQQa1Mu.tE2mPXW', '_1_'),
                                                                                                         (12, 'Családi12', 'Utónév12', 'Login12', '$2y$10$GztbZd1eJ6wvsE3k2cz7ZeGTLGeXbSRU3YC9SwBAkLYp39bravOY2', '_1_'),
                                                                                                         (13, 'Családi13', 'Utónév13', 'Login13', '$2y$10$hH/V9VMqct/icTsfKbdwBeQBCkxljS7i2w1stArCKyEFSAGWe0pJy', '_1_'),
                                                                                                         (14, 'Családi14', 'Utónév14', 'Login14', '$2y$10$waXnjt1yX7CfVh0j9Bs19O5GKQKpms.ahHUweqtL4jDlbUB0Du81e', '_1_'),
                                                                                                         (15, 'Családi15', 'Utónév15', 'Login15', '$2y$10$WfTJY.iTq0F3lj.7Bh0bdubFuXVsct0BlIj.ybXypGKbMuOJvaTqG', '_1_'),
                                                                                                         (16, 'Családi16', 'Utónév16', 'Login16', '$2y$10$QLP.wvLLkez1N775HTIRG.h641hjkjBrAlBluNzdxM9LWaNUwNySa', '_1_'),
                                                                                                         (17, 'Családi17', 'Utónév17', 'Login17', '$2y$10$n0MbId841T1BTvjJp6X58OS9mH4LrelusgLWjyc4REMoUekCBNV16', '_1_'),
                                                                                                         (18, 'Családi18', 'Utónév18', 'Login18', '$2y$10$7wbVWsRasSGt6GzuR.2UjeqE/fkO0soYTpD.IJGFqZ2o7EpML4eQa', '_1_'),
                                                                                                         (19, 'Családi19', 'Utónév19', 'Login19', '$2y$10$53IXxKKJQynohuWhemGIyOurpGdhgcNJTi/dJmxqU1PHS/aelV5Ta', '_1_'),
                                                                                                         (20, 'Családi20', 'Utónév20', 'Login20', '$2y$10$OS30D2cXQRwIKnKsbK7CxOhoiP2mLqETCm7aH553o3XZugIDB21aO', '_1_'),
                                                                                                         (21, 'Családi21', 'Utónév21', 'Login21', '$2y$10$Zo4sly3u9Vx81mM5kF3j/e985uFdT9mL5vtOBtTWroiYhnzC6K1ky', '_1_'),
                                                                                                         (22, 'Családi22', 'Utónév22', 'Login22', '$2y$10$3Cj8QIAbT56hmO6xzNq6LuYaiayBs2642Utcc9arqNyI8O7iH98SK', '_1_'),
                                                                                                         (23, 'Családi23', 'Utónév23', 'Login23', '$2y$10$lFowGXTQHlxVZqcugpJhIe7fSlGLtfCVoinbaEiXyBstID.0hJccW', '_1_'),
                                                                                                         (24, 'Családi24', 'Utónév24', 'Login24', '$2y$10$nA8ek7j/r39FedBvG9/REe/ztBVQcL0zKYJA0v1C5lNSyaUz0qege', '_1_'),
                                                                                                         (25, 'Családi25', 'Utónév25', 'Login25', '$2y$10$jf91LxMY6kmbiAM410xYn.ojPVIEyH6AhZkoDPR4umg3IKl6lLRU.', '_1_');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
                        `url` varchar(30) NOT NULL,
                        `nev` varchar(30) NOT NULL,
                        `szulo` varchar(30) NOT NULL,
                        `jogosultsag` varchar(3) NOT NULL,
                        `sorrend` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`url`, `nev`, `szulo`, `jogosultsag`, `sorrend`) VALUES
                                                                         ('admin', 'Admin', '', '001', 80),
                                                                         ('alapinfok', 'Alapinfók', 'elerhetoseg', '111', 40),
                                                                         ('belepes', 'Belépés', '', '100', 60),
                                                                         ('elerhetoseg', 'Elérhetőség', '', '111', 20),
                                                                         ('kiegeszitesek', 'Kiegészítések', 'elerhetoseg', '011', 50),
                                                                         ('kilepes', 'Kilépés', '', '011', 70),
                                                                         ('linkek', 'Linkek', '', '100', 30),
                                                                         ('nyitolap', 'Nyitólap', '', '111', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `username` varchar(50) NOT NULL,
                         `password` varchar(255) NOT NULL,
                         `role` enum('registered','admin') DEFAULT 'registered'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
                                                               (1, 'szabolcs', '$2b$10$5oTBx9an/6hfHxWJBsuLMeO4qzurnhpLhydd/53gNeVQJhG/hHgJS', 'registered'),
                                                               (2, 'kriszta', '$2b$10$WURKSzxNGUXOUngHxIeEC.nY7n3OTlX8msNCtRWp4bxDvLhguO03G', 'admin');



CREATE TABLE `contacts` (
                            `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL,
                            `email` varchar(255) NOT NULL,
                            `message` text NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE pizzas (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(255) NOT NULL,
                        description TEXT,
                        category VARCHAR(255),
                        price DECIMAL(6,2) NOT NULL,
                        vegetarian INT,
                        image VARCHAR(255),
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Dump a pizzas táblához
-- ----------------------------

INSERT INTO pizzas (name, description, category, price, vegetarian, image)
VALUES
    ('Áfonyás', '', 'király', 1250, 0, ''),
    ('Babos', '', 'lovag', 1150, 0, ''),
    ('Barbecue chicken', '', 'lovag', 1150, 0, ''),
    ('Betyáros', '', 'király', 1250, 0, ''),
    ('Caribi', '', 'apród', 850, 0, ''),
    ('Country', '', 'király', 1250, 0, ''),
    ('Csabesz', '', 'király', 1250, 0, ''),
    ('Csupa sajt', '', 'lovag', 1150, 1, ''),
    ('Erdő kapitánya', '', 'apród', 850, 0, ''),
    ('Erős János', '', 'lovag', 1150, 0, ''),
    ('Excellent', '', 'király', 1250, 0, ''),
    ('Főnök kedvence', '', 'lovag', 1150, 0, ''),
    ('Francia', '', 'főnemes', 950, 0, ''),
    ('Frankfurti', '', 'király', 1250, 0, ''),
    ('Füstös', '', 'lovag', 1150, 0, ''),
    ('Gino', '', 'király', 1250, 0, ''),
    ('Gombás', '', 'apród', 850, 1, ''),
    ('Góré', '', 'lovag', 1150, 0, ''),
    ('Görög', '', 'király', 1250, 0, ''),
    ('Gyros pizza', '', 'király', 1250, 0, ''),
    ('HamAndEggs', '', 'lovag', 1150, 0, ''),
    ('Hamm', '', 'lovag', 1150, 0, ''),
    ('Hawaii', '', 'főnemes', 950, 0, ''),
    ('Hellas', '', 'király', 1250, 0, ''),
    ('Hercegnő', '', 'király', 1250, 0, ''),
    ('Ilike', '', 'lovag', 1150, 0, ''),
    ('Ínyenc', '', 'lovag', 1150, 0, ''),
    ('Jázmin álma', '', 'lovag', 1150, 0, ''),
    ('Jobbágy', '', 'király', 1250, 0, ''),
    ('Juhtúrós', '', 'lovag', 1150, 0, ''),
    ('Kagylós', '', 'király', 1250, 0, ''),
    ('Kétszínű', '', 'lovag', 1150, 0, ''),
    ('Kiadós', '', 'király', 1250, 0, ''),
    ('Király pizza', '', 'király', 1250, 0, ''),
    ('Kívánság', '', 'lovag', 1150, 1, ''),
    ('Kolbászos', '', 'apród', 850, 0, ''),
    ('Lagúna', '', 'király', 1250, 1, ''),
    ('Lecsó', '', 'király', 1250, 0, ''),
    ('Maffiózó', '', 'lovag', 1150, 0, ''),
    ('Magvas', '', 'király', 1250, 1, ''),
    ('Magyaros', '', 'lovag', 1150, 0, ''),
    ('Máj Fair Lady', '', 'király', 1250, 0, ''),
    ('Mamma fia', '', 'király', 1250, 0, ''),
    ('Mexikói', '', 'főnemes', 950, 0, ''),
    ('Mixi', '', 'főnemes', 950, 1, ''),
    ('Nikó', '', 'király', 1250, 0, ''),
    ('Nordic', '', 'király', 1250, 0, ''),
    ('Nyuszó-Muszó', '', 'király', 1250, 0, ''),
    ('Pacalos', '', 'lovag', 1150, 0, ''),
    ('Pástétomos', '', 'király', 1250, 0, ''),
    ('Pásztor', '', 'lovag', 1150, 0, ''),
    ('Pipis', '', 'lovag', 1150, 0, ''),
    ('Popey', '', 'király', 1250, 0, ''),
    ('Quattro', '', 'király', 1250, 0, ''),
    ('Ráki', '', 'király', 1250, 0, ''),
    ('Rettenetes magyar', '', 'lovag', 1150, 0, ''),
    ('Röfi', '', 'király', 1250, 0, ''),
    ('Sajtos', '', 'apród', 850, 1, ''),
    ('So-ku', '', 'apród', 850, 0, ''),
    ('Son-go-ku', '', 'főnemes', 950, 1, ''),
    ('Sonkás', '', 'apród', 850, 0, ''),
    ('Spanyol', '', 'király', 1250, 0, ''),
    ('Spencer', '', 'főnemes', 950, 0, ''),
    ('Szalámis', '', 'apród', 850, 0, ''),
    ('Szardíniás', '', 'lovag', 1150, 0, ''),
    ('Szerzetes', '', 'király', 1250, 0, ''),
    ('Szőke kapitány', '', 'király', 1250, 0, ''),
    ('Tenger gyümölcsei', '', 'király', 1250, 0, ''),
    ('Tonhalas', '', 'lovag', 1150, 0, ''),
    ('Törperős', '', 'lovag', 1150, 0, ''),
    ('Tündi kedvence', '', 'király', 1250, 0, ''),
    ('Tüzes halál', '', 'király', 1250, 0, ''),
    ('Vega', '', 'lovag', 1150, 1, ''),
    ('Zöldike', '', 'főnemes', 950, 1, '');


CREATE TABLE rendeles (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          pizza_id INT NOT NULL,
                          user_id INT NOT NULL,
                          darab INT NOT NULL,
                          cim VARCHAR(500) NOT NULL,
                          felvetel DATETIME DEFAULT CURRENT_TIMESTAMP,
                          kiszallitas DATETIME NULL,
                          FOREIGN KEY (pizza_id) REFERENCES pizzas(id) ON DELETE CASCADE,
                          FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


--
-- Indexes for dumped tables
--

--
-- Indexes for table `felhasznalok`
--
ALTER TABLE `felhasznalok`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
    ADD PRIMARY KEY (`url`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `felhasznalok`
--
ALTER TABLE `felhasznalok`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
