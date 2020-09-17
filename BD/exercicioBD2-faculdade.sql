create database Revista;

use revista;

create table dados_revista (
	idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30)
);

insert into dados_revista value
(null,"Veja",""),
(null,"Isto é",""),
(null,"Epoca",""),
(null,"Quatro Rodas","");

select *from dados_revista;

update dados_revista set nome = "viva mais" where idRevista = 1;

update dados_revista set nome = " caras" where idRevista = 2;

update dados_revista set nome = "Ana Maria" where idRevista = 3;

insert into dados_revista value
(null,"veja",""), 
(null,"Isto é",""), 
(null,"Epoca","");

select * from dados_revista; 
-- descrição da estrutura da tabela
desc dados_revista;










