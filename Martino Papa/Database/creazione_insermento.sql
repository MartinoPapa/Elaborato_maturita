drop database if exists legislature_repubblica;
create database legislature_repubblica;
use legislature_repubblica;

create table Collegio_elettorale (
	codice_collegio int primary key auto_increment,
    nome varchar(30) not null,
    regione varchar(30) not null,
    tipologia varchar(30) not null,
    CHECK (tipologia = "deputati" OR tipologia = "senatori")
);

create table Legislatura (
	codice_legislatura int primary key auto_increment,
    data_inizio date not null,
    data_fine date
);

create table Votazione (
	codice_votazione int primary key auto_increment,
    data_votazione date not null,
    astenuti int not null,
    favorevoli int not null,
    contrari int not null
);

create table Legge (
	codice_legge int primary key auto_increment,
    titolo varchar(150) not null,
    approvazione_camera int not null,
    approvazione_senato int not null,
    legislatura_emanante int not null,
	constraint FK_Legge_Votazione_Camera
	foreign key (approvazione_camera) references Votazione(codice_votazione),
    constraint FK_Legge_Votazione_Senato
	foreign key (approvazione_senato) references Votazione(codice_votazione),
    constraint FK_Legge_Legislatura
	foreign key (legislatura_emanante) references Legislatura(codice_legislatura)
);

create table Parlamentare (
	codice_parlamentare int primary key auto_increment,
    nome varchar(30) not null,
    cognome varchar(30) not null
);

create table Voto_palese (
	codice_parlamentare int,
    codice_votazione int,
    voto varchar(20) not null,
    CHECK (voto IN ("pro","contro","astenuto","assente")),
    constraint FK_Voto_palese_Parlamentare
	foreign key (codice_parlamentare) references Parlamentare(codice_parlamentare),
    constraint FK_Voto_palese_Votazione
	foreign key (codice_votazione) references Votazione(codice_votazione),
    primary key(codice_parlamentare, codice_votazione)
);

create table Senatori_vita(
	codice_nomina int primary key auto_increment,
    presidente_nominante varchar(25) not null,
    gruppo_politico varchar(35),
    parlamentare_nominato int not null,
    codice_legislatura int not null,
    constraint FK_Senatori_vita_Parlamentare
	foreign key (parlamentare_nominato) references Parlamentare(codice_parlamentare),
    constraint FK_Senatori_vita_Legislatura
	foreign key (codice_legislatura) references Legislatura(codice_legislatura)
);

create table Elezione_Parlamentare(
	codice_elezione int primary key auto_increment,
    partito varchar(35),
    codice_parlamentare int not null,
    codice_legislatura int,
    codice_collegio int,
    constraint FK_Elezione_Parlamentare_Parlamentare
	foreign key (codice_parlamentare) references Parlamentare(codice_parlamentare),
    constraint FK_Elezione_Parlamentare_Legislatura
	foreign key (codice_legislatura) references Legislatura(codice_legislatura),
    constraint FK_Elezione_Parlamentare_Collegio_elettorale
	foreign key (codice_collegio) references Collegio_elettorale(codice_collegio)
);
/*
alter table Elezione_Parlamentare
modify codice_collegio int NOT NULL;

alter table Elezione_Parlamentare
modify codice_legislatura int NOT NULL;

alter table Elezione_Parlamentare
modify partito varchar(35) not null
*/
insert into Legislatura (codice_legislatura, data_inizio, data_fine) values (18, "2018-03-23", null);
insert into Legislatura (codice_legislatura, data_inizio, data_fine) values (17, "2013-03-15", "2018-03-22");
insert into Legislatura (codice_legislatura, data_inizio, data_fine) values (16, "2008-04-29", "2013-03-14");
insert into Legislatura (codice_legislatura, data_inizio, data_fine) values (15, "2006-04-28", "2013-04-14");
insert into Legislatura (codice_legislatura, data_inizio, data_fine) values (14, "2001-03-30", "2006-04-27");


/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Antonio', 'Misiani', 1);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Luciano', "D' Alfonso ",2);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Valeria ',' Fedeli ',3);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Vanna ',' Iori ',4);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Andrea ',' Marcucci ',5);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Vito ',' Vattuone ',6);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Alan ',' Ferrari ',7);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Dario ',' Parrini ',8);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Salvatore ',' Margiotta ',9);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Vincenzo ',"D 'Arienzo", 
    10
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Paola', 'Boldrini', 11);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Bruno', 'Astorre', 12);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Roberto', 'Rampi', 13);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Anna', 'Rossomando', 14);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Francesco', 'Verducci', 15);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Luigi', 'Zanda', 16);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Roberta', 'Pinotti', 17);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Daniele', 'Manca', 18);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Franco', 'Mirabelli', 19);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Tatjana', 'Rojc', 20);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Tommaso', 'Nannicini', 21);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Alessandro', 'Alfieri', 22);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Simona Flavia', 'Malpezzi', 23);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Monica', 'Cirinna',24);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Stefano ',' Collina ',25);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Andrea ',' Ferrazzi ',26);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Dario ',' Stefano ',27);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianni ',' Pittella ',28);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Francesco ',' Giacobbe ',29);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Valeria ',' Valente ',30);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Mauro Antonio Donato ',' Laus ',31);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Caterina ',' Biti ',32);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Caterina ',' Bini ',33);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Assuntela ',' Messina ',34);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Mino ',' Taricco ',35);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Emma ',' Bonino ',36);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianluigi ',' Paragone ',37);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Saverio ',' De Bonis ',38);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Liliana ',' Segre ',39);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Sandro ',' Ruotolo ',40);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Ricardo Antonio ',' Merlo ',41);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Lello ',' Ciampolillo ',42);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Matteo ',' Richetti ',43);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Vasco ',' Errani ',44);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Adriano ',' Cario ',45);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Francesco ',' Laforgia ',46);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Tommaso ',' Cerno ',47);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Mario ',' Monti ',48);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Pietro ',' Grasso ',49);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Mario Michele ',' Giarrusso ',50);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Loredana ',' De Petris ',51);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gregorio ',' De Falco ',52);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Paola ',' Nugnes ',53);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Elena ',' Fattori ',54);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Maurizio ',' Buccarella ',55);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Luigi ',' Di Marzio ',56);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Carlo ',' Martelli ',57);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Grazia ',' D Angelo', 
    58
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Marinella', 'Pacifico', 59);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Margherita', 'Corrado', 60);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gabriele', 'Lanzi', 61);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gisella', 'Naturale', 62);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Ettore Antonio', 'Licheri', 63);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Mario', 'Turco', 64);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Luisa', 'Angrisani', 65);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Nicola', 'Morra', 66);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Andrea', 'Cioffi', 67);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Elisa', 'Pirro', 68);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Alessandra', 'Maiorino', 69);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gabriella', 'Di Girolamo', 70);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giuseppe', 'Pisani', 71);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Elena', 'Botto', 72);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Vito Claudio', 'Crimi', 73);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Sabrina', 'Ricciardi', 74);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giorgio', 'Fede', 75);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Cataldo', 'Mininno', 76);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Angela Anna Bruna', 'Piarulli', 
    77
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Danila', 'De Lucia', 78);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Rosa Silvana', 'Abate', 79);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gianluca', 'Castaldi', 80);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Agostino', 'Santillo', 81);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Gianmauro', 'Dell Olio',82);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Francesco ',' Mollame ',83);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Maria Laura ',' Mantovani ',84);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Raffaele ',' Mautone ',85);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Arnaldo ',' Lomuti ',86);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Emiliano ',' Fenu ',87);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Pietro ',' Lorefice ',88);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Alberto ',' Airola ',89);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Daniele ',' Pesco ',90);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Sergio ',' Romagnoli ',91);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Stefano ',' Patuanelli ',92);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Susy ',' Matrisciano ',93);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Daniela ',' Donno ',94);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Fabrizio ',' Ortis ',95);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Primo ',' Di Nicola ',96);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Sergio ',' Puglia ',97);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Barbara ',' Lezzi ',98);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Francesco ',' Castiello ',99);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Silvana ',' Giannuzzi ',100);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Loredana ',' Russo ',101);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Paola ',' Taverna ',102);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Elio ',' Lannutti ',103);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Bianca Laura ',' Granato ',104);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Giuseppe ',' Auddino ',105);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Laura ',' Bottici ',106);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianni Pietro ',' Girotto ',107);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianluca ',' Ferrara ',108);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Virginia ',' La Mura ',109);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Matteo ',' Mantero ',110);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Felicia ',' Gaudiano ',111);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Fabio ',' Di Micco ',112);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Ruggiero ',' Quarto ',113);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Tiziana Carmela Rosaria ',' Drago ',114);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Emanuele ',' Dessi', 
    115
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Vito Rosario', 'Petrocelli', 116
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Donatella', 'Agostinelli', 117);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Sergio', 'Vaccaro', 118);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Stanislao', 'Di Piazza', 119);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Marco', 'Croatti', 120);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Elvira Lucia', 'Evangelista', 121
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Vincenzo', 'Santangelo', 122);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Patty', 'L Abbate',123);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Pierpaolo ',' Sileri ',124);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Iunio Valerio ',' Romano ',125);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Emma ',' Pavanelli ',126);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Rossella ',' Accoto ',127);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Maria Domenica ',' Castellone ',128);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Michela ',' Montevecchi ',129);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Cristiano ',' Anastasi ',130);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Danilo ',' Toninelli ',131);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianmarco ',' Corbetta ',132);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Barbara ',' Floridia ',133);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Fabrizio ',' Trentacoste ',134);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Cinzia ',' Leone ',135);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Giulia ',' Lupo ',136);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Agnese ',' Gallicchio ',137);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gaspare Antonio ',' Marinello ',138);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Mauro ',' Coltorti ',139);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Marco ',' Pellegrini ',140);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Alessandra ',' Riccardi ',141);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianluca ',' Perilli ',142);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Simona Nunzia ',' Nocerino ',143);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Giovanni ',' Endrizzi ',144);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Nunzia ',' Catalfo ',145);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Vilma ',' Moronese ',146);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Mattia ',' Crucioli ',147);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Barbara ',' Guidolin ',148);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Antonella ',' Campagna ',149);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Orietta ',' Vanin ',150);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Vincenzo ',' Garruti ',151);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Vincenzo ',' Presutto ',152);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianni ',' Marilotti ',153);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Pier Ferdinando ',' Casini ',154);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Giorgio ',' Napolitano ',155);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Dieter ',' Steger ',156);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Meinhard ',' Durnwalder ',157);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Albert ',' Laniece ',158);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Albert ',' Laniece ',159);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Elena ',' Cattaneo ',160);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Julia ',' Unterberger ',161);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianclaudio ',' Bressa ',162);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Francesco ',' Zaffini ',163);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gianpietro ',' Maffoni ',164);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Ignazio ',' La Russa ',165);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Daniela ',' Garnero Santanche ', 
    166
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Alberto', 'Balboni', 167);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Isabella', 'Rauti', 168);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Andrea', 'de Bertoldi', 169);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Nicola', 'Calandrini', 170);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giovanna', 'Petrenga', 171);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Stefano', 'Bertacco', 172);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Giovanbattista', 'Fazzolari', 173
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gaetano', 'Nastri', 174);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Luca', 'Ciriani', 175);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Patrizio Giacomo', 'La Pietra', 
    176
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Adolfo', 'Urso', 177);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Achille', 'Totaro', 178);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Antonio', 'Iannone', 179);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Massimo', 'Ruspandini', 180);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Armando', 'Siri', 181);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Stefania', 'Pucciarelli', 182);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gianfranco', 'Rufa', 183);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Marzia', 'Casolati', 184);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Raffaella Fiormaria', 'Marin', 185
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Mario', 'Pittoni', 186);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Stefano', 'Lucidi', 187);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Daisy', 'Pirovano', 188);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gian Marco', 'Centinaio', 189);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('William', 'De Vecchis', 190);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Francesco', 'Bruzzone', 191);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Simona', 'Pergreffi', 192);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Matteo', 'Salvini', 193);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Erica', 'Rivolta', 194);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Stefano', 'Corti', 195);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Massimiliano', 'Romeo', 196);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Umberto', 'Bossi', 197);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giorgio Maria', 'Bergesio', 198);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Rosellina', 'Sbrana', 199);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Cristiano', 'Zuliani', 200);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Emanuele', 'Pellegrini', 201);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Simone', 'Bossi', 202);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Paolo', 'Ripamonti', 203);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Stefano', 'Candiani', 204);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giuliano', 'Pazzaglini', 205);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Roberta', 'Ferrero', 206);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Ugo', 'Grassi', 207);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Maurizio', 'Campari', 208);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Antonella', 'Faggi', 209);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Claudio', 'Barbaro', 210);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Tiziana', 'Nisini', 211);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Pasquale', 'Pepe', 212);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Lucia', 'Borgonzoni', 213);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Elena', 'Testor', 214);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Simone', 'Pillon', 215);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Enrico', 'Montani', 216);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Tony Chike', 'Iwobi', 217);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Luigi', 'Augussori', 218);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Alberto', 'Bagnai', 219);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Francesco', 'Urraro', 220);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Valeria', 'Alessandrini', 221);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Michelina', 'Lunesu', 222);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Umberto', 'Fusco', 223);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Manuel', 'Vescovi', 224);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Paolo', 'Saviane', 225);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giulia', 'Bongiorno', 226);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Sonia', 'Fregolent', 227);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Luca', 'Briziarelli', 228);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Roberto', 'Calderoli', 229);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Roberto', 'Marti', 230);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Paolo', 'Tosato', 231);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Massimo', 'Candura', 232);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Maria', 'Saponara', 233);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Andrea', 'Ostellari', 234);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Paolo', 'Arrigoni', 235);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gianpaolo', 'Vallardi', 236);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Cesare', 'Pianasso', 237);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Pietro', 'Pisani', 238);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Erika', 'Stefani', 239);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Nadia', 'Pizzol', 240);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Maria Cristina', 'Cantu',241);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Stefano ',' Borghesi ',242);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Mauro Maria ',' Marino ',243);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Nadia ',' Ginetti ',244);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Eugenio ',' Comincini ',245);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Giuseppe Luigi Salvatore ',' Cucca ',246);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Gelsomina ',' Vono ',247);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Valeria ',' Sudano ',248);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Ernesto ',' Magorno ',249);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Laura ',' Garavini ',250);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Donatella ',' Conzatti ',251);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Riccardo ',' Nencini ',252);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Davide ',' Faraone ',253);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Leonardo ',' Grimani ',254);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Teresa ',' Bellanova ',255);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Francesco ',' Bonifazi ',256);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Daniela ',' Sbrollini ',257);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Annamaria ',' Parente ',258);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Matteo ',' Renzi ',259);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Massimo ',' Ferro ',260);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Giuseppe Tommaso Vincenzo ',' Mangialavori ',261);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Giancarlo ',' Serafini ',262);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Stefania Gabriella Anastasia ',' Craxi ',263);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Fulvia Michela ',' Caligiuri ',264);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Laura ',' Stabile ',265);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Marco ',' Perosino ',266);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Anna Maria ',' Bernini ',267);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Maria ',' Rizzotti ',268);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Massimo Vittorio ',' Berutti ',269);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Franco ',' Dal Mas ',270);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Fiammetta ',' Modena ',271);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Nazario ',' Pagano ',272);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Maria Alessandra ',' Gallone ',273);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Salvatore ',' Sciascia ',274);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Barbara ',' Masini ',275);
/* INSERT QUERY */INSERT INTO Parlamentare(nome,cognome,codice_parlamentare) VALUES( ' Niccolo ', 
    'Ghedini', 276
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Gilberto', 'Pichetto Fratin', 277
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Adriano', 'Galliani', 278);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Andrea', 'Cangini', 279);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Francesco', 'Battistoni', 280);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gaetano', 'Quagliariello', 281);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Anna Carmela', 'Minuto', 282);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Roberto', 'Berardi', 283);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Vincenzo', 'Carbone', 284);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Adriano', 'Paroli', 285);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Antonio', 'De Poli', 286);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Andrea', 'Causin', 287);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Paolo', 'Romani', 288);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Claudio', 'Fazzone', 289);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giacomo', 'Caliendo', 290);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Giuseppe', 'Moles', 291);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Maurizio', 'Gasparri', 292);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Domenico', 'De Siano', 293);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Lucio', 'Malan', 294);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Dario', 'Damiani', 295);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Massimo', 'Mallegni', 296);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Sandro Mario', 'Biasotti', 297);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Urania Giulia Rosina', 'Papatheu', 
    298
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Paola', 'Binetti', 299);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Renato', 'Schifani', 300);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Luigi', 'Cesaro', 301);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Antonio', 'Barboni', 302);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Maria Elisabetta', 'Alberti Casellati', 
    303
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Alfredo', 'Messina', 304);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Antonio', 'Saccone', 305);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Enrico', 'Aimi', 306);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Luigi', 'Vitali', 307);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Raffaele', 'Fantetti', 308);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Francesca', 'Alderisi', 309);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Gabriella', 'Giammanco', 310);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Roberta', 'Toffanin', 311);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Francesco Maria', 'Giro', 312);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Marco', 'Siclari', 313);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Alberto', 'Barachini', 314);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Emilio', 'Floris', 315);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Alessandrina', 'Lonardo', 316);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Mariarosaria', 'Rossi', 317);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  ('Licia', 'Ronzulli', 318);
/* INSERT QUERY */
INSERT INTO Parlamentare(
  nome, cognome, codice_parlamentare
) 
VALUES 
  (
    'Maria Virginia', 'Tiraboschi', 319
  );
/* CREATE TABLE */
CREATE TABLE IF NOT EXISTS Parlamentare(
  nome VARCHAR(100), 
  cognome VARCHAR(100)
);
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Rosa Silvana', 'Abate');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Rossella', 'Accoto');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Donatella', 'Agostinelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Enrico', 'Aimi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alberto', 'Airola');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  (
    'Maria Elisabetta', 'Alberti Casellati'
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesca', 'Alderisi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Valeria', 'Alessandrini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alessandro', 'Alfieri');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Cristiano', 'Anastasi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Luisa', 'Angrisani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paolo', 'Arrigoni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Bruno', 'Astorre');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giuseppe', 'Auddino');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Luigi', 'Augussori');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alberto', 'Bagnai');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alberto', 'Balboni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alberto', 'Barachini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Claudio', 'Barbaro');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Antonio', 'Barboni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Battistoni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Teresa', 'Bellanova');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Roberto', 'Berardi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giorgio Maria', 'Bergesio');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Anna Maria', 'Bernini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefano', 'Bertacco');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Massimo Vittorio', 'Berutti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Sandro Mario', 'Biasotti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paola', 'Binetti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Caterina', 'Bini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Caterina', 'Biti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  (
    'Vittoria Francesca Maria', 'Bogo Deledda'
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paola', 'Boldrini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Anna Cinzia', 'Bonfrisco');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giulia', 'Bongiorno');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Bonifazi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Emma', 'Bonino');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefano', 'Borghesi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Lucia', 'Borgonzoni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Simone', 'Bossi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Umberto', 'Bossi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Laura', 'Bottici');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Elena', 'Botto');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianclaudio', 'Bressa');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Luca', 'Briziarelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Bruzzone');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Maurizio', 'Buccarella');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Nicola', 'Calandrini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Roberto', 'Calderoli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giacomo', 'Caliendo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Fulvia Michela', 'Caligiuri');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Antonella', 'Campagna');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Maurizio', 'Campari');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefano', 'Candiani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Massimo', 'Candura');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Andrea', 'Cangini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefano', 'Collina');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mauro', 'Coltorti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Eugenio', 'Comincini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Donatella', 'Conzatti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianmarco', 'Corbetta');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Margherita', 'Corrado');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefano', 'Corti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  (
    'Stefania Gabriella Anastasia', 
    'Craxi'
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Vito Claudio', 'Crimi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Marco', 'Croatti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mattia', 'Crucioli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  (
    'Giuseppe Luigi Salvatore', 'Cucca'
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Vincenzo', 'Garruti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Maurizio', 'Gasparri');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Felicia', 'Gaudiano');

/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Virginia', 'La Mura');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Patrizio Giacomo', 'La Pietra');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Ignazio', 'La Russa');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Laforgia');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Albert', 'Laniece');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Elio', 'Lannutti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gabriele', 'Lanzi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mauro Antonio Donato', 'Laus');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Cinzia', 'Leone');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Barbara', 'Lezzi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Ettore Antonio', 'Licheri');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Arnaldo', 'Lomuti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alessandrina', 'Lonardo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Pietro', 'Lorefice');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefano', 'Lucidi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Michelina', 'Lunesu');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giulia', 'Lupo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianpietro', 'Maffoni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Lara', 'Magoni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Ernesto', 'Magorno');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alessandra', 'Maiorino');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Lucio', 'Malan');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Massimo', 'Mallegni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Simona Flavia', 'Malpezzi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Daniele', 'Manca');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  (
    'Giuseppe Tommaso Vincenzo', 'Mangialavori'
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Matteo', 'Mantero');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Maria Laura', 'Mantovani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Andrea', 'Marcucci');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Salvatore', 'Margiotta');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianni', 'Marilotti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Raffaella Fiormaria', 'Marin');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gaspare Antonio', 'Marinello');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mauro Maria', 'Marino');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Marco', 'Marsilio');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Carlo', 'Martelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Roberto', 'Marti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Barbara', 'Masini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Susy', 'Matrisciano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Raffaele', 'Mautone');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Ricardo Antonio', 'Merlo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alfredo', 'Messina');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Assuntela', 'Messina');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Cataldo', 'Mininno');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Anna Carmela', 'Minuto');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Franco', 'Mirabelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Antonio', 'Misiani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Fiammetta', 'Modena');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giuseppe', 'Moles');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Mollame');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Enrico', 'Montani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Michela', 'Montevecchi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mario', 'Monti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Vilma', 'Moronese');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Nicola', 'Morra');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Tommaso', 'Nannicini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giorgio', 'Napolitano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gaetano', 'Nastri');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gisella', 'Naturale');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Riccardo', 'Nencini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Tiziana', 'Nisini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Simona Nunzia', 'Nocerino');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paola', 'Nugnes');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Fabrizio', 'Ortis');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Franco', 'Ortolani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Andrea', 'Ostellari');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Marinella', 'Pacifico');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Nazario', 'Pagano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  (
    'Kristalia Rachele', 'Papaevangeliu'
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  (
    'Urania Giulia Rosina', 'Papatheu'
  );
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianluigi', 'Paragone');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Annamaria', 'Parente');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Adriano', 'Paroli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Dario', 'Parrini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Edoardo', 'Patriarca');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefano', 'Patuanelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Emma', 'Pavanelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giuliano', 'Pazzaglini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Emanuele', 'Pellegrini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Marco', 'Pellegrini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Pasquale', 'Pepe');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Simona', 'Pergreffi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianluca', 'Perilli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Marco', 'Perosino');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Daniele', 'Pesco');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giovanna', 'Petrenga');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Vito Rosario', 'Petrocelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Cesare', 'Pianasso');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Renzo', 'Piano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Angela Anna Bruna', 'Piarulli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gilberto', 'Pichetto Fratin');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Simone', 'Pillon');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Roberta', 'Pinotti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Daisy', 'Pirovano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Elisa', 'Pirro');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giuseppe', 'Pisani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Pietro', 'Pisani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianni', 'Pittella');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mario', 'Pittoni');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Nadia', 'Pizzol');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Vincenzo', 'Presutto');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Stefania', 'Pucciarelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Sergio', 'Puglia');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gaetano', 'Quagliariello');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Ruggiero', 'Quarto');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Roberto', 'Rampi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Isabella', 'Rauti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Matteo', 'Renzi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Alessandra', 'Riccardi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Sabrina', 'Ricciardi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Matteo', 'Richetti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paolo', 'Ripamonti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Erica', 'Rivolta');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Maria', 'Rizzotti');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Tatjana', 'Rojc');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Sergio', 'Romagnoli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paolo', 'Romani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Iunio Valerio', 'Romano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Massimiliano', 'Romeo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Licia', 'Ronzulli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mariarosaria', 'Rossi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Anna', 'Rossomando');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Carlo', 'Rubbia');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianfranco', 'Rufa');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Sandro', 'Ruotolo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Massimo', 'Ruspandini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Loredana', 'Russo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Antonio', 'Saccone');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Vincenzo', 'Santangelo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Agostino', 'Santillo');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Maria', 'Saponara');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paolo', 'Saviane');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Rosellina', 'Sbrana');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Daniela', 'Sbrollini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Renato', 'Schifani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Salvatore', 'Sciascia');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Liliana', 'Segre');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Giancarlo', 'Serafini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Marco', 'Siclari');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Pierpaolo', 'Sileri');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Armando', 'Siri');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Christian', 'Solinas');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Laura', 'Stabile');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Raffaele', 'Stancanelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Erika', 'Stefani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Dario', 'Stefano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Dieter', 'Steger');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Valeria', 'Sudano');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mino', 'Taricco');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paola', 'Taverna');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Donatella', 'Tesei');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Elena', 'Testor');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Maria Virginia', 'Tiraboschi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Roberta', 'Toffanin');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Danilo', 'Toninelli');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Paolo', 'Tosato');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Achille', 'Totaro');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Fabrizio', 'Trentacoste');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Mario', 'Turco');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Julia', 'Unterberger');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Urraro');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Adolfo', 'Urso');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Sergio', 'Vaccaro');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Valeria', 'Valente');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gianpaolo', 'Vallardi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Orietta', 'Vanin');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Vito', 'Vattuone');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Verducci');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Manuel', 'Vescovi');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Luigi', 'Vitali');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Gelsomina', 'Vono');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Francesco', 'Zaffini');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Luigi', 'Zanda');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Cristiano', 'Zuliani');
/* INSERT QUERY */
INSERT INTO Parlamentare(nome, cognome) 
VALUES 
  ('Andrea', 'de Bertoldi');

insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Valle d'Aosta - Dep", "Valle d'Aosta", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Piemonte 1 - Dep", "Piemonte", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Piemonte 2 - Dep", "Piemonte", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lombardia 1 - Dep", "Lombardia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lombardia 2 - Dep", "Lombardia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lombardia 3 - Dep", "Lombardia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lombardia 4 - Dep", "Lombardia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Trentino-Alto Adige - Dep", "Trentino-Alto Adige", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Friuli-Venezia Giulia - Dep", "Friuli-Venezia Giulia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Liguria - Dep", "Liguria", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Emilia-Romagna - Dep", "	Emilia-Romagna", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Toscana - Dep", "Toscana", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Umbria - Dep", "Umbria", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Marche - Dep", "	Marche", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lazio 1 - Dep", "Lazio", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lazio 2 - Dep", "Lazio", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Abruzzo - Dep", "Abruzzo", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Molise - Dep", "Molise", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Campania 1 - Dep", "Campania", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Campania 2 - Dep", "Campania", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Puglia - Dep", "Puglia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Basilicata - Dep", "Basilicata", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Calabria - Dep", "Calabria", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Sicilia 1 - Dep", "Sicilia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Sicilia 2 - Dep", "Sicilia", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Sardegna - Dep", "Sardegna", "deputati");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Estero - Dep", "Estero", "deputati");

insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Valle d'Aosta - Sen", "Valle d'Aosta", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Piemonte - Sen", "Piemonte", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lombardia - Sen", "Lombardia", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Trentino-Alto Adige - Sen", "Trentino-Alto Adige", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Veneto - Sen", "Veneto", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Friuli-Venezia Giulia - Sen", "Friuli-Venezia Giulia", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Liguria - Sen", "Liguria", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Emilia-Romagna - Sen", "Emilia-Romagna", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Toscana - Sen", "Toscana", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Umbria - Sen", "Umbria", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Marche - Sen", "Marche", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Lazio - Sen", "Lazio", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Abruzzo - Sen", "Abruzzo", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Molise - Sen", "Molise", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Campania - Sen", "Campania", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Puglia - Sen", "Puglia", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Basilicata - Sen", "Basilicata", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Calabria - Sen", "Calabria", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Sicilia - Sen", "Sicilia", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Sardegna - Sen", "Sardegna", "senatori");
insert into Collegio_elettorale(nome, regione, tipologia) VALUES ("Estero - Sen", "Estero", "senatori");
insert into Elezione_Parlamentare (codice_parlamentare)
select codice_parlamentare from parlamentare;

-- dati ufficiali 
update Elezione_Parlamentare set codice_legislatura = 18 where codice_elezione < 566;
update Elezione_Parlamentare set partito = "Partito Democratico" where codice_elezione < 36;
update Elezione_Parlamentare set partito = "Misto" where codice_elezione >= 36 AND codice_elezione < 60;
update Elezione_Parlamentare set partito = "MoVimento 5 Stelle" where codice_elezione >= 60 AND codice_elezione < 156;
update Elezione_Parlamentare set partito = "Per le Autonomie (SVP-PATT, UV)" where codice_elezione >= 156 AND codice_elezione < 165;
update Elezione_Parlamentare set partito = "Fratelli d'Italia" where codice_elezione >= 165 AND codice_elezione < 183;
update Elezione_Parlamentare set partito = "Lega-Salvini" where codice_elezione >= 183 AND codice_elezione < 245;
update Elezione_Parlamentare set partito = "Italia Viva - P.S.I." where codice_elezione >= 245 AND codice_elezione < 262;
update Elezione_Parlamentare set partito = "Forza Italia Berlusconi" where codice_elezione >= 262 AND codice_elezione < 322;

-- dati non ufficiali
update Elezione_Parlamentare set codice_collegio = FLOOR(RAND()*26)+1 where codice_elezione < 322;
update Elezione_Parlamentare set codice_collegio = FLOOR(RAND()*20)+28 where codice_elezione between 322 and 566;
update Elezione_Parlamentare set partito = "Partito Democratico" where codice_elezione between 321 and 351;
update Elezione_Parlamentare set partito = "Misto" where codice_elezione between 350 and 382;
update Elezione_Parlamentare set partito = "MoVimento 5 Stelle" where codice_elezione between 351 and 411;
update Elezione_Parlamentare set partito = "Per le Autonomie (SVP-PATT, UV)" where codice_elezione between 410 and 450;
update Elezione_Parlamentare set partito = "Fratelli d'Italia" where codice_elezione between 449 and 480;
update Elezione_Parlamentare set partito = "Lega-Salvini" where codice_elezione between 479 and 510;
update Elezione_Parlamentare set partito = "Italia Viva - P.S.I." where codice_elezione between 509 and 540;
update Elezione_Parlamentare set partito = "Forza Italia Berlusconi" where codice_elezione between 539 and 566;

-- dati ufficiali
update Elezione_Parlamentare set partito = null where codice_parlamentare = 479;
update Elezione_Parlamentare set partito = null where codice_parlamentare = 513;

insert into Elezione_Parlamentare (codice_elezione, codice_parlamentare)
select codice_parlamentare+565, codice_parlamentare from parlamentare where codice_parlamentare < 200;

insert into Elezione_Parlamentare (codice_elezione, codice_parlamentare)
select codice_parlamentare+443, codice_parlamentare from parlamentare where codice_parlamentare between 322 and 422;

update Elezione_Parlamentare set codice_collegio = FLOOR(RAND()*26)+1 where codice_elezione between 565 and 765;
update Elezione_Parlamentare set codice_collegio = FLOOR(RAND()*20)+28 where codice_elezione > 764;

update Elezione_Parlamentare set codice_legislatura = 17 where codice_elezione between 565 and 866;

update Elezione_Parlamentare set partito = "Partito Democratico" where codice_elezione between 565 and 565+36;
update Elezione_Parlamentare set partito = "Misto" where codice_elezione between 565+35 and 565+60;
update Elezione_Parlamentare set partito = "MoVimento 5 Stelle" where codice_elezione between 565+59 and 565+156;
update Elezione_Parlamentare set partito = "Per le Autonomie (SVP-PATT, UV)" where codice_elezione between 565+155 and 700;
update Elezione_Parlamentare set partito = "Fratelli d'Italia" where codice_elezione between 699 and 765;

update Elezione_Parlamentare set partito = "Partito Democratico" where codice_elezione between 764 and 790;
update Elezione_Parlamentare set partito = "Misto" where codice_elezione between 789 and 810;
update Elezione_Parlamentare set partito = "MoVimento 5 Stelle" where codice_elezione between 809 and 821;
update Elezione_Parlamentare set partito = "Per le Autonomie (SVP-PATT, UV)" where codice_elezione between 820 and 850;
update Elezione_Parlamentare set partito = "Fratelli d'Italia" where codice_elezione > 849;


alter table Elezione_Parlamentare
modify codice_collegio int NOT NULL;

alter table Elezione_Parlamentare
modify codice_legislatura int NOT NULL;

-- Mario Monti
insert into Senatori_vita (presidente_nominante, parlamentare_nominato, codice_legislatura) values ("Giorgio Napolitano", 124, 16);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2018-06-13', 58, 58, 32);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2018-06-07', 74, 57, 0);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2018-08-17', 95, 94, 79);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2018-11-28', 77, 68, 39);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2018-07-19', 21, 68, 33);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2019-09-21', 86, 82, 32);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2019-07-25', 39, 1, 60);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2019-02-13', 80, 16, 13);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2019-05-14', 75, 28, 97);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2019-10-31', 35, 66, 2);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2019-10-31', 35, 66, 2);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2015-10-31', 35, 66, 2);
insert into votazione (data_votazione, astenuti, favorevoli, contrari) values ('2016-10-31', 35, 66, 2);

insert into Legge (titolo, approvazione_camera, approvazione_senato, legislatura_emanante) values ("Ratifica ed esecuzione dell'Accordo tra il Governo italiano e il Governo di Singapore", 1, 10, 18);
insert into Legge (titolo, approvazione_camera, approvazione_senato, legislatura_emanante) values ("Modifiche agli articoli 56, 57 e 59 della Costituzione in materia di riduzione del numero dei parlamentari", 2, 9, 18);
insert into Legge (titolo, approvazione_camera, approvazione_senato, legislatura_emanante) values ("Ratifica ed esecuzione dell'Accordo tra il Governo e il Governo del Turkmenistan", 3, 8, 18);
insert into Legge (titolo, approvazione_camera, approvazione_senato, legislatura_emanante) values ("legalizzazione droghe leggere", 4, 6, 18);
insert into Legge (titolo, approvazione_camera, approvazione_senato, legislatura_emanante) values ("Cambiamento esame di stato", 12, 13, 17);

insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (74, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (2, 1, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (231, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (262, 1, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (320, 1, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (70, 1, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (54, 1, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (60, 1, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (66, 1, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (263, 1, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (218, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (86, 1, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (25, 1, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (35, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (162, 1, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (129, 1, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (319, 1, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (216, 1, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (294, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (269, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (38, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (64, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (69, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (296, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (102, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (84, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (184, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (227, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (322, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (321, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (313, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (85, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (27, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (6, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (210, 1, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (140, 1, 'pro');

insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (429, 5, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (399, 5, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (493, 5, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (346, 5, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (477, 5, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (323, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (473, 5, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (350, 5, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (472, 5, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (420, 5, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (498, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (351, 5, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (492, 5, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (380, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (521, 5, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (558, 5, 'pro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (562, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (526, 5, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (444, 5, 'assente');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (560, 5, 'astenuto');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (334, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (482, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (439, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (471, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (446, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (530, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (483, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (515, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (520, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (364, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (367, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (419, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (559, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (332, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (337, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (523, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (368, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (413, 5, 'contro');
insert into Voto_palese (codice_parlamentare, codice_votazione, voto) values (533, 5, 'contro');
drop view if exists Deputati;
CREATE VIEW Deputati AS
SELECT Parlamentare.nome as nome, Parlamentare.cognome as cognome, partito, Collegio_elettorale.nome as collegio, Elezione_Parlamentare.codice_legislatura as legislatura
FROM ((Parlamentare inner join Elezione_Parlamentare on Elezione_Parlamentare.codice_parlamentare = Parlamentare.codice_parlamentare)
inner join Collegio_elettorale on Collegio_elettorale.codice_collegio = Elezione_Parlamentare.codice_collegio) 
where tipologia = "deputati"
order by Elezione_Parlamentare.codice_legislatura, nome;

drop view if exists Senatori;
CREATE VIEW senatori AS
SELECT Parlamentare.nome as nome, Parlamentare.cognome as cognome, partito, Collegio_elettorale.nome as collegio, Elezione_Parlamentare.codice_legislatura as legislatura
FROM ((Parlamentare inner join Elezione_Parlamentare on Elezione_Parlamentare.codice_parlamentare = Parlamentare.codice_parlamentare)
inner join Collegio_elettorale on Collegio_elettorale.codice_collegio = Elezione_Parlamentare.codice_collegio) 
where tipologia = "senatori"
order by Elezione_Parlamentare.codice_legislatura, nome;

drop view if exists DettagliLegge;
CREATE VIEW DettagliLegge AS
select titolo, codice_legge, legislatura_emanante, t.approvazione_camera as approvazione_camera, t2.data_votazione as approvazione_senato
from (select codice_legge, data_votazione as approvazione_camera, approvazione_senato, titolo, legislatura_emanante
	from legge inner join votazione on approvazione_camera = codice_votazione) as t
    inner join votazione as t2 on t.approvazione_senato = t2.codice_votazione;

DROP USER if exists 'user'@'%';

CREATE USER 'user'@'%' IDENTIFIED BY 'user';
REVOKE ALL privileges ON *.* FROM 'user'@'%';
GRANT SELECT ON legislature_repubblica.* TO 'user'@'%'; -- l'utente può eseguire solo query senza modificare la struttura o i dati presenti nel db
ALTER USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'user'; -- permette l'autenticazione dal webserver
FLUSH PRIVILEGES;

