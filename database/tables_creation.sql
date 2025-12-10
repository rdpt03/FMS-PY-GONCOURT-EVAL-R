-- PERSON AND RELATED
CREATE TABLE person (
	id_person INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    born_date DATE,
	CONSTRAINT pk_person PRIMARY KEY (id_person) 
) ENGINE=InnoDB;

CREATE TABLE president(
	id_president INT NOT NULL AUTO_INCREMENT,
	id_person INT NOT NULL,
	CONSTRAINT pk_president PRIMARY KEY (id_president),
	CONSTRAINT fk_president_personne FOREIGN KEY (id_person) REFERENCES person(id_person)
) ENGINE=InnoDB;

CREATE TABLE jury(
	id_jury INT NOT NULL AUTO_INCREMENT,
	id_person INT NOT NULL,
	CONSTRAINT pk_jury PRIMARY KEY (id_jury),
	CONSTRAINT fk_jury_person FOREIGN KEY (id_person) REFERENCES person(id_person)
) ENGINE=InnoDB;

CREATE TABLE author(
	id_author INT NOT NULL AUTO_INCREMENT,
	id_person INT NOT NULL,
	biography VARCHAR(255) NOT NULL,
	CONSTRAINT pk_author PRIMARY KEY (id_author),
	CONSTRAINT fk_author_person FOREIGN KEY (id_person) REFERENCES person(id_person)
) ENGINE=InnoDB;

-- book related
CREATE TABLE publisher(
	id_publisher INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	CONSTRAINT pk_publisher PRIMARY KEY (id_publisher)
) ENGINE=InnoDB;

CREATE TABLE book(
	id_book INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50),
    summary VARCHAR(255),
    release_date DATE,
    pages_nb INT,
    ISBN CHAR(13),
    publisher_price float,
	id_author INT NOT NULL,
    id_publisher INT NOT NULL,
	CONSTRAINT pk_book PRIMARY KEY (id_book),
	CONSTRAINT fk_book_author FOREIGN KEY (id_author) REFERENCES author(id_author),
    CONSTRAINT fk_book_publisher FOREIGN KEY (id_publisher) REFERENCES publisher(id_publisher)
) ENGINE=InnoDB;

CREATE TABLE story_character(
	id_character INT NOT NULL AUTO_INCREMENT,
	id_book INT NOT NULL,
    name VARCHAR(255),
    role VARCHAR(50),
	description VARCHAR(150),
	CONSTRAINT pk_character PRIMARY KEY (id_character),
	CONSTRAINT fk_character_book FOREIGN KEY (id_book) REFERENCES book(id_book)
) ENGINE=InnoDB;


-- vote session related
-- session
CREATE TABLE session (
	id_session INT NOT NULL AUTO_INCREMENT,
    selection_date DATE,
    voting bool,
    session_name VARCHAR(50),
	CONSTRAINT pk_person PRIMARY KEY (id_session) 
) ENGINE=InnoDB;

CREATE TABLE session_have_book(
	id_have INT NOT NULL AUTO_INCREMENT,
	id_session INT NOT NULL,
	id_book INT NOT NULL,
	CONSTRAINT pk_have PRIMARY KEY (id_have),
	CONSTRAINT fk_have_book FOREIGN KEY (id_book) REFERENCES book(id_book),
    CONSTRAINT fk_have_session FOREIGN KEY (id_session) REFERENCES session(id_session)
) ENGINE=InnoDB;

-- vote
CREATE TABLE vote(
    id_vote INT NOT NULL AUTO_INCREMENT,
	id_jury INT,
    id_book INT NOT NULL,
	id_session INT NOT NULL,
    
	CONSTRAINT pk_vote PRIMARY KEY (id_vote),
    CONSTRAINT fk_vote_book FOREIGN KEY (id_book) REFERENCES book(id_book),
	CONSTRAINT fk_vote_jury FOREIGN KEY (id_jury) REFERENCES jury(id_jury),
    CONSTRAINT fk_vote_session FOREIGN KEY (id_session) REFERENCES session(id_session)
) ENGINE=InnoDB;







