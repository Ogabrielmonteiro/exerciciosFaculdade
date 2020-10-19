create database bd_exercico3;

use bd_exercico3;

-- Criar tabela banco de dados dos atletas
create table Atleta (
	idAtleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
    );

-- Inserir dados dos atletas 
insert into Atleta values
('01','Gabriel Monteiro','Corrida','10'),
('02','Olavio Trindade','Olimpico','05'),
('03','Giovanna Arvage','Natação','11');

insert into Atleta values
(05,'Jorje Ribeiro','Corrida', 04);

create table pais(
	idPais int primary key,
    nome varchar(80) not null,
    capital varchar(30) not null
);

select * from atleta;

select * from Atleta;insert into pais value
(1,'Brasil','Distrito Federal'),
(2,'Estados Unidos','Washington, D.C.'),
(3,'Canada','Ottawa');

select * from pais;

insert into pais value
(5,'Argentina','Buenos Aires');

alter table atleta add column fkpais int;

alter table atleta add foreign key (fkpais) references pais(idpais);

update atleta set fkpais = 1 where idAtleta =1;
update atleta set fkpais = 3 where idAtleta =2;
update atleta set fkpais = 5 where idAtleta =3;
update atleta set fkpais = 2 where idAtleta =5;

select * from atleta,pais where fkpais=idpais;

select * from atleta,pais where fkpais=idpais and pais.nome = 'Brasil';

-- --------------------------------------------------------------------------------------------- --
-- Criar a tabela musica
create table musica(
	idMusica int primary key,
	titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
    );
-- Inserir dados na tabela
insert into musica value
("1","cabelos arco-íris","Kamaitachi","Sad"),
("2","mundo da lua","Dfideliz","Trap"),
("3","6 balas","Kamaitachi","sad"),
("4","É só uma amiga","Aka Rasta","Trap"),
("5","A morte do autotune","Matuê","Trap"),
("6","Banco","Matuê","Trap"),
("7","Lúxuria","Xamã","Trap");

-- Exibir os dados da tabela
select * from musica;

create table Album (
	idAlbum int primary key,
	nome varchar (30) not null,
    gravadora varchar (60) not null
);

alter table musica add column fkAlbum int;
alter table musica add foreign key (fkAlbum) references musica(idmusica);

insert into album value
(1,'Trap','Dream Records'),
(2,'Sad','Produtora Matriz Music');

update musica set fkalbum = 1 where idmusica =2;
update musica set fkalbum = 1 where idmusica =4;
update musica set fkalbum = 1 where idmusica =5;
update musica set fkalbum = 1 where idmusica =6;
update musica set fkalbum = 1 where idmusica =7;
update musica set fkalbum = 2 where idmusica =1;
update musica set fkalbum = 2 where idmusica =3;

select * from musica,album where fkalbum=idalbum;

select * from musica,album where fkalbum=idalbum and album.gravadora = 'Dream Records';

