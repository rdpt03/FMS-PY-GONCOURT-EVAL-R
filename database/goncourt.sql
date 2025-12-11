-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 11 déc. 2025 à 22:46
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id_author` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  `biography` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_author`),
  KEY `fk_author_person` (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id_author`, `id_person`, `biography`) VALUES
(1, 1, 'Diplômé de Sciences Po, reporter de guerre, lauréat du prix Albert-Londres. Alfred de Montesquiou est réalisateur et écrivain. Son premier roman, L\'Étoile des frontières, est paru en 2021.'),
(2, 2, 'Guillaume Poix a publié plusieurs pièces...'),
(3, 3, 'Née à Metz en 1988, Hélène Laurain a étudié les sciences politiques ainsi que l\'arabe en France et en Allemagne, puis la création littéraire à Paris-VIII.'),
(4, 4, 'Ghislaine Dunant a publié trois romans aux éditions Gallimard, dont son premier, très remarqué, L\'Impudeur (1989). Elle a reçu le prix Michel-Dentan (2008) pour Un effondrement et le prix Femina essai pour Charlotte Delbo. La vie retrouvée (2016), tous de'),
(5, 5, 'Charif Majdalani est écrivain et professeur à l\'université Saint-Joseph à Beyrouth. Il est l\'auteur d\'une dizaine de livres dont Histoire de la grande maison (Seuil, 2005), Villa des femmes (Seuil, prix Jean Giono 2015), Beyrouth 2020 : Journal d\'un effon'),
(6, 6, 'Lauréate du prix Femina 2014 pour Bain de lune, titulaire de la chaire des Mondes francophones au Collège de France en 2019, Yanick Lahens est née en 1953 en Haïti, où elle vit aujourd\'hui encore. Son oeuvre, traduite dans de nombreux pays, est publiée pa'),
(7, 7, 'David Deneufgermain est écrivain-médecin. Psychiatre, il a exercé en prison, en hôpital psychiatrique et soigne depuis onze ans les malades à la rue et dans son cabinet. L\'Adieu au visage est son premier roman du réel.'),
(8, 8, 'Né en 1966, David Diop est l\'auteur de trois romans, dont deux publiés aux éditions du Seuil : Frère d\'âme (prix Goncourt des lycéens 2018, International Booker Prize 2021) et La Porte du voyage sans retour (finaliste du National Book Award 2023).'),
(9, 9, 'Caroline Lamarche vit à Liège. Son oeuvre témoigne d\'un éclectisme et d\'une hardiesse renouvelés de livre en livre. Elle a notamment obtenu le prix Rossel avec Le Jour du Chien (Les Éditions de Minuit) et le Goncourt de la nouvelle pour Nous sommes à la l'),
(10, 10, 'Né en 1990, Paul Gasnier est journaliste. La collision est son premier récit.'),
(11, 11, 'David Thomas est l\'auteur de plusieurs romans et recueils d\'instantanés parmi lesquels La Patience des buffles sous la pluie ou Seul entouré de chiens qui mordent (prix de la nouvelle de l\'Académie française 2021). Son dernier livre, Partout les autres, a'),
(12, 12, 'Maria Pourchet est écrivaine. Elle est notamment l\'autrice de Rome en un jour (2013), Toutes les femmes sauf une (prix Révélation de la SGDL 2018), Feu (2021) et Western (prix de Flore 2023).'),
(13, 13, 'Laurent Mauvignier, né en 1967 à Tours, grandit en Touraine avec sa famille. Après des études en arts plastiques et en lettres modernes, il se consacre entièrement à l’écriture à partir de 1997. Il publie son premier roman Loin d’eux en 1999 aux éditions '),
(14, 14, 'Emmanuel Carrère est né en 1957. D\'abord journaliste il a publié un essai sur le cinéaste Werner Herzog en 1982 puis L\'Amie du jaguar Bravoure (prix Passion 1984 prix de la Vocation 1985), Le Détroit de Behring essai sur l\'Histoire imaginaire (prix Valery'),
(15, 15, 'Nathacha Appanah est romancière. Ses romans ont été récompensés par plusieurs prix littéraires et traduits dans de nombreux pays. La nuit au coeur est son douzième livre.');

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `pages_nb` int DEFAULT NULL,
  `ISBN` char(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_price` float DEFAULT NULL,
  `id_author` int NOT NULL,
  `id_publisher` int NOT NULL,
  PRIMARY KEY (`id_book`),
  KEY `fk_book_author` (`id_author`),
  KEY `fk_book_publisher` (`id_publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id_book`, `title`, `summary`, `release_date`, `pages_nb`, `ISBN`, `publisher_price`, `id_author`, `id_publisher`) VALUES
(1, 'Le crépuscule des hommes', 'Nuremberg, 1945 : un procès fait l\'Histoire, eux la vivent. Un roman vrai, qui saisit les sursauts de l\'Histoire en marche.\r\nChacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir de novembre 1945. Mais que s', '2025-08-28', 382, '9782221267660', 22, 1, 1),
(2, 'perpétuité', '18h45. Une maison d\'arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d\'autres surveillants prennent leur service de nuit. Captifs d\'une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une s', '2025-08-21', 331, '9782073105455', 22, 2, 2),
(3, 'Tambora', 'Une mère nous parle de ses deux filles, qu’elle voit amples comme des villes en expansion. La première est déjà là quand le récit commence, la seconde naîtra bientôt, après la perte d’un autre enfant lors d’une fausse couche. Ici, la temporalité de la mat', '2025-08-28', 192, '9782378562588', 18.5, 3, 3),
(4, 'Un amour infini', 'Elle est descendue en retard, elle voulait encore fumer une cigarette, fumer seule, une fois de plus. Pour sentir le temps qui passe, ne plus savoir qui elle est, ni ce qu\'on peut vouloir d\'elle.\r\n\r\nCe roman installe le lecteur au coeur d\'une rencontre de', '2025-08-20', 170, '9782226498687', 19.9, 4, 4),
(5, 'Le nom des rois', '« Et d\'un seul coup, le monde qui servait de décor à tout cela s\'écroula. J\'en avais été un témoin distrait, mais le bruit qu\'il provoqua en s\'effondrant me fit lever la tête et ce que je vis alors n\'était plus qu\'un univers de violence et de mort. C\'est ', '2025-08-20', 214, '9782234097278', 20, 5, 5),
(6, 'Passagères de nuit', 'Dans ce nouveau roman, comme arraché au chaos de son quotidien à Port-au-Prince, Yanick Lahens rend un hommage d’espoir et de résistance à la lignée des femmes dont elle est issue.\r\nLa première d’entre elles, Élizabeth Dubreuil, naît vers 1820 à La Nouvel', '2025-08-28', 23, '9782848055701', 20, 6, 6),
(7, 'L\'adieu au visage', 'Un roman en apnée sur la pandémie. Ce qu\'elle a fait aux vivants et aux morts, à notre humanité.\r\n\r\n	Mars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son ', '2025-08-20', 261, '9782381340647', 21.1, 7, 7),
(8, 'Où s\'adosse le ciel', '\r\n  À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque et s\'apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe, sous le regard incrédule d\'un médecin français qui cherche à ', '2025-08-14', 363, '9782260057307', 22.5, 8, 8),
(9, 'Le bel obscur', '\r\nAlors qu’elle tente d’élucider le destin d’un ancêtre banni par sa famille, une femme reprend l’histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur ', '2025-08-22', 160, '9782021603439', 19, 9, 9),
(10, 'La collision', '\r\nEn 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h.\r\n\r\nDix ans plus tard, son fils, qui n\'a cessé d\'être hanté par le drame, est devenu journaliste. Il obse', '2025-08-21', 229, '9782073101228', 20, 10, 10),
(11, 'Un frere', '\r\n« Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. »\r\n\r\nDavid Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depu', '2025-08-22', 139, '9782823623376', 19.5, 11, 11),
(12, 'Tressaillir', '« J\'ai coupé un lien avec quelque chose d\'aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. »\r\n\r\nUne femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve ', '2025-08-20', 324, '9782234097155', 21.9, 12, 5),
(13, 'La Maison vide', 'En 1976, mon père a rouvert la maison qu’il avait reçue de sa mère, restée fermée pendant vingt ans.\r\n\r\nÀ l’intérieur : un piano, une commode au marbre ébréché, une Légion d’honneur, des photographies sur lesquelles un visage a été découpé aux ciseaux.\r\n\r', '2025-08-28', 743, '9782707356741', 25, 13, 12),
(14, 'Kolkhoze', 'Emmanuel Carrère, né en 1957, journaliste et écrivain français. Auteur de La Classe de neige (prix Femina 1995), L\'Adversaire, Un roman russe, Limonov (prix Renaudot 2011) et Le Royaume. Ses livres sont traduits dans une vingtaine de langues.', '2025-08-28', 558, '9782818061985', 24, 14, 13),
(15, 'La nuit au coeur', '« De ces nuits et de ces vies, de ces femmes qui courent, de ces coeurs qui luttent, de ces instants qui sont si accablants qu\'ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l\'impossibilité de la vérité entière à chaqu', '2025-08-21', 282, '9782073080028', 21, 15, 10);

-- --------------------------------------------------------

--
-- Structure de la table `jury`
--

DROP TABLE IF EXISTS `jury`;
CREATE TABLE IF NOT EXISTS `jury` (
  `id_jury` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  PRIMARY KEY (`id_jury`),
  KEY `fk_jury_person` (`id_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id_person` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  PRIMARY KEY (`id_person`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id_person`, `first_name`, `last_name`, `born_date`) VALUES
(1, 'Alfred', 'de Montesquiou', '1978-01-01'),
(2, 'Guillaume', 'Poix', '1986-01-01'),
(3, 'Hélène', 'Laurain', '1988-01-01'),
(4, 'Ghislaine', 'Dunant', '1950-06-21'),
(5, 'Charif', 'Majdalani', '1960-01-01'),
(6, 'Yanick', 'Lahens', '1953-12-22'),
(7, 'David', 'Deneufgermain', '0000-00-00'),
(8, 'David', 'Diop', '1966-04-24'),
(9, 'Caroline', 'Lamarche', '1955-03-03'),
(10, 'Paul', 'Gasnier', '1990-07-01'),
(11, 'David', 'Thomas', '1966-01-01'),
(12, 'Maria', 'Pourchet', '2025-08-20'),
(13, 'Laurent', 'Mauvignier', '1967-07-06'),
(14, 'Emmanuel', 'Carrère', '1957-12-09'),
(15, 'Nathacha', 'Appanah', '1973-05-24');

-- --------------------------------------------------------

--
-- Structure de la table `president`
--

DROP TABLE IF EXISTS `president`;
CREATE TABLE IF NOT EXISTS `president` (
  `id_president` int NOT NULL AUTO_INCREMENT,
  `id_person` int NOT NULL,
  PRIMARY KEY (`id_president`),
  KEY `fk_president_personne` (`id_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `id_publisher` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `publisher`
--

INSERT INTO `publisher` (`id_publisher`, `name`) VALUES
(1, 'Robert Laffont'),
(2, 'Verticales'),
(3, 'Verdier'),
(4, 'Albin Michel'),
(5, 'Stock'),
(6, 'Sabine Wespieser éditeur'),
(7, 'Editions Marchialy'),
(8, 'Julliard'),
(9, 'Seuil'),
(10, 'Gallimard'),
(11, 'Ed. de l\'Olivier'),
(12, 'Minuit'),
(13, 'POL');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id_session` int NOT NULL AUTO_INCREMENT,
  `selection_date` date DEFAULT NULL,
  `voting` tinyint(1) DEFAULT NULL,
  `session_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n_of_winners` int DEFAULT NULL,
  PRIMARY KEY (`id_session`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id_session`, `selection_date`, `voting`, `session_name`, `n_of_winners`) VALUES
(1, '2025-09-03', 0, 'Premiere sélection du prix Goncourt 2025', 8);

-- --------------------------------------------------------

--
-- Structure de la table `session_have_book`
--

DROP TABLE IF EXISTS `session_have_book`;
CREATE TABLE IF NOT EXISTS `session_have_book` (
  `id_have` int NOT NULL AUTO_INCREMENT,
  `id_session` int NOT NULL,
  `id_book` int NOT NULL,
  PRIMARY KEY (`id_have`),
  KEY `fk_have_book` (`id_book`),
  KEY `fk_have_session` (`id_session`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session_have_book`
--

INSERT INTO `session_have_book` (`id_have`, `id_session`, `id_book`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15);

-- --------------------------------------------------------

--
-- Structure de la table `story_character`
--

DROP TABLE IF EXISTS `story_character`;
CREATE TABLE IF NOT EXISTS `story_character` (
  `id_character` int NOT NULL AUTO_INCREMENT,
  `id_book` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_character`),
  KEY `fk_character_book` (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `story_character`
--

INSERT INTO `story_character` (`id_character`, `id_book`, `name`, `role`, `description`) VALUES
(1, 1, 'Joseph Kessel', NULL, NULL),
(2, 1, 'Elsa Triolet', NULL, NULL),
(3, 1, 'Martha Gellhorn', NULL, NULL),
(4, 1, 'John Dos Passos', NULL, NULL),
(5, 2, 'Pierre', 'Surveillant', 'Un des agents de la pénitentiaire, participe au service de nuit.'),
(6, 2, 'Houda', 'Surveillante', 'Participe aux incidents de la routine nocturne.'),
(7, 2, 'Laurent', 'Surveillant', 'Impliqué dans les incidents nocturnes et interactions avec collègues.'),
(8, 2, 'Maëva', 'Surveillante', 'Participe aux situations exceptionnelles durant le service de nuit.'),
(9, 3, 'Mère', 'Mère', 'La mère qui raconte l’histoire et voit ses deux filles grandir.'),
(10, 3, 'Première fille', 'Fille aînée', 'Déjà là quand le récit commence.'),
(11, 3, 'Seconde fille', 'Fille cadette', 'Naîtra bientôt après une fausse couche.'),
(12, 3, 'Autre enfant perdu', 'Fausse couche', 'Perdu avant la naissance de la seconde fille.'),
(13, 4, 'Louise', 'Protagonist', 'Femme française présente sur l\'île de Tenerife en juin 1964, participe à une rencontre amoureuse marquante.'),
(14, 4, 'Nathan', 'Protagonist', 'Astrophysicien d\'origine hongroise exilé aux États-Unis, participe à la rencontre avec Louise sur l\'île de Tenerife.'),
(15, 6, 'Élizabeth Dubreuil', 'Protagoniste', 'Née vers 1820, rebelle et passagère de nuit.'),
(16, 6, 'Régina', 'Protagoniste', 'Fille pauvre d’Haïti, maîtresse d’un général, force le destin.'),
(17, 6, 'Grand-mère d’Élizabeth', 'Ancêtre', 'Arrivée d’Haïti, modèle d’émancipation pour Élizabeth.'),
(18, 6, 'Mon général', 'Amant', 'Général, amant de Régina, personnage central de son monologue amoureux.'),
(19, 7, 'Le psychiatre', 'Protagoniste', 'Médecin en première ligne, partagé entre équipe mobile et unités covid.'),
(20, 7, 'Équipe mobile psychiatrique', 'Personnage collectif', 'Groupe de soignants maraudant dans une ville confinée.'),
(21, 7, 'Patients des unités Covid', 'Personnage collectif', 'Malades isolés, mourant souvent sans accompagnement.'),
(22, 7, 'Marginaux', 'Personnage collectif', 'Personnes vulnérables dans la ville fantôme, recherchées par l’équipe mobile.'),
(23, 7, 'Personnel hospitalier', 'Personnage collectif', 'Soignants confrontés au chaos de la pandémie.'),
(24, 7, 'La loi / les autorités', 'Concept', 'Force contraignante qui impose des règles parfois inhumaines.'),
(25, 8, 'Bilal Seck', 'Protagoniste', 'Pèlerin revenant de La Mecque, survivant du choléra, en quête de ses origines et porté par un mythe ancestral.'),
(26, 8, 'Médecin français', 'Personnage secondaire', 'Médecin fasciné par l’immunité de Bilal et tentant de la comprendre, sans succès.'),
(27, 8, 'Ounifer', 'Figure mythique / Grand prêtre d\'Osiris', 'Conduit son peuple hors de l’Égypte ptolémaïque vers une terre promise à l’ouest.'),
(28, 9, 'Fils de la victime', 'Protagoniste', 'Fils de la femme décédée à Lyon en 2012, devenu journaliste, qui enquête sur l\'accident et son impact sur la société.'),
(29, 9, 'Jeune motard', 'Personnage central', 'Jeune garçon en moto cross, responsable de l\'accident qui a tué la mère du protagoniste.'),
(30, 9, 'Mère décédée', 'Personnage secondaire', 'La mère du protagoniste, décédée lors de l\'accident en 2012, déclencheur de l\'histoire.'),
(31, 9, 'Familles', 'Personnages secondaires', 'Les deux familles impliquées indirectement dans l\'histoire, illustrant les conséquences collectives et sociales de l\'accident.'),
(32, 10, 'Fils de la victime', 'Protagoniste', 'Journaliste dix ans après l\'accident, hanté par le drame.'),
(33, 10, 'Femme décédée', 'Personnage secondaire', 'Victime de l\'accident de moto cross en 2012.'),
(34, 10, 'Jeune motard', 'Personnage secondaire', 'Jeune garçon ayant percuté la femme en rodéo urbain.'),
(35, 10, 'Deux familles', 'Groupes de personnages', 'Les familles parallèles qui racontent l\'évolution de la société.'),
(36, 11, 'Édouard', 'Protagoniste', 'Frère atteint de schizophrénie, son combat contre la maladie est central.'),
(37, 11, 'David Thomas', 'Narrateur / Personnage secondaire', 'Frère d\'Édouard, raconte leur lien et le combat d\'Édouard.'),
(38, 12, 'La femme', 'Protagoniste', 'Une femme qui quitte sa maison et sa vie pour chercher une liberté neuve, mais se retrouve confrontée à ses peurs et à son chagrin dans une chambre d’'),
(39, 13, 'Le père', 'Personnage central', 'A rouvert la maison familiale et explore l’histoire familiale.'),
(40, 13, 'Marguerite', 'Grand-mère', 'A vécu dans la maison et marque son histoire.'),
(41, 13, 'Marie-Ernestine', 'Arrière-grand-mère', 'Mère de Marguerite, dont la vie influence la maison.'),
(42, 13, 'Hommes gravitant autour', 'Personnages secondaires', 'Les hommes ayant marqué la maison et son histoire familiale.'),
(43, 14, 'La mère', 'Personnage central', 'La mère autour de laquelle se rassemble la famille pour la dernière fois.'),
(44, 14, 'Les trois enfants', 'Personnages secondaires', 'Trois personnes rassemblées autour de leur mère, identités non précisées.'),
(45, 15, 'Narratrice', 'Protagoniste', 'Première des trois femmes, victime de la violence conjugale.'),
(46, 15, 'Deuxième femme', 'Personnage secondaire', 'Deuxième des trois femmes victimes de la violence de leur compagnon.'),
(47, 15, 'Troisième femme', 'Personnage secondaire', 'Troisième des trois femmes victimes de la violence de leur compagnon.');

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

DROP TABLE IF EXISTS `vote`;
CREATE TABLE IF NOT EXISTS `vote` (
  `id_vote` int NOT NULL AUTO_INCREMENT,
  `id_jury` int DEFAULT NULL,
  `id_book` int NOT NULL,
  `id_session` int NOT NULL,
  PRIMARY KEY (`id_vote`),
  KEY `fk_vote_book` (`id_book`),
  KEY `fk_vote_jury` (`id_jury`),
  KEY `fk_vote_session` (`id_session`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vote`
--

INSERT INTO `vote` (`id_vote`, `id_jury`, `id_book`, `id_session`) VALUES
(1, NULL, 15, 1),
(2, NULL, 14, 1),
(3, NULL, 10, 1),
(4, NULL, 6, 1),
(5, NULL, 9, 1),
(6, NULL, 5, 1),
(7, NULL, 13, 1),
(8, NULL, 1, 1),
(9, NULL, 15, 1),
(10, NULL, 14, 1),
(11, NULL, 10, 1),
(12, NULL, 6, 1),
(13, NULL, 9, 1),
(14, NULL, 5, 1),
(15, NULL, 13, 1),
(16, NULL, 1, 1),
(17, NULL, 11, 1),
(18, NULL, 2, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `fk_author_person` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`);

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_author` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`),
  ADD CONSTRAINT `fk_book_publisher` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id_publisher`);

--
-- Contraintes pour la table `jury`
--
ALTER TABLE `jury`
  ADD CONSTRAINT `fk_jury_person` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`);

--
-- Contraintes pour la table `president`
--
ALTER TABLE `president`
  ADD CONSTRAINT `fk_president_personne` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`);

--
-- Contraintes pour la table `session_have_book`
--
ALTER TABLE `session_have_book`
  ADD CONSTRAINT `fk_have_book` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`),
  ADD CONSTRAINT `fk_have_session` FOREIGN KEY (`id_session`) REFERENCES `session` (`id_session`);

--
-- Contraintes pour la table `story_character`
--
ALTER TABLE `story_character`
  ADD CONSTRAINT `fk_character_book` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`);

--
-- Contraintes pour la table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `fk_vote_book` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`),
  ADD CONSTRAINT `fk_vote_jury` FOREIGN KEY (`id_jury`) REFERENCES `jury` (`id_jury`),
  ADD CONSTRAINT `fk_vote_session` FOREIGN KEY (`id_session`) REFERENCES `session` (`id_session`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
