-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 13 jan. 2026 à 19:59
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pousinade`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

CREATE TABLE `actualite` (
  `id_actualite` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `resume` text DEFAULT NULL,
  `contenu` text NOT NULL,
  `date_publication` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`id_actualite`, `titre`, `resume`, `contenu`, `date_publication`) VALUES
(1, 'Reprise des ateliers de danse Renaissance', 'Les ateliers de danse reprennent en janvier 2025', 'Nous sommes heureux de vous annoncer la reprise de nos ateliers de danse Renaissance. Venez découvrir les branles et pavanes au son du graille catalan, du fifre et du tambour. Une ambiance conviviale vous attend au Centre Pierre Cardinal.', '2025-01-05 10:00:00'),
(2, 'Stage de teinture végétale en juillet', 'Inscriptions ouvertes pour le stage du 5 juillet', 'Apprenez à teindre vos tissus avec des plantes utilisées au XVIème siècle. Ce stage d\'une journée vous permettra de découvrir les techniques de mordançage et l\'utilisation d\'additifs pour modifier les couleurs. Places limitées, inscrivez-vous rapidement !', '2025-01-08 14:30:00'),
(3, 'Nouveaux cours de chant occitan', 'Deux créneaux disponibles pour les cours de chant', 'Les cours de chant occitan sont désormais proposés tous les mercredis. Que vous soyez débutant ou confirmé, venez apprendre un répertoire historique et ludique tout en travaillant votre technique vocale. Premier cours le 15 janvier.', '2025-01-10 16:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `actualite_admin`
--

CREATE TABLE `actualite_admin` (
  `id_actualite` int(11) NOT NULL,
  `id_administrateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `actualite_admin`
--

INSERT INTO `actualite_admin` (`id_actualite`, `id_administrateur`) VALUES
(1, 1),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_administrateur` int(11) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `courriel` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_administrateur`, `mot_de_passe`, `courriel`) VALUES
(1, '$2y$10$admin1hashpassword123', 'admin@lesobragos.fr'),
(2, '$2y$10$admin2hashpassword456', 'coordination@lesobragos.fr'),
(3, '$2y$10$admin3hashpassword789', 'contact@lesobragos.fr');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id_message` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `courriel` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `date_envoi` date DEFAULT curdate(),
  `objet` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id_message`, `nom`, `prenom`, `courriel`, `message`, `date_envoi`, `objet`) VALUES
(1, 'Morel', 'Camille', 'camille.morel@email.fr', 'Bonjour, je souhaiterais m\'inscrire aux cours de danse Renaissance. Faut-il venir avec un partenaire ? Merci.', '2025-01-11', 'Inscription danse Renaissance'),
(2, 'Blanc', 'Laurent', 'laurent.blanc@email.fr', 'Bonjour, pouvez-vous me confirmer les dates exactes du stage de teinture végétale ? Y a-t-il des places disponibles ?', '2025-01-12', 'Stage teinture végétale'),
(3, 'Aubert', 'Sophie', 'sophie.aubert@email.fr', 'Je suis intéressée par les cours de calligraphie. Quel est le matériel à prévoir pour commencer ?', '2025-01-13', 'Informations calligraphie');

-- --------------------------------------------------------

--
-- Structure de la table `contact_utilisateur`
--

CREATE TABLE `contact_utilisateur` (
  `id_message` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contact_utilisateur`
--

INSERT INTO `contact_utilisateur` (`id_message`, `id_utilisateur`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id_evenement` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `animateur` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id_evenement`, `titre`, `date`, `prix`, `description`, `animateur`) VALUES
(1, 'Danse Renaissance', '2025-01-16 20:15:00', 0.00, 'Envie de danser ou de faire danser ? Venez découvrir nos ateliers où branles et pavanes naissent au son du graille catalan, du fifre et du tambour ! Niveau débutant/intermédiaire. Un jeudi sur deux (hors congés scolaires) de 20h15 à 22h00. Lieu : Centre Pierre Cardinal – Le Puy en Velay (salle d\'expression au 1er étage).', 'Marie Dubois'),
(2, 'Calligraphie', '2025-01-16 17:30:00', 0.00, 'Un travail personnel en dehors des cours sera nécessaire pour évoluer dans cette pratique. Le matériel nécessaire durant les cours sera mis à votre disposition. Niveau débutant/intermédiaire. Tous les jeudis de 17h30 à 20h30. Lieu : Centre Pierre Cardinal – Le Puy en Velay.', 'Pierre Fontaine'),
(3, 'Teinture Végétale', '2025-07-05 09:00:00', 45.00, 'Vous apprendrez à teindre vos tissus, laine, lin, soie, coton et fil de laine sur échantillons après préparation (mordançage) à partir de matières premières végétales connues & employées au XVIème siècle. Vous découvrirez également comment utiliser des additifs pour modifier le rendu des couleurs. Niveau débutant/intermédiaire. Samedi 5 juillet 2025 de 9h00 à 17h30 (repas pris sur place). Lieu : Local des Obragos – 5 rue de Pranaud – ZI de Pranaud – Coubon.', 'Sophie Garnier'),
(4, 'Travail du cuir', '2025-01-19 08:30:00', 0.00, 'La totalité de la formation s\'étendra sur 3 années avec la découverte de nouvelles techniques et la fabrication d\'objets de plus en plus élaborés. Niveau débutant. Les dimanches de 8h30 à 17h00 (repas tiré du sac). Lieu : Jules Ferry 29 rue Raphaël – Le Puy en Velay (salle de couture au 1er étage).', 'Luc Morel'),
(5, 'Chant', '2025-01-15 18:00:00', 0.00, 'Ces cours sont destinés à tous. Ils se répartiront entre techniques vocales et apprentissage d\'un répertoire de chants occitans historiques et ludiques. Tous niveaux. Les mercredis de 18h00 à 19h00 (2ème cours éventuel de 19h15 à 20h15). Lieu : Jules Ferry 29 rue Raphaël – Le Puy en Velay (salle de couture au 1er étage).', 'Claire Roussel');

-- --------------------------------------------------------

--
-- Structure de la table `evenement_admin`
--

CREATE TABLE `evenement_admin` (
  `id_evenement` int(11) NOT NULL,
  `id_administrateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenement_admin`
--

INSERT INTO `evenement_admin` (`id_evenement`, `id_administrateur`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id_image` int(11) NOT NULL,
  `nom_fichier` varchar(255) NOT NULL,
  `chemin` varchar(500) NOT NULL,
  `texte_alternatif` varchar(255) DEFAULT NULL,
  `date_telechargement` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id_image`, `nom_fichier`, `chemin`, `texte_alternatif`, `date_telechargement`) VALUES
(1, 'danse-renaissance.jpg', '/uploads/images/danse-renaissance.jpg', 'Atelier de danse Renaissance avec costumes d\'époque', '2026-01-13 19:58:55'),
(2, 'calligraphie-medievale.jpg', '/uploads/images/calligraphie-medievale.jpg', 'Pratique de la calligraphie médiévale', '2026-01-13 19:58:55'),
(3, 'teinture-vegetale.jpg', '/uploads/images/teinture-vegetale.jpg', 'Échantillons de tissus teints avec des plantes', '2026-01-13 19:58:55');

-- --------------------------------------------------------

--
-- Structure de la table `image_actualite`
--

CREATE TABLE `image_actualite` (
  `id_image` int(11) NOT NULL,
  `id_actualite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `image_actualite`
--

INSERT INTO `image_actualite` (`id_image`, `id_actualite`) VALUES
(1, 1),
(2, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `image_evenement`
--

CREATE TABLE `image_evenement` (
  `id_image` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `image_evenement`
--

INSERT INTO `image_evenement` (`id_image`, `id_evenement`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `courriel` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `courriel`, `mot_de_passe`) VALUES
(1, 'Roussel', 'marie.roussel@email.fr', '$2y$10$abcdefghijklmnopqrstuv'),
(2, 'Fontaine', 'pierre.fontaine@email.fr', '$2y$10$wxyzabcdefghijklmnopqr'),
(3, 'Garnier', 'lucie.garnier@email.fr', '$2y$10$stuvwxyzabcdefghijklmn');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_contact`
--

CREATE TABLE `utilisateur_contact` (
  `id_utilisateur` int(11) NOT NULL,
  `id_message` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur_contact`
--

INSERT INTO `utilisateur_contact` (`id_utilisateur`, `id_message`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actualite`
--
ALTER TABLE `actualite`
  ADD PRIMARY KEY (`id_actualite`);

--
-- Index pour la table `actualite_admin`
--
ALTER TABLE `actualite_admin`
  ADD PRIMARY KEY (`id_actualite`,`id_administrateur`),
  ADD KEY `fk_actu_admin_admin` (`id_administrateur`);

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_administrateur`),
  ADD UNIQUE KEY `courriel` (`courriel`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_message`);

--
-- Index pour la table `contact_utilisateur`
--
ALTER TABLE `contact_utilisateur`
  ADD PRIMARY KEY (`id_message`,`id_utilisateur`),
  ADD KEY `fk_cont_util_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id_evenement`);

--
-- Index pour la table `evenement_admin`
--
ALTER TABLE `evenement_admin`
  ADD PRIMARY KEY (`id_evenement`,`id_administrateur`),
  ADD KEY `fk_even_admin_admin` (`id_administrateur`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image`);

--
-- Index pour la table `image_actualite`
--
ALTER TABLE `image_actualite`
  ADD PRIMARY KEY (`id_image`,`id_actualite`),
  ADD KEY `fk_img_actu_actualite` (`id_actualite`);

--
-- Index pour la table `image_evenement`
--
ALTER TABLE `image_evenement`
  ADD PRIMARY KEY (`id_image`,`id_evenement`),
  ADD KEY `fk_img_even_evenement` (`id_evenement`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `courriel` (`courriel`);

--
-- Index pour la table `utilisateur_contact`
--
ALTER TABLE `utilisateur_contact`
  ADD PRIMARY KEY (`id_utilisateur`,`id_message`),
  ADD KEY `fk_util_cont_contact` (`id_message`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actualite`
--
ALTER TABLE `actualite`
  MODIFY `id_actualite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_administrateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_evenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actualite_admin`
--
ALTER TABLE `actualite_admin`
  ADD CONSTRAINT `fk_actu_admin_actualite` FOREIGN KEY (`id_actualite`) REFERENCES `actualite` (`id_actualite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_actu_admin_admin` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateur` (`id_administrateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contact_utilisateur`
--
ALTER TABLE `contact_utilisateur`
  ADD CONSTRAINT `fk_cont_util_contact` FOREIGN KEY (`id_message`) REFERENCES `contact` (`id_message`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cont_util_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evenement_admin`
--
ALTER TABLE `evenement_admin`
  ADD CONSTRAINT `fk_even_admin_admin` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateur` (`id_administrateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_even_admin_evenement` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_actualite`
--
ALTER TABLE `image_actualite`
  ADD CONSTRAINT `fk_img_actu_actualite` FOREIGN KEY (`id_actualite`) REFERENCES `actualite` (`id_actualite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_img_actu_image` FOREIGN KEY (`id_image`) REFERENCES `image` (`id_image`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image_evenement`
--
ALTER TABLE `image_evenement`
  ADD CONSTRAINT `fk_img_even_evenement` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_img_even_image` FOREIGN KEY (`id_image`) REFERENCES `image` (`id_image`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur_contact`
--
ALTER TABLE `utilisateur_contact`
  ADD CONSTRAINT `fk_util_cont_contact` FOREIGN KEY (`id_message`) REFERENCES `contact` (`id_message`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_util_cont_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
