Enuma
len708
•
Etre faible n'est pas une honte, c'est rester faible qui en est une.

eiiko 𖹭

 — 12:00
pas tres grave
puisqu'on doit faire l'api en js
et donc t'as pas le droit à des frameworks ?
pas de expressJS pour l'API ? 
Enuma
 — 12:02
Je pense pas... Mais a voir, j'aurais l'info avant ce soir
Enuma
 — 12:26
Comment on hébèrge sur githubs
?
eiiko 𖹭

 — 12:26
c pénible et ils sont en train de le rendre payant
mais c'est avec Github Actions
et Github Pages potentiellement, jsp 
Enuma
 — 12:27
oula
okok
eiiko 𖹭

 — 13:05
t'as pas push hier du coup ?
Enuma
 — 13:05
si
eiiko 𖹭

 — 13:05
t'as mal fait alors
parcequ'il y a encore mes commits
Enuma
 — 13:05
et merde
eiiko 𖹭

 — 13:05
Image
c pas grave au pire
t'es dispo ce soir ?
Enuma
 — 13:05
oui
eiiko 𖹭

 — 13:05
on le fera
Enuma
 — 13:05
ok
faudrai commencé l'api ce soir je pense si possible, pour que j'ai une base
eiiko 𖹭

 — 13:06
ouais
eiiko 𖹭

 — 15:25
je pourrai pas t'aider ce soir je pense
ou alors tres tard
je suis désolé
on a un gros coup de panique sur notre SAE et le rendu c'est à minuit ce soir 
je dois faire une ENORME merge de plusieurs heures
eiiko 𖹭

 — 15:56
Je tryhard comme un gros taré pendant un cours pas important, je te dirai si on peut voc
Enuma
 — 16:45
tkt prend ton tps, je suis dispo tt la nuit
eiiko 𖹭

 — 16:45
pas moi
Enuma
 — 16:45
oui je sais
eiiko 𖹭

 — 16:45
mais tkt j'ai bien tryhard ca va en fait
j'ai tout merge
Image
ce truc monstrueux
Enuma
 — 16:46
déjà!!!!!????
gsdghfdshhtfjgrdh
eiiko 𖹭

 — 16:46
(les fichiers en rouge sont des fichiers avec des conflits à résoudre)
Enuma
 — 16:46
a
moi y a un monsieur qui est chez moi
il fait des travaux
eiiko 𖹭

 — 16:47
ah haha
offre-lui à boire
de l'eau
le glouglou
Enuma
 — 16:48
g proposé et il a dis non
eiiko 𖹭

 — 16:48
c bon à la santé
rhaaa
Enuma
 — 16:49
XD
Enuma
 — 18:46
dispo?
eiiko 𖹭

 — 18:47
je mets en place la CI/CD du panel admin de ma sae et après oui
max 1h
Enuma
 — 18:47
k ^^
eiiko 𖹭

 — 19:24
c bon
Enuma
 — 19:25
bah mange eton voc stv ^^
eiiko 𖹭

 — 19:25
ok
eiiko 𖹭

 — 19:32
j'ai mon miam
lentilles carottes maison
Enuma
 a commencé un appel. — 19:33
eiiko 𖹭

 — 19:40
git checkout --orphan __wipe_history
git add -A
git commit -m "premier commit"
git branch -D main
git branch -m main
git gc --aggressive --prune=all
Enuma
 — 19:42
j'arrive
eiiko 𖹭

 — 19:42
tkt tkt
je mange
nom
nom
miam
c ca
eiiko 𖹭

 — 19:50
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET NAMES utf8mb4;

-- ==========================================
-- STRUCTURES DE TABLES
Afficher plus
message.txt
11 Ko
﻿
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET NAMES utf8mb4;

-- ==========================================
-- STRUCTURES DE TABLES
-- ==========================================

--
-- Table structure for `actualite`
--
CREATE TABLE `actualite` (
  `id_actualite` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `resume` text DEFAULT NULL,
  `contenu` text NOT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_actualite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `administrateur`
--
CREATE TABLE `administrateur` (
  `id_administrateur` int(11) NOT NULL AUTO_INCREMENT,
  `mot_de_passe` varchar(255) NOT NULL,
  `courriel` varchar(150) NOT NULL,
  PRIMARY KEY (`id_administrateur`),
  UNIQUE KEY `courriel` (`courriel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `actualite_admin`
--
CREATE TABLE `actualite_admin` (
  `id_actualite` int(11) NOT NULL,
  `id_administrateur` int(11) NOT NULL,
  PRIMARY KEY (`id_actualite`,`id_administrateur`),
  KEY `fk_actu_admin_admin` (`id_administrateur`),
  CONSTRAINT `fk_actu_admin_actualite` FOREIGN KEY (`id_actualite`) REFERENCES `actualite` (`id_actualite`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_actu_admin_admin` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateur` (`id_administrateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `contact`
--
CREATE TABLE `contact` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `courriel` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `date_envoi` date DEFAULT curdate(),
  `objet` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `utilisateur`
--
CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `courriel` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `courriel` (`courriel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `contact_utilisateur`
--
CREATE TABLE `contact_utilisateur` (
  `id_message` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_message`,`id_utilisateur`),
  KEY `fk_cont_util_utilisateur` (`id_utilisateur`),
  CONSTRAINT `fk_cont_util_contact` FOREIGN KEY (`id_message`) REFERENCES `contact` (`id_message`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cont_util_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `evenement`
--
CREATE TABLE `evenement` (
  `id_evenement` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `animateur` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_evenement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `evenement_admin`
--
CREATE TABLE `evenement_admin` (
  `id_evenement` int(11) NOT NULL,
  `id_administrateur` int(11) NOT NULL,
  PRIMARY KEY (`id_evenement`,`id_administrateur`),
  KEY `fk_even_admin_admin` (`id_administrateur`),
  CONSTRAINT `fk_even_admin_admin` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateur` (`id_administrateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_even_admin_evenement` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `image`
--
CREATE TABLE `image` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fichier` varchar(255) NOT NULL,
  `chemin` varchar(500) NOT NULL,
  `texte_alternatif` varchar(255) DEFAULT NULL,
  `date_telechargement` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `image_actualite`
--
CREATE TABLE `image_actualite` (
  `id_image` int(11) NOT NULL,
  `id_actualite` int(11) NOT NULL,
  PRIMARY KEY (`id_image`,`id_actualite`),
  KEY `fk_img_actu_actualite` (`id_actualite`),
  CONSTRAINT `fk_img_actu_actualite` FOREIGN KEY (`id_actualite`) REFERENCES `actualite` (`id_actualite`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_img_actu_image` FOREIGN KEY (`id_image`) REFERENCES `image` (`id_image`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `image_evenement`
--
CREATE TABLE `image_evenement` (
  `id_image` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL,
  PRIMARY KEY (`id_image`,`id_evenement`),
  KEY `fk_img_even_evenement` (`id_evenement`),
  CONSTRAINT `fk_img_even_evenement` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_img_even_image` FOREIGN KEY (`id_image`) REFERENCES `image` (`id_image`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for `utilisateur_contact`
--
CREATE TABLE `utilisateur_contact` (
  `id_utilisateur` int(11) NOT NULL,
  `id_message` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_message`),
  KEY `fk_util_cont_contact` (`id_message`),
  CONSTRAINT `fk_util_cont_contact` FOREIGN KEY (`id_message`) REFERENCES `contact` (`id_message`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_util_cont_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ==========================================
-- INSERTION DE DONNEES STUB
-- ==========================================

INSERT INTO `actualite` (`id_actualite`, `titre`, `resume`, `contenu`, `date_publication`) VALUES
(1, 'Reprise des ateliers de danse Renaissance', 'Les ateliers de danse reprennent en janvier 2025', 'Nous sommes heureux de vous annoncer la reprise de nos ateliers de danse Renaissance...', '2025-01-05 10:00:00'),
(2, 'Stage de teinture végétale en juillet', 'Inscriptions ouvertes pour le stage du 5 juillet', 'Apprenez à teindre vos tissus avec des plantes utilisées au XVIème siècle...', '2025-01-08 14:30:00'),
(3, 'Nouveaux cours de chant occitan', 'Deux créneaux disponibles pour les cours de chant', 'Les cours de chant occitan sont désormais proposés tous les mercredis...', '2025-01-10 16:00:00');

INSERT INTO `administrateur` (`id_administrateur`, `mot_de_passe`, `courriel`) VALUES
(1, '$2y$10$admin1hashpassword123', 'admin@lesobragos.fr'),
(2, '$2y$10$admin2hashpassword456', 'coordination@lesobragos.fr'),
(3, '$2y$10$admin3hashpassword789', 'contact@lesobragos.fr');

INSERT INTO `actualite_admin` (`id_actualite`, `id_administrateur`) VALUES
(1, 1), (2, 2), (3, 1);

INSERT INTO `contact` (`id_message`, `nom`, `prenom`, `courriel`, `message`, `date_envoi`, `objet`) VALUES
(1, 'Morel', 'Camille', 'camille.morel@email.fr', 'Bonjour, je souhaiterais m\'inscrire aux cours de danse Renaissance...', '2025-01-11', 'Inscription danse Renaissance'),
(2, 'Blanc', 'Laurent', 'laurent.blanc@email.fr', 'Bonjour, pouvez-vous me confirmer les dates exactes du stage...', '2025-01-12', 'Stage teinture végétale'),
(3, 'Aubert', 'Sophie', 'sophie.aubert@email.fr', 'Je suis intéressée par les cours de calligraphie...', '2025-01-13', 'Informations calligraphie');

-- Dumping data for table `utilisateur`
INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `courriel`, `mot_de_passe`) VALUES
(1, 'Roussel', 'marie.roussel@email.fr', '$2y$10$abcdefghijklmnopqrstuv'),
(2, 'Fontaine', 'pierre.fontaine@email.fr', '$2y$10$wxyzabcdefghijklmnopqr'),
(3, 'Garnier', 'lucie.garnier@email.fr', '$2y$10$stuvwxyzabcdefghijklmn');

-- Dumping data for table `contact_utilisateur`
INSERT INTO `contact_utilisateur` (`id_message`, `id_utilisateur`) VALUES
(1, 1), (2, 2), (3, 3);

-- Dumping data for table `evenement`
INSERT INTO `evenement` (`id_evenement`, `titre`, `date`, `prix`, `description`, `animateur`) VALUES
(1, 'Danse Renaissance', '2025-01-16 20:15:00', 0.00, 'Envie de danser ou de faire danser ? Venez découvrir nos ateliers...', 'Marie Dubois'),
(2, 'Calligraphie', '2025-01-16 17:30:00', 0.00, 'Un travail personnel en dehors des cours sera nécessaire...', 'Pierre Fontaine'),
(3, 'Teinture Végétale', '2025-07-05 09:00:00', 45.00, 'Vous apprendrez à teindre vos tissus, laine, lin, soie...', 'Sophie Garnier'),
(4, 'Travail du cuir', '2025-01-19 08:30:00', 0.00, 'La totalité de la formation s\'étendra sur 3 années...', 'Luc Morel'),
(5, 'Chant', '2025-01-15 18:00:00', 0.00, 'Ces cours sont destinés à tous. Ils se répartiront entre techniques...', 'Claire Roussel');

INSERT INTO `evenement_admin` (`id_evenement`, `id_administrateur`) VALUES
(1, 1), (2, 2), (3, 3), (4, 1), (5, 2);

INSERT INTO `image` (`id_image`, `nom_fichier`, `chemin`, `texte_alternatif`, `date_telechargement`) VALUES
(1, 'danse-renaissance.jpg', '/uploads/images/danse-renaissance.jpg', 'Atelier de danse Renaissance avec costumes d\'époque', '2026-01-13 19:58:55'),
(2, 'calligraphie-medievale.jpg', '/uploads/images/calligraphie-medievale.jpg', 'Pratique de la calligraphie médiévale', '2026-01-13 19:58:55'),
(3, 'teinture-vegetale.jpg', '/uploads/images/teinture-vegetale.jpg', 'Échantillons de tissus teints avec des plantes', '2026-01-13 19:58:55');

-- Dumping data for table `image_actualite`
INSERT INTO `image_actualite` (`id_image`, `id_actualite`) VALUES
(1, 1), (2, 3), (3, 2);

-- Dumping data for table `image_evenement`
INSERT INTO `image_evenement` (`id_image`, `id_evenement`) VALUES
(1, 1), (2, 2), (3, 3);

-- Dumping data for table `utilisateur_contact`
INSERT INTO `utilisateur_contact` (`id_utilisateur`, `id_message`) VALUES
(1, 1), (2, 2), (3, 3);

COMMIT;