-- criar Banco de dados
create database ac3gabrielmonteiro;

--  usar banco de dados
use ac3gabrielmonteiro;

create table desenvolvedora(
	idDesenvolvedora int primary key auto_increment,
    nome varchar(30) not null,
    dataFundação varchar(30) not null,
    sede varchar(30) not null
);

insert into desenvolvedora values
(null,"CD Projekt","8 de fevereiro de 1994", "Varsóvia, Polônia"),
(null,"Square Enix","27 de setembro de 1984", "Santa Mônica, Califórnia, EUA"),
(null,"id Software","1 de fevereiro de 1991", "Richardson, Texas, EUA");

create table jogador(
	idJogador int primary key auto_increment,
    nickName varchar(30) not null,
    plataforma varchar(30) not null
);

insert into jogador values
(null, "sh4dow-15FPS","Steam"),
(null, "Lemose","Playstation"),
(null, "E7","Xbox Live");

create table tempoGame(
	fkJogador int,
    foreign key (fkJogador) references jogador(idJogador),
    fkJogos int,
    foreign key (fkJogos) references jogos(idJogos),
    horasGame int not null
);

insert into tempoGame values
(1,1,180),
(1,2,600),
(1,3,350),
(2,1,120),
(2,2,380),
(2,3,420),
(3,1,720),
(3,2,1500),
(3,3,60);

create table jogos(
	idJogos int primary key auto_increment,
    nomeGame varchar(30) not null,
    genero varchar(30) not null,
	fkDesenvolvedora int,
    foreign key (fkDesenvolvedora) references desenvolvedora(idDesenvolvedora)
);

insert into jogos values
(null,"Cyberpunk 2077","FPS",1),
(null,"Tomb Raider","ação e aventura",2),
(null,"Doom Eternal","FPS",3);


-- Exibir os dados das tabelas criadas separadamente
select * from desenvolvedora;

select * from jogador;

select * from tempoGame;

select * from jogos;

-- Exibir os dados das tabelas, de forma correspondente
select * from tempogame
	inner join jogos
    on idJogos = fkJogos
    inner join jogador
    on idjogador = fkjogador
    inner join desenvolvedora
    on idDesenvolvedora = fkDesenvolvedora;

-- Exibir os dados das tabelas, de forma correspondente, de um determinado campo
select * from tempogame
	inner join jogos
    on idJogos = fkJogos
    inner join jogador
    on idjogador = fkjogador
    inner join desenvolvedora
    on idDesenvolvedora = fkDesenvolvedora and idJogador =1;
        
-- Exibir os dados da tabela associativa, utilizando o atributo numérico  (SUM, AVG, MIN, MAX) 
-- e agrupando esses dados por um determinado campo (GROUP BY).
select jogador.nickName, min(horasGame),max(horasGame) from jogador
	inner join tempoGame
    on idjogador = fkjogador
    group by nickName;