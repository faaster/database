-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 30 Avril 2017 à 21:58
-- Version du serveur :  5.5.42
-- Version de PHP :  7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `faaster`
--

-- --------------------------------------------------------

--
-- Structure de la table `functions`
--

CREATE TABLE `functions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `functions`
--

INSERT INTO `functions` (`id`, `title`, `code`, `user_id`) VALUES
(1, 'The answer to life, the universe and everything', 'return 42;', 1),
(2, 'Additionner deux chiffres', '$integer1 = intval($_GET["chiffre1"]);\r\n$integer2 = intval($_GET["chiffre2"]);\r\n\r\nreturn $integer1 + $integer2;', 2),
(3, 'SHA1 d''une valeur', 'return sha1($_GET[''valeur'']);', 2),
(4, 'Message en HTML', 'return "<h1>Bonjour, " . $_GET[''name''] . "</h1>";', 2),
(5, 'Prix d''un bitcoin en dollar', '// Adresse de l''API de Poloniex (banque de bitcoins) :\r\n$url = "https://poloniex.com/public?command=returnTicker";\r\n\r\n// TÃ©lÃ©chargement du cours des valeurs des monnaies virtuelles :\r\n$json = file_get_contents($url);\r\n\r\n// Transformation du format JSON vers un tableau de correspondance en PHP :\r\n$data = json_decode($json, TRUE);\r\n\r\n// Affichage de la valeur actuelle d''un bitcoin (en dollars) :\r\nreturn $data["USDT_BTC"]["last"];', 2),
(6, 'Suite de Fibonacci', '// A propos :\r\n// https://fr.wikipedia.org/wiki/Suite_de_Fibonacci\r\n\r\nreturn round(pow((sqrt(5)+1)/2, $_GET[''n'']) / sqrt(5));', 2);

-- --------------------------------------------------------

--
-- Structure de la table `instances`
--

CREATE TABLE `instances` (
  `id` int(11) NOT NULL,
  `params` text NOT NULL,
  `duration` decimal(5,4) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `function_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `amount` decimal(10,2) unsigned NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `token`, `full_name`) VALUES
(1, 'robert@gmail.com', 'secret', 'secret1', 'Robert H.'),
(2, 'bob@gmail.com', 'secret', '1351361603', 'Bob');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `functions`
--
ALTER TABLE `functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `instances`
--
ALTER TABLE `instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `function_id` (`function_id`);

--
-- Index pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `month_2` (`month`,`year`,`user_id`),
  ADD KEY `paid_at` (`paid_at`),
  ADD KEY `amount` (`amount`),
  ADD KEY `year` (`year`),
  ADD KEY `month` (`month`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `month_3` (`month`,`year`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `functions`
--
ALTER TABLE `functions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `instances`
--
ALTER TABLE `instances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `functions`
--
ALTER TABLE `functions`
  ADD CONSTRAINT `functions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `instances`
--
ALTER TABLE `instances`
  ADD CONSTRAINT `instances_ibfk_1` FOREIGN KEY (`function_id`) REFERENCES `functions` (`id`);

--
-- Contraintes pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
