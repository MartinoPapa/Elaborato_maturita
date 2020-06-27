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
    partito varchar(35) not null,
    codice_parlamentare int not null,
    codice_legislatura int not null,
    codice_collegio int not null,
    constraint FK_Elezione_Parlamentare_Parlamentare
	foreign key (codice_parlamentare) references Parlamentare(codice_parlamentare),
    constraint FK_Elezione_Parlamentare_Legislatura
	foreign key (codice_legislatura) references Legislatura(codice_legislatura),
    constraint FK_Elezione_Parlamentare_Collegio_elettorale
	foreign key (codice_collegio) references Collegio_elettorale(codice_collegio)
);

