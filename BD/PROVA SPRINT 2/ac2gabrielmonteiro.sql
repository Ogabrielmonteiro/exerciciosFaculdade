-- criar Banco de dados
create database ac2gabrielmonteiro;

--  usar banco de dados
use ac2gabrielmonteiro;

-- criar tabela desenvolvedora
Create table desenvolvedora(
	idDesenvolvedora int primary key auto_increment,
	nome varchar(50) not null,
    data_fundação varchar(30) not null,
    tel_fixo varchar(30) not null,
    tel_fixo2 varchar(30),
    sede varchar(30) not null,
    endereço varchar(30) not null,
    bairro varchar(30) not null,
    cep varchar(10) not null,
    numero int not null,
    complemento varchar (30)
    );

-- inserir dados na tabela desenvolvedora
insert into desenvolvedora values
(null,'CD Projekt','8 de fevereiro de 1994','+1 310-846-0400','+1 842-514-0350','Varsóvia, Polônia','Belwederska','balask','00-450',1520,''),
(null,'Square Enix','27 de setembro de 1984','+1 972-271-1569','+1 888-648-4452','Santa Mônica, Califórnia, EUA','Pacific Coast Hwy','El Segundo','CA 90245',999,'prédio C'),
(null,'id Software','1 de fevereiro de 1991','+1 888-410-9922','','Richardson, Texas, EUA','Greenville Ave','Richardson','TX 75081',1500,''),
(null,'Techland','5 de agosto de 1991','+48 71 341 76 95','+48 80 412 56 12','Ostrów Wielkopolski, Polônia','Jana Szczyrki','Wrocław','54-426',911,'prédio A');


--  tabela top games das desenvolvedoras
Create table top_games(
	idGame int primary key auto_increment,
    idade_indicativa_18 enum('sim','não'),
    Nome_game varchar(40),
    Data_lançamento date
    )auto_increment = 101;
 
 drop table top_games;
 
-- inserir dados na tabela games
insert into top_games values
(null,'sim','Cyberpunk 2077','2020-04-16'),
(null,'sim','The Witcher 3: Wild Hunt','2015-05-18'),
(null,'não','Final Fantasy XIV','2010-09-30'),
(null,'não','Avengers','2020-08-14'),
(null,'sim','Doom Eternal','2020-10-25'),
(null,'sim','RAGE 2','2019-05-14'), 
(null,'sim','Dying Light 2','2021-10-25'), 
(null,'sim','Dead Island','2011-10-25'); 
  

alter table top_games add column fkdesenvolvedora int;

alter table top_games add foreign key (fkdesenvolvedora) references desenvolvedora(idDesenvolvedora);

update top_games set fkdesenvolvedora = 1 where idGame = 101;
update top_games set fkdesenvolvedora = 1 where idGame = 102;
update top_games set fkdesenvolvedora = 2 where idGame = 103;
update top_games set fkdesenvolvedora = 2 where idGame = 104;
update top_games set fkdesenvolvedora = 3 where idGame = 105;
update top_games set fkdesenvolvedora = 3 where idGame = 106;
update top_games set fkdesenvolvedora = 4 where idGame = 107;
update top_games set fkdesenvolvedora = 4 where idGame = 108;

-- Exibir a tabela dos games
select * from top_games;

-- Exibir a tabela das desenvolvedoras
select * from desenvolvedora;

-- Exibir os dados das tabelas, de forma correspondente;
select * from top_games,desenvolvedora where fkdesenvolvedora=idDesenvolvedora;

-- Exibir os dados de uma tabela utilizando uma das funções aprendidas (empresa mais antiga)
select min(data_fundação) from desenvolvedora; 

-- Exibir os dados de uma tabela utilizando uma das funções aprendidas (empresa mais nova)
select max(data_fundação) from desenvolvedora; 