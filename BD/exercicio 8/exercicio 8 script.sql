create database faculdade;

use faculdade;

create table grupo(
	idGrupo int primary key auto_increment,
    nomeGrupo varchar(45),
    descricaoProjeto varchar(45)
    );
    
select * from grupo;

insert into grupo value
(null,"5g soluções","bancada refrigerada");

insert into grupo value
(null,"Coffe Solutions","monitoramento de umidade no cultivo de café");

create table aluno(
	idRa char(8) primary key,
    nomeAluno varchar(45),
    emailAluno varchar(45),
    fkGrupo int,
    foreign key (fkGrupo) references Grupo(idGrupo)
    );

insert into aluno value
("01202012", "Gabriel Monteiro", "gabrielmonteiro@bandtec.com.br", 1),
("01202082", "Gabriel Ortelan", "gabrielortelan@bandtec.com.br", 1),
("01202024", "Larissa Lima", "larissalima@bandtec.com.br", 1),
("01202049", "Nicolas Conde", "nicolasconde@bandtec.com.br", 1),
("01202008", "Rafael Holland", "rafaelholland@bandtec.com.br", 1),
("01202010", "Talita Cabral", "talitacabral@bandtec.com.br", 1);
 
insert into aluno value 
(01202011, 'Gabriel Lemos', 'gabriel.junqueira@abndtec.com.br', '2'),
(01202054, 'Luik Castro', 'luik.silva@bandtec.com.br', '2'),
(01202046, 'Rennan Aquino', 'rennan.silva@bandtec.com.br', '2'),
(01201032, 'Leonardo Victor', 'leonardo.psilva@bandtec.com.br', '2'),
(01202084, 'Lucas Alves', 'lucas.sdsilva@bandtec.com.br', '2');

create table professor(
	idProfessor int auto_increment primary key,
    nomeProfessor varchar(45),
    disciplina varchar(45)
    ) auto_increment = 10000;

select * from professor;

insert into professor value
(null,"Yoshi", "algoritimo"),
(null,"Fernando Brandão", "pesquisa e inovação"),
(null,"Caio", "algoritimo"),
(null,"Fernanda Caramico", "pesquisa e inovação");

create table avaliacao(
	fkProfessor int,
    foreign key (fkProfessor) references professor(idProfessor),
    fkGrupo int,
    foreign key (fkGrupoAvali) references grupo(idGrupo),
    diaAvaliacao datetime,
    nota int);

select * from avaliacao;

insert into avaliacao value
(10000,1,"2020-11-20 14:00:00",8),
(10001,1,"2020-11-25 13:00:00",10),
(10002,1,"2020-11-15 12:00:00",9),
(10003,1,"2020-11-18 15:00:00",10);

insert into avaliacao value
(10000,2,"2020-11-20 14:00:00",5),
(10001,2,"2020-11-25 13:00:00",6),
(10002,2,"2020-11-15 12:00:00",8),
(10003,2,"2020-11-18 15:00:00",10);

-- Select's
-- Exibir todos os dados de cada tabela criada, separadamente.
select * from grupo;

select * from aluno;

select * from professor;

select * from avaliacao;

-- Exibir os dados dos grupos e os dados de seus respectivos alunos.

select * from aluno 
	inner join grupo 
    on idGrupo = fkGrupo;

-- Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.
select * from aluno
	inner join grupo 
    on idGrupo = fkGrupo and idGrupo = 1;

-- Exibir a média das notas atribuídas aos grupos, no geral.
select avg(nota) from avaliacao;

-- Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral.
select min(nota) from avaliacao;

select max(nota) from avaliacao;

--  Exibir a soma das notas dadas aos grupos, no geral
select sum(nota) from avaliacao;

-- Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da avaliação.
select * from professor
	inner join avaliacao
    on idProfessor = fkProfessor
    inner join grupo
    on idGrupo = fkGrupoAvali;

-- Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação.
select * from professor
	inner join avaliacao
    on idProfessor = fkProfessor
    inner join grupo
    on idGrupo = fkGrupoAvali and idGrupo = 1;

select * from professor
	inner join avaliacao
    on idProfessor = fkProfessor
    inner join grupo
    on idGrupo = fkGrupoAvali and idGrupo = 2;
    
-- Exibir os nomes dos grupos que foram avaliados por um determinado professor. --
select nomeGrupo from grupo
	inner join avaliacao
    on idGrupo = fkGrupoAvali
    inner join professor
    on idProfessor = fkProfessor and idProfessor = 10000;
    

-- Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a data e o horário da avaliação.    
select * from grupo
	inner join aluno
    on idGrupo = fkGrupo
    inner join avaliacao
    on idGrupo = fkGrupoAvali
    inner join professor
    on idProfessor = fkProfessor;
    
-- Exibir a quantidade de notas distintas.
select distinct(nota) from avaliacao;

-- Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por professor.
select Professor.nomeProfessor, avg(nota), sum(nota) from Professor
	inner join avaliacao on idProfessor = fkProfessor 
    group by nomeProfessor;

-- Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por grupo.
select grupo.nomeGrupo, avg(nota), sum(nota) from grupo
	inner join Avaliacao
	on idGrupo = fkGrupoAvali 
    group by nomeGrupo;
    
-- Exibir a identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por professor.
select Professor.nomeProfessor, min(nota), max(nota) from Professor
	inner join Avaliacao
	on idProfessor = fkProfessor 
    group by nomeProfessor;

-- Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por grupo.
select grupo.nomeGrupo, min(nota), max(nota) from grupo
	inner join Avaliacao
	on idGrupo = fkGrupoAvali group by nomeGrupo;

