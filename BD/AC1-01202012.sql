--  1)Criar Banco de dados
create database AC101202012;

--  2)Usar banco de dados
use AC101202012;

--  3 e 5) criar a tabela com no mínimo 5 campos e utilizado o AUTO-INCREMENT, NOT NULL e PRIMARY KEY 
Create table top5games2020(
	idGame int primary key auto_increment,
    Posição varchar(5) not null,
    Nome_game varchar(60),
    Desenvolvedora varchar(60),
    Data_lançamento date
    );
-- 6) Inserir pelo menos 5 registros da tabela
insert into top5games2020 values
(null,'1º','Cyberpunk 2077','CD Projekt','2020-04-16'),
(null,'2º','Final Fantasy 7 Remake','Square Enix','2020-03-03'),
(null,'3º','The Last of Us: Part 2','naughty dog','2020-05-29'),
(null,'4º','Doom Eternal','id Software','2020-03-20'),
(null,'5º','Dying Light 2','Techland','2020-10-25');

-- 7) Selects do usuario criado "Desenvolvedores Games"

-- a)Exibir todos os dados da tabela
select * from top5games2020; 

-- b) Exibir todos os dados da tabela por qualquer campo que não seja o ID em ordem decrescente ( Ordenado pelo nome do jogo)
select * from top5games2020 order by Nome_game desc;

-- c) Exibir apenas os dados de um campo da tabela.( apenas o nome das desenvolvedoras)
select Desenvolvedora from top5games2020;

-- d)Exibir os dados da tabela, do campo cujo dado tenha como penúltima letra uma determinada letra.( nome do game que tenha como penultima letra o 'k'
select * from top5games2020 where Nome_game like "%k_";

-- e) Exibir os dados da tabela, do campo cujo dado termine com uma determinada letra. (nome da desenvolvedora termine com 'g'
select * from top5games2020 where Desenvolvedora like '%g';

-- f) Atualizar um dado da tabela e exibir a tabela para verificar a atualização
-- atualizai a data de lançamento do idgame = 5 para 2020-12-13
update top5games2020 set data_lançamento = '2020-12-13' where idgame = 5;

-- Verifiquei se realmente atulizou a data
select * from top5games2020;

-- g)Excluir um registro da tabela e exibir a tabela para verificar a exclusão
delete from top5games2020 where idGame = 2;
-- Verifiquei se realmente tinha excluido
select * from top5games2020;


-- h) Eliminar a tabela e o banco de dados (OBS: o usuario Desenvolvedores Games" não tem permissão para excluir)
-- Excluir a tabela top5games2020
drop table top5games2020;

-- Excluir o banco de dados
drop database AC101202012;
    
    
    