-- -- INSERTS ----
-- le crespule des hommes
-- author
INSERT INTO person (id_person,first_name, last_name, born_date) VALUES (
    1,
	"Alfred",
    "de Montesquiou",
    "1978-01-01"
);

INSERT INTO author (id_author, id_person, biography) VALUES (
	1,
	1,
	"Diplômé de Sciences Po, reporter de guerre, lauréat du prix Albert-Londres. Alfred de Montesquiou est réalisateur et écrivain. Son premier roman, L'Étoile des frontières, est paru en 2021."
);

-- editeur
INSERT INTO publisher (id_publisher,name) VALUES (1,"Robert Laffont");

-- livre
INSERT INTO book  
VALUES 
    (1,
	"Le crépuscule des hommes",
	"Nuremberg, 1945 : un procès fait l'Histoire, eux la vivent. Un roman vrai, qui saisit les sursauts de l'Histoire en marche.
Chacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir de novembre 1945. Mais que se passe-t-il hors de la salle d'audience ?
Ils sont là : Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos, venus assister à ces dix mois où doit oeuvrer la justice. Des dortoirs de l'étrange château Faber-Castell, qui loge la presse internationale, aux box des accusés, tous partagent la frénésie des reportages, les frictions entre alliés occidentaux et soviétiques, l'effroi que suscite le récit inédit des déportés.
Avec autant de précision historique que de tension romanesque, Alfred de Montesquiou ressuscite des hommes et des femmes de l'ombre, témoins du procès le plus retentissant du XXe siècle.",
	"2025-08-28",
	382,
    "9782221267660",
	22,
	1,
	1
);

-- characters
INSERT INTO story_character (id_book, name, role, description) VALUES
(1, 'Joseph Kessel', NULL, NULL),
(1, 'Elsa Triolet', NULL, NULL),
(1, 'Martha Gellhorn', NULL, NULL),
(1, 'John Dos Passos', NULL, NULL);










-- ---------------------------------------PERPETUITE
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES ('Guillaume', 'Poix', '1986-01-01');

INSERT INTO author(id_person, biography)
VALUES (LAST_INSERT_ID(), 'Guillaume Poix a publié plusieurs pièces...');

-- publisher
INSERT INTO publisher(name) VALUES ('Verticales');

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  'perpétuité',
  "18h45. Une maison d'arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d'autres surveillants prennent leur service de nuit. Captifs d'une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une série d'incidents plus éprouvants qu'à l'ordinaire.

	En regardant celles et ceux qui regardent, Guillaume Poix plonge dans le quotidien d'un métier méconnu, sinon méprisé, et interroge le sens d'une institution au bord du gouffre.",
  '2025-08-21',
  331,
  '9782073105455',
  22,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name='Poix')),
  (SELECT id_publisher FROM publisher WHERE name='Verticales')
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title='perpétuité');

INSERT INTO story_character(id_book, name, role, description) VALUES
(@book_id, 'Pierre', 'Surveillant', 'Un des agents de la pénitentiaire, participe au service de nuit.'),
(@book_id, 'Houda', 'Surveillante', 'Participe aux incidents de la routine nocturne.'),
(@book_id, 'Laurent', 'Surveillant', 'Impliqué dans les incidents nocturnes et interactions avec collègues.'),
(@book_id, 'Maëva', 'Surveillante', 'Participe aux situations exceptionnelles durant le service de nuit.');

SET @book_id := NULL;










-- ------------------------ Tambora
-- author
SET @book_storyname := 'Tambora';
INSERT INTO person(first_name, last_name, born_date)
VALUES ('Hélène', 'Laurain', '1988-01-01');

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	"Née à Metz en 1988, Hélène Laurain a étudié les sciences politiques ainsi que l'arabe en France et en Allemagne, puis la création littéraire à Paris-VIII."
);

-- publisher
INSERT INTO publisher(name) VALUES ('Verdier');

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  "Une mère nous parle de ses deux filles, qu’elle voit amples comme des villes en expansion. La première est déjà là quand le récit commence, la seconde naîtra bientôt, après la perte d’un autre enfant lors d’une fausse couche. Ici, la temporalité de la maternité domine : celle de grossesses compliquées, d’hôpitaux et de services des urgences, la temporalité d’un corps qui produit, parfois sans qu’on le veuille, la temporalité de la naissance, celle des soins, ou des désirs trop souvent empêchés. Mais d’autres réalités existent aussi, se faufilent et tentent de prendre leur place : un manuscrit qui intéresse un éditeur, des confinements, qui ne changent pas grand-chose lorsqu’on doit rester alitée, la catastrophe environnementale qui se déploie, gigantesque, et fait songer à la fin du monde que l’humanité a cru vivre en 1815 quand l’éruption du volcan Tambora plongea une partie de la Terre dans le froid et l’obscurité. Hélène Laurain écrit avec cela, et écrit tout cela, avec crudité parfois. Son livre conjugue récit, réflexions et poésie, et nous emmène à la rencontre d’un monde incertain.",
  '2025-08-28',
  192,
  '9782378562588',
  18.50,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name='Laurain')),
  (SELECT id_publisher FROM publisher WHERE name='Verdier')
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);

INSERT INTO story_character (id_book, name, role, description) VALUES
(@book_id, 'Mère', 'Mère', 'La mère qui raconte l’histoire et voit ses deux filles grandir.'),
(@book_id, 'Première fille', 'Fille aînée', 'Déjà là quand le récit commence.'),
(@book_id, 'Seconde fille', 'Fille cadette', 'Naîtra bientôt après une fausse couche.'),
(@book_id, 'Autre enfant perdu', 'Fausse couche', 'Perdu avant la naissance de la seconde fille.');

SET @book_id := NULL;














-- ----------------------Un amour infini

-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES ('Ghislaine', 'Dunant', '1950-06-21');

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	"Ghislaine Dunant a publié trois romans aux éditions Gallimard, dont son premier, très remarqué, L'Impudeur (1989). Elle a reçu le prix Michel-Dentan (2008) pour Un effondrement et le prix Femina essai pour Charlotte Delbo. La vie retrouvée (2016), tous deux parus chez Grasset.Elle vit à Paris."
);

-- publisher
INSERT INTO publisher(name) VALUES ('Albin Michel');

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  'Un amour infini',
  "Elle est descendue en retard, elle voulait encore fumer une cigarette, fumer seule, une fois de plus. Pour sentir le temps qui passe, ne plus savoir qui elle est, ni ce qu'on peut vouloir d'elle.

Ce roman installe le lecteur au coeur d'une rencontre de trois jours sur l'île de Ténérife, en juin 1964, prévue mais bouleversée par un événement tragique, entre un astrophysicien d'origine hongroise qui a dû fuir l'Europe et s'exiler aux États-Unis et une mère de famille française.

Alors que rien ne devrait les rapprocher, leurs conversations sur leurs passés distincts et l'exploration de l'île vont les ouvrir profondément l'un à l'autre. Le ciel, l'univers, l'histoire de la Terre... Les sujets de l'astrophysicien rejoignent la sensibilité de celle qui a observé le mystère de la toute petite enfance et a toujours eu une approche sensitive des êtres. Leur désir réciproque va s'accompagner de la puissance des éléments qui les entourent.

1964. Sur l'île de Tenerife. Une femme et un homme que rien ne destinait à se rencontrer, et, pourtant, durant 3 jours, en cette géographie volcanique et insulaire, naîtra l'une des plus belles rencontres amoureuses écrites ces dernières années...Roman sensible subtile et sensuel, où le paysage cosmique, absolu de l'île de Tenerife et la rencontre entre Louise et Nathan confluent si intimement que l'impression laissée par cette histoire à l'écriture aussi délicate que tellurique perdure infiniment.",
  '2025-08-20',
  170,
  '9782226498687',
  19.90,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name='Dunant')),
  (SELECT id_publisher FROM publisher WHERE name='Albin Michel')
);
-- characters
SET @book_id := (SELECT id_book FROM book WHERE title='Un amour infini');

INSERT INTO story_character (id_book, name, role, description)
VALUES
(@book_id, 'Louise', 'Protagonist', 'Femme française présente sur l\'île de Tenerife en juin 1964, participe à une rencontre amoureuse marquante.'),
(@book_id, 'Nathan', 'Protagonist', 'Astrophysicien d\'origine hongroise exilé aux États-Unis, participe à la rencontre avec Louise sur l\'île de Tenerife.');

SET @book_id := NULL;








-- --------------------------------------- Le nom des rois
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES ('Charif', 'Majdalani', '1960-01-01');

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	"Charif Majdalani est écrivain et professeur à l'université Saint-Joseph à Beyrouth. Il est l'auteur d'une dizaine de livres dont Histoire de la grande maison (Seuil, 2005), Villa des femmes (Seuil, prix Jean Giono 2015), Beyrouth 2020 : Journal d'un effondrement (Actes Sud, prix spécial du jury Femina 2020) et Dernière Oasis (Actes Sud, 2021)."
);

-- publisher
INSERT INTO publisher(name) VALUES ('Stock');

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  'Le nom des rois',
  "« Et d'un seul coup, le monde qui servait de décor à tout cela s'écroula. J'en avais été un témoin distrait, mais le bruit qu'il provoqua en s'effondrant me fit lever la tête et ce que je vis alors n'était plus qu'un univers de violence et de mort. C'est de celui-là que je suis devenu contemporain. J'avais été, durant des années, dispensé d'intérêt pour ce qui se passait autour de moi par ma passion des atlas, par les royautés anciennes et inutiles et par les terres lointaines et isolées, les berceaux de vieux empires oubliés.

Désormais, l'histoire se faisait sous mes yeux et je la trouvais moche, roturière et vulgaire. »

Dans ce récit de passage à l'âge adulte porté par une écriture ample et élégante, Charif Majdalani raconte la disparition d'un pays et explore ce qui subsiste de l'enfance lorsqu'elle capitule devant les fracas du monde.",
  '2025-08-20',
  214,
  '9782234097278',
  20,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name='Majdalani')),
  (SELECT id_publisher FROM publisher WHERE name='Stock')
);
-- characters


















-- -----------------------------Passagères de nuit
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES ('Yanick', 'Lahens', '1953-12-22');

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	"Lauréate du prix Femina 2014 pour Bain de lune, titulaire de la chaire des Mondes francophones au Collège de France en 2019, Yanick Lahens est née en 1953 en Haïti, où elle vit aujourd'hui encore. Son oeuvre, traduite dans de nombreux pays, est publiée par Sabine Wespieser éditeur."
);

-- publisher
INSERT INTO publisher(name) VALUES ('Sabine Wespieser éditeur');

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  'Passagères de nuit',
  "Dans ce nouveau roman, comme arraché au chaos de son quotidien à Port-au-Prince, Yanick Lahens rend un hommage d’espoir et de résistance à la lignée des femmes dont elle est issue.
La première d’entre elles, Élizabeth Dubreuil, naît vers 1820 à La Nouvelle-Orléans. Sa grand-mère, arrivée d’Haïti au début du siècle dans le sillage du maître de la plantation qui avait fini par l’affranchir, n’a plus jamais voulu dépendre d’un homme. Inspirée par ce puissant exemple, la jeune Élisabeth se rebelle à son tour contre le désir prédateur d’un ami de son père. Elle doit fuir la ville, devenant à son tour une « passagère de nuit » sur un bateau à destination de Port-au-Prince. Ce qui adviendra d’elle, nous l’apprendrons quand son existence croisera celle de Régina, autre grande figure de ce roman des origines.
Née pauvre parmi les pauvres dans un hameau du sud de l’île d’Haïti, Régina elle aussi a forcé le destin : rien ne la déterminait à devenir la maîtresse d’un des généraux arrivé en libérateur à Port-au-Prince en 1867. C’est à « mon général, mon amant, mon homme » qu’elle adresse le monologue amoureux dans lequel elle évoque sa trajectoire d’émancipation : la cruauté mesquine des maîtres qu’elle a fuis trouve son contrepoint dans les mains tendues par ces femmes qui lui ont appris à opposer aux coups du sort une ténacité silencieuse.
Cette ténacité silencieuse, Élizabeth et Régina l’ont reçue en partage de leurs lointaines ascendantes, ces « passagères de nuit » des bateaux négriers, dont Yanick Lahens évoque ici l’effroyable réalité, de même qu’elle nous plonge – et ce n’est pas la moindre qualité de ce très grand livre – dans les convulsions de l’histoire haïtienne.
Lorsque les deux héroïnes se rencontreront, dans une scène d’une rare qualité d’émotion, nous, lectrices et lecteurs, comprendrons que l’histoire ne s’écrit pas seulement avec les vainqueurs, mais dans la beauté des gestes, des regards et des mystères tus, qui à bas bruit montrent le chemin d’une résistance forçant l’admiration.",
  '2025-08-28',
  23,
  '9782848055701',
  20,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name='Lahens')),
  (SELECT id_publisher FROM publisher WHERE name='Sabine Wespieser éditeur')
);
-- characters
SET @book_id := (SELECT id_book FROM book WHERE title='Passagères de nuit');


INSERT INTO story_character (id_book, name, role, description) VALUES
	(@book_id, 'Élizabeth Dubreuil', 'Protagoniste', 'Née vers 1820, rebelle et passagère de nuit.'),
	(@book_id, 'Régina', 'Protagoniste', 'Fille pauvre d’Haïti, maîtresse d’un général, force le destin.'),
	(@book_id, 'Grand-mère d’Élizabeth', 'Ancêtre', 'Arrivée d’Haïti, modèle d’émancipation pour Élizabeth.'),
	(@book_id, 'Mon général', 'Amant', 'Général, amant de Régina, personnage central de son monologue amoureux.');


SET @book_id := NULL;

























-- ------------------------------------------------------ L\'adieu au visage
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES ('David', 'Deneufgermain', '00-12-1976');

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	"David Deneufgermain est écrivain-médecin. Psychiatre, il a exercé en prison, en hôpital psychiatrique et soigne depuis onze ans les malades à la rue et dans son cabinet. L'Adieu au visage est son premier roman du réel."
);

-- publisher
INSERT INTO publisher(name) VALUES ('Editions Marchialy');

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  'L\'adieu au visage',
  "Un roman en apnée sur la pandémie. Ce qu'elle a fait aux vivants et aux morts, à notre humanité.

	Mars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son temps entre son équipe mobile qui maraude dans une ville fantôme à la recherche de marginaux à protéger, et les unités covid où les malades meurent seuls, privés de tout rite. Entre obéissance à la loi et refus de l'horreur, que ce soit à l'hôpital ou dehors, chacun à son niveau cherche des solutions et improvise. L'Adieu au visage est l'écriture d'une résistance fragile et d'une lutte pour prendre soin de l'autre.

	« Au commencement, on ne lave plus les corps, on ne les coiffe plus, on ne les habille plus, on ne les présente plus - d'accompagner les morts, il n'est plus question.",
  '2025-08-20',
  261,
  '9782381340647',
  21.10,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name='Deneufgermain')),
  (SELECT id_publisher FROM publisher WHERE name='Editions Marchialy')
);
-- characters
SET @book_id := (SELECT id_book FROM book WHERE title='L\'adieu au visage');

INSERT INTO story_character (id_book, name, role, description) VALUES
(@book_id, 'Le psychiatre', 'Protagoniste', 'Médecin en première ligne, partagé entre équipe mobile et unités covid.'),
(@book_id, 'Équipe mobile psychiatrique', 'Personnage collectif', 'Groupe de soignants maraudant dans une ville confinée.'),
(@book_id, 'Patients des unités Covid', 'Personnage collectif', 'Malades isolés, mourant souvent sans accompagnement.'),
(@book_id, 'Marginaux', 'Personnage collectif', 'Personnes vulnérables dans la ville fantôme, recherchées par l’équipe mobile.'),
(@book_id, 'Personnel hospitalier', 'Personnage collectif', 'Soignants confrontés au chaos de la pandémie.'),
(@book_id, 'La loi / les autorités', 'Concept', 'Force contraignante qui impose des règles parfois inhumaines.');


SET @book_id := NULL;






























-- -----------------------------------Où s'adosse le ciel
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES ('David', 'Diop', '1966-04-24');

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	"Né en 1966, David Diop est l'auteur de trois romans, dont deux publiés aux éditions du Seuil : Frère d'âme (prix Goncourt des lycéens 2018, International Booker Prize 2021) et La Porte du voyage sans retour (finaliste du National Book Award 2023)."
);

-- publisher
INSERT INTO publisher(name) VALUES ('Julliard');

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  'Où s\'adosse le ciel',
  "
  À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque et s'apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe, sous le regard incrédule d'un médecin français qui cherche à percer les secrets de son immunité. En pure perte. Déjà, Bilal est ailleurs, porté par une autre histoire, celle qu'il ne cesse de psalmodier, un mythe immense, demeuré intact en lui, transmis par la grande chaîne de la parole qui le relie à ses ancêtres. Une odyssée qui fut celle du peuple égyptien, alors sous le joug des Ptolémées, conduite par Ounifer, grand prêtre d'Osiris qui caressait le rêve de rendre leur liberté aux siens, les menant vers l'ouest à travers les déserts, jusqu'à une terre promise, un bel horizon, là où s'adosse le ciel...
Ce chemin, Bilal l'emprunte à son tour, vers son pays natal, en passant par Djenné, la cité rouge, où vint buter un temps le voyage d'Ounifer et de son peuple.

De l'Égypte ancienne au Sénégal, David Diop signe un roman magistral sur un homme parti à la reconquête de ses origines et des sources immémoriales de sa parole.
  ",
  '2025-08-14',
  363,
  '9782260057307',
  22.5,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name='Diop')),
  (SELECT id_publisher FROM publisher WHERE name='Julliard')
);
-- characters
SET @book_id := (SELECT id_book FROM book WHERE title='Où s\'adosse le ciel');

INSERT INTO story_character (name, role, description, id_book)
VALUES
('Bilal Seck', 'Protagoniste', 
 'Pèlerin revenant de La Mecque, survivant du choléra, en quête de ses origines et porté par un mythe ancestral.', 
 @book_id),

('Médecin français', 'Personnage secondaire', 
 'Médecin fasciné par l’immunité de Bilal et tentant de la comprendre, sans succès.', 
 @book_id),

('Ounifer', 'Figure mythique / Grand prêtre d\'Osiris', 
 'Conduit son peuple hors de l’Égypte ptolémaïque vers une terre promise à l’ouest.', 
 @book_id);


SET @book_id := NULL;


















-- ----------------------------------------------Le bel obscur

SET @author_firstname := 'Caroline';
SET @author_lastname := 'Lamarche';
SET @author_borndate := '1955-03-03';
SET @author_biography := "Caroline Lamarche vit à Liège. Son oeuvre témoigne d'un éclectisme et d'une hardiesse renouvelés de livre en livre. Elle a notamment obtenu le prix Rossel avec Le Jour du Chien (Les Éditions de Minuit) et le Goncourt de la nouvelle pour Nous sommes à la lisière (Gallimard). Elle signe avec Le Bel Obscur son retour au roman.";

SET @publisher := 'Seuil';
SET @book_storyname := 'Le bel obscur';

SET @book_releasedate = '2025-08-22';
SET @book_pagenb = 160;
SET @book_ISBN = '9782021603439';
SET @book_PRICE = 19;

SET @book_summary = "
Alors qu’elle tente d’élucider le destin d’un ancêtre banni par sa famille, une femme reprend l’histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur existence comme des péripéties de leur émancipation respective, rien n’est tu. Ce roman lumineux nous offre une leçon de courage, de tolérance, de curiosité aussi. Car jamais cette femme libre n’aura cessé de se réinventer, d’affirmer la puissance de ses rêves contre les conventions sociales, avec une fantaisie et une délicatesse infinies.

Caroline Lamarche vit à Liège. Son œuvre témoigne d’un éclectisme et d’une hardiesse renouvelés de livre en livre. Elle a notamment obtenu le prix Rossel avec Le Jour du Chien (Les Éditions de Minuit) et le Goncourt de la nouvelle pour Nous sommes à la lisière (Gallimard). Elle signe avec Le Bel Obscur son retour au roman.
";
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES (@author_firstname, @author_lastname, @author_borndate);

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	@author_biography
);

-- publisher
INSERT INTO publisher(name) VALUES (@publisher);

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  @book_summary,
  @book_releasedate,
  @book_pagenb,
  @book_ISBN,
  @book_PRICE,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name=@author_lastname)),
  (SELECT id_publisher FROM publisher WHERE name=@publisher)
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);

-- Supondo que @book_id já tenha o ID do livro correspondente
INSERT INTO story_character (id_book, name, role, description)
VALUES
(@book_id, 'Fils de la victime', 'Protagoniste', 
 'Fils de la femme décédée à Lyon en 2012, devenu journaliste, qui enquête sur l\'accident et son impact sur la société.'),

(@book_id, 'Jeune motard', 'Personnage central', 
 'Jeune garçon en moto cross, responsable de l\'accident qui a tué la mère du protagoniste.'),

(@book_id, 'Mère décédée', 'Personnage secondaire', 
 'La mère du protagoniste, décédée lors de l\'accident en 2012, déclencheur de l\'histoire.'),

(@book_id, 'Familles', 'Personnages secondaires', 
 'Les deux familles impliquées indirectement dans l\'histoire, illustrant les conséquences collectives et sociales de l\'accident.');





















-- ---------------------------------------------- La collision

SET @author_firstname := 'Paul';
SET @author_lastname := 'Gasnier';
SET @author_borndate := '1990-07-01';
SET @author_biography := "Né en 1990, Paul Gasnier est journaliste. La collision est son premier récit.";

SET @publisher := 'Gallimard';
SET @book_storyname := 'La collision';

SET @book_releasedate = '2025-08-21';
SET @book_pagenb = 229;
SET @book_ISBN = '9782073101228';
SET @book_PRICE = 20;

SET @book_summary = "
En 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h.

Dix ans plus tard, son fils, qui n'a cessé d'être hanté par le drame, est devenu journaliste. Il observe la façon dont ce genre de catastrophe est utilisé quotidiennement pour fracturer la société et dresser une partie de l'opinion contre l'autre. Il décide de se replonger dans la complexité de cet accident, et de se lancer sur les traces du motard pour comprendre d'où il vient, quel a été son parcours et comment un tel événement a été rendu possible.

En décortiquant ce drame familial, Paul Gasnier révèle deux destins qui s'écrivent en parallèle, dans la même ville, et qui s'ignorent jusqu'au jour où ils entrent violemment en collision. C'est aussi l'histoire de deux familles qui racontent chacune l'évolution du pays. Un récit en forme d'enquête littéraire qui explore la force de nos convictions quand le réel les met à mal, et les manquements collectifs qui créent l'irrémédiable.
";
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES (@author_firstname, @author_lastname, @author_borndate);

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	@author_biography
);

-- publisher
INSERT INTO publisher(name) VALUES (@publisher);

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  @book_summary,
  @book_releasedate,
  @book_pagenb,
  @book_ISBN,
  @book_PRICE,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name=@author_lastname)),
  (SELECT id_publisher FROM publisher WHERE name=@publisher)
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);


INSERT INTO story_character (id_book, name, role, description)
VALUES
(@book_id, 'Fils de la victime', 'Protagoniste', 'Journaliste dix ans après l\'accident, hanté par le drame.'),
(@book_id, 'Femme décédée', 'Personnage secondaire', 'Victime de l\'accident de moto cross en 2012.'),
(@book_id, 'Jeune motard', 'Personnage secondaire', 'Jeune garçon ayant percuté la femme en rodéo urbain.'),
(@book_id, 'Deux familles', 'Groupes de personnages', 'Les familles parallèles qui racontent l\'évolution de la société.');










-- ---------------------------------------------- UN FRERE

SET @author_firstname := 'David';
SET @author_lastname := 'Thomas';
SET @author_borndate := '1966-01-01';
SET @author_biography := "David Thomas est l'auteur de plusieurs romans et recueils d'instantanés parmi lesquels La Patience des buffles sous la pluie ou Seul entouré de chiens qui mordent (prix de la nouvelle de l'Académie française 2021). Son dernier livre, Partout les autres, a été couronné en 2023 par le prix Goncourt de la nouvelle.";

SET @publisher := 'Ed. de l\'Olivier';
SET @book_storyname := 'Un frere';

SET @book_releasedate = '2025-08-22';
SET @book_pagenb = 139;
SET @book_ISBN = '9782823623376';
SET @book_PRICE = 19.5;

SET @book_summary = "
« Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. »

David Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depuis la mort brutale d’Édouard jusqu’aux années heureuses, il remonte à la source du lien qu’il a eu avec son aîné et grâce auquel il s’est construit. Lors de ce cheminement, il s’interroge : comment écrire cette histoire sans trahir, sans enjoliver ? Écrire pour rejoindre Édouard. Le retrouver.
";
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES (@author_firstname, @author_lastname, @author_borndate);

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	@author_biography
);

-- publisher
INSERT INTO publisher(name) VALUES (@publisher);

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  @book_summary,
  @book_releasedate,
  @book_pagenb,
  @book_ISBN,
  @book_PRICE,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name=@author_lastname)),
  (SELECT id_publisher FROM publisher WHERE name=@publisher)
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);

INSERT INTO story_character (id_book, name, role, description)
VALUES
(@book_id, 'Édouard', 'Protagoniste', 'Frère atteint de schizophrénie, son combat contre la maladie est central.'),
(@book_id, 'David Thomas', 'Narrateur / Personnage secondaire', 'Frère d\'Édouard, raconte leur lien et le combat d\'Édouard.');











-- ---------------------------------------------- Tressaillir (stock pour le publisher pour la 2eme fois)

SET @author_firstname := 'Maria';
SET @author_lastname := 'Pourchet';
SET @author_borndate := '2025-08-20';
SET @author_biography := "Maria Pourchet est écrivaine. Elle est notamment l'autrice de Rome en un jour (2013), Toutes les femmes sauf une (prix Révélation de la SGDL 2018), Feu (2021) et Western (prix de Flore 2023).";

SET @publisher := 'Stock';
SET @book_storyname := 'Tressaillir';

SET @book_releasedate = '2025-08-20';
SET @book_pagenb = 324;
SET @book_ISBN = '9782234097155';
SET @book_PRICE = 21.9;

SET @book_summary = "« J'ai coupé un lien avec quelque chose d'aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. »

Une femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve mais elle éprouve, prostrée dans une chambre d'hôtel, l'élémentaire supplice de l'arrachement. Et si rompre n'était pas à sa portée ? Si la seule issue au chagrin, c'était revenir ? Car sans un homme à ses côtés, cette femme a peur. Depuis toujours sur le qui-vive, elle a peur.

Mais au fond, de quoi ?

Dans ce texte du retour aux origines et du retour de la joie, Maria Pourchet entreprend une archéologie de ces terreurs d'enfant qui hantent les adultes. Elle nous transporte au coeur des forêts du Grand Est sur les traces de drames intimes et collectifs.";
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES (@author_firstname, @author_lastname, @author_borndate);

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	@author_biography
);

-- publisher
-- il existe deja

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  @book_summary,
  @book_releasedate,
  @book_pagenb,
  @book_ISBN,
  @book_PRICE,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name=@author_lastname)),
  (SELECT id_publisher FROM publisher WHERE name=@publisher)
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);

-- Assumindo que @book_id já está definido para o livro correspondente

INSERT INTO story_character (id_book, name, role, description)
VALUES
(@book_id, 'La femme', 'Protagoniste', 
'Une femme qui quitte sa maison et sa vie pour chercher une liberté neuve, mais se retrouve confrontée à ses peurs et à son chagrin dans une chambre d’hôtel.');











-- ----------------------------------------------La maison vide

SET @author_firstname := 'Laurent';
SET @author_lastname := 'Mauvignier';
SET @author_borndate := '1967-07-06';
SET @author_biography := "Laurent Mauvignier, né en 1967 à Tours, grandit en Touraine avec sa famille. Après des études en arts plastiques et en lettres modernes, il se consacre entièrement à l’écriture à partir de 1997. Il publie son premier roman Loin d’eux en 1999 aux éditions de Minuit, immédiatement salué pour son écriture polyphonique et sa puissance émotionnelle.";

SET @publisher := 'Minuit';
SET @book_storyname := 'La Maison vide';

SET @book_releasedate = '2025-08-28';
SET @book_pagenb = 743;
SET @book_ISBN = '9782707356741';
SET @book_PRICE = 25;

SET @book_summary = "En 1976, mon père a rouvert la maison qu’il avait reçue de sa mère, restée fermée pendant vingt ans.

À l’intérieur : un piano, une commode au marbre ébréché, une Légion d’honneur, des photographies sur lesquelles un visage a été découpé aux ciseaux.

Une maison peuplée de récits, où se croisent deux guerres mondiales, la vie rurale de la première moitié du vingtième siècle, mais aussi Marguerite, ma grand-mère, sa mère Marie-Ernestine, la mère de celle-ci, et tous les hommes qui ont gravité autour d’elles.

Toutes et tous ont marqué la maison et ont été progressivement effacés. J’ai tenté de les ramener à la lumière pour comprendre ce qui a pu être leur histoire, et son ombre portée sur la nôtre.";
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES (@author_firstname, @author_lastname, @author_borndate);

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	@author_biography
);

-- publisher
INSERT INTO publisher(name) VALUES (@publisher);

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  @book_summary,
  @book_releasedate,
  @book_pagenb,
  @book_ISBN,
  @book_PRICE,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name=@author_lastname)),
  (SELECT id_publisher FROM publisher WHERE name=@publisher)
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);


INSERT INTO story_character (id_book, name, role, description)
VALUES
	(@book_id, 'Le père', 'Personnage central', 'A rouvert la maison familiale et explore l’histoire familiale.'),
	(@book_id, 'Marguerite', 'Grand-mère', 'A vécu dans la maison et marque son histoire.'),
	(@book_id, 'Marie-Ernestine', 'Arrière-grand-mère', 'Mère de Marguerite, dont la vie influence la maison.'),
	(@book_id, 'Hommes gravitant autour', 'Personnages secondaires', 'Les hommes ayant marqué la maison et son histoire familiale.');











-- ----------------------------------------------Kolkhoze

SET @author_firstname := 'Emmanuel';
SET @author_lastname := 'Carrère';
SET @author_borndate := '1957-12-09';
SET @author_biography := "Emmanuel Carrère est né en 1957. D'abord journaliste il a publié un essai sur le cinéaste Werner Herzog en 1982 puis L'Amie du jaguar Bravoure (prix Passion 1984 prix de la Vocation 1985), Le Détroit de Behring essai sur l'Histoire imaginaire (prix Valery Larbaud et Grand Prix de la science-fiction française 1987),Hors d'atteinte ? et une biographie du romancier Philip K. Dick : Je suis vivant et vous êtes morts. La Classe de neige prix Femina 1995 a été porté à l'écran par Claude Miller et L'Adversaire par Nicole Garcia. En 2003 Emmanuel Carrère réalise un documentaire Retour à Kotelnitch et adapte lui-même en 2004 La Moustache avec Vincent Lindon et Emmanuelle Devos. Il a depuis écrit Un roman russe, D'autres vies que la mienne, Limonov prix Renaudot 2011, Le Royaume prix littéraire Le Monde, lauréat-palmarès Le Point, Meilleur livre de l'année, Lire 2014, Il est avantageux d'avoir où aller et Yoga. En 2020 il a réalisé un nouveau film Ouistreham d'après le livre de Florence Aubenas avec Juliette Binoche et des actrices non professionnelles. Ses livres sont traduits dans une vingtaine de langues.";

SET @publisher := 'POL';
SET @book_storyname := 'Kolkhoze';

SET @book_releasedate = '2025-08-28';
SET @book_pagenb = 558;
SET @book_ISBN = '9782818061985';
SET @book_PRICE = 24;

SET @book_summary = "Emmanuel Carrère, né en 1957, journaliste et écrivain français. Auteur de La Classe de neige (prix Femina 1995), L'Adversaire, Un roman russe, Limonov (prix Renaudot 2011) et Le Royaume. Ses livres sont traduits dans une vingtaine de langues.";
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES (@author_firstname, @author_lastname, @author_borndate);

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	@author_biography
);

-- publisher
INSERT INTO publisher(name) VALUES (@publisher);

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  @book_summary,
  @book_releasedate,
  @book_pagenb,
  @book_ISBN,
  @book_PRICE,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name=@author_lastname)),
  (SELECT id_publisher FROM publisher WHERE name=@publisher)
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);

INSERT INTO story_character (id_book, name, role, description)
VALUES
	(@book_id, 'La mère', 'Personnage central', 'La mère autour de laquelle se rassemble la famille pour la dernière fois.'),
	(@book_id, 'Les trois enfants', 'Personnages secondaires', 'Trois personnes rassemblées autour de leur mère, identités non précisées.');











-- ---------------------------------------------- La nuit au coeur

SET @author_firstname := 'Nathacha';
SET @author_lastname := 'Appanah';
SET @author_borndate := '1973-05-24';
SET @author_biography := "Nathacha Appanah est romancière. Ses romans ont été récompensés par plusieurs prix littéraires et traduits dans de nombreux pays. La nuit au coeur est son douzième livre.";

SET @publisher := 'Gallimard';
SET @book_storyname := 'La nuit au coeur';

SET @book_releasedate = '2025-08-21';
SET @book_pagenb = 282;
SET @book_ISBN = '9782073080028';
SET @book_PRICE = 21;

SET @book_summary = "« De ces nuits et de ces vies, de ces femmes qui courent, de ces coeurs qui luttent, de ces instants qui sont si accablants qu'ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l'impossibilité de la vérité entière à chaque page mais la quête désespérée d'une justesse au plus près de la vie, de la nuit, du coeur, du corps, de l'esprit.

De ces trois femmes, il a fallu commencer par la première, celle qui vient d'avoir vingt-cinq ans quand elle court et qui est la seule à être encore en vie aujourd'hui.

Cette femme, c'est moi. »

La nuit au coeur entrelace trois histoires de femmes victimes de la violence de leur compagnon. Sur le fil entre force et humilité, Nathacha Appanah scrute l'énigme insupportable du féminicide conjugal, quand la nuit noire prend la place de l'amour";
-- author
INSERT INTO person(first_name, last_name, born_date)
VALUES (@author_firstname, @author_lastname, @author_borndate);

INSERT INTO author(id_person, biography)
VALUES (
	LAST_INSERT_ID(),
	@author_biography
);

-- publisher
-- il existe deja;

-- book
INSERT INTO book(title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher)
VALUES (
  @book_storyname,
  @book_summary,
  @book_releasedate,
  @book_pagenb,
  @book_ISBN,
  @book_PRICE,
  (SELECT id_author FROM author WHERE id_person = (SELECT id_person FROM person WHERE last_name=@author_lastname)),
  (SELECT id_publisher FROM publisher WHERE name=@publisher)
);

-- characters
SET @book_id := (SELECT id_book FROM book WHERE title=@book_storyname);

-- characters
INSERT INTO story_character (id_book, name, role, description)
VALUES
(@book_id, 'Narratrice', 'Protagoniste', 'Première des trois femmes, victime de la violence conjugale.'),
(@book_id, 'Deuxième femme', 'Personnage secondaire', 'Deuxième des trois femmes victimes de la violence de leur compagnon.'),
(@book_id, 'Troisième femme', 'Personnage secondaire', 'Troisième des trois femmes victimes de la violence de leur compagnon.');




















