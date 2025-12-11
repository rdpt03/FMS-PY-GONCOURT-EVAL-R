INSERT INTO session (selection_date, voting,session_name, n_of_winners, session_n) VALUES ("2025-09-03",FALSE,"Premiere sélection du prix Goncourt 2025",8,1);

INSERT INTO session_have_book (id_session,id_book) VALUES 
	(1,1),
    (1,2),
    (1,3),
    (1,4),
    (1,5),
    (1,6),
    (1,7),
    (1,8),
    (1,9),
    (1,10),
    (1,11),
    (1,12),
    (1,13),
    (1,14),
    (1,15);

-- votes
insert into vote values (1,NULL,15,1),(2,NULL,14,1),(3,NULL,10,1),(4,NULL,6,1),(5,NULL,9,1),(6,NULL,5,1),(7,NULL,13,1),(8,NULL,1,1);
insert into vote values (9,NULL,15,1),(10,NULL,14,1),(11,NULL,10,1),(12,NULL,6,1),(13,NULL,9,1),(14,NULL,5,1),(15,NULL,13,1),(16,NULL,1,1),(17,NULL,11,1),(18,NULL,2,1);
    