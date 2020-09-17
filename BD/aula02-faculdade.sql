-- Criar banco de dados
Create database faculdade; 

-- Selecionar tabela
use faculdade;

-- Criar tabela aluno
Create table aluno (
	ra char(8) primary key, 
	nome varchar(50),
    telefone varchar(25),
    email varchar (100)
);

alter table aluno add column fkEmpresa int;
alter table aluno add foreign key (fkempresa) references empresa (idempresa);

update aluno set fkempresa = 1 where ra='01202005';
update aluno set fkempresa = 2 where ra='01202007';
update aluno set fkempresa = 3 where ra='01202012';
update aluno set fkempresa = 4 where ra='01202013';
update aluno set fkempresa = 2 where ra='01202044';
update aluno set fkempresa = 1 where ra='01202055';

-- Atualizar o nome do campo telefone para fone
alter table aluno rename column telefone to fone;

-- Atualizar a quantidade de caracteres para nome
alter table aluno modify nome varchar(120);

-- Exibir dados da tabela
select * from aluno;

-- Descrição da tabela
desc aluno;
describe aluno;

-- Inserir dados na tabela
insert into aluno values
	('01202055', 'João Arnaut', '11-958471236','joao.arnaut@bandtec.com.br');
insert into aluno values
	('01202012', 'Gabriel Monteiro', '11-985414898','gabriel.monteiro@bandtec.com.br'),
	('01202044', 'Renan Aquino', '11-965287319','renan.aquino@bandtec.com.br'),
	('01202005', 'Gabriel Lemos', '11-964913728','gabriel.lemos@bandtec.com.br'),
	('01202007', 'Matheus Santos', '11-961342891','matheus.santos@bandtec.com.br');

-- Atualizar um dado da tabela
update aluno set telefone = '11-992831568' where ra= '01202044';

-- Exibir os nomes que terminan com a letra 's' 
select * from aluno where nome like '%s';

-- Exibir os nome que a segunda letra é 'a'
select * from aluno where nome like '_a%';

-- Exibir os nome que a penultima letra é 'o'
select * from aluno where nome like '%o_';

-- Deletar banco de dados
drop database faculdade;
	
-- Deletar tabela 
drop table aluno; 

Create table empresa(
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar (100),
    responsavel varchar (100)
);

insert into empresa values
(null,"C6","marcus"),
(null,"Safra","Christian"),
(null,"B3","Marcus"),
(null,"logicallis","Rennan"),
(null,"TIVIT","Gabriel");

select * from empresa;
-- mostrar aluno e dados da empresa
select * from aluno, empresa where idEmpresa = fkempresa;

select aluno.*,empresa.nomeEmpresa from aluno,empresa where idEmpresa = fkempresa;

