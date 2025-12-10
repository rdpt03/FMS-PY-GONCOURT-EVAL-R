-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 10 déc. 2025 à 18:04
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

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_author` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`),
  ADD CONSTRAINT `fk_book_publisher` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id_publisher`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
