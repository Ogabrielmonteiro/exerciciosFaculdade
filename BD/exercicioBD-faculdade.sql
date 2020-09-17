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
('04','Silvio Santos','Corrida','03');

insert into Atleta values
(05,'Jorje Ribeiro','Corrida', 04);

-- Alterar a quantidade de caracteres do nome
alter table atleta modify nome varchar(100);

-- Adicionar uma coluna 'datamedalha' 
alter table atleta add column datamedalha datetime;

-- Adicionar data e hora da tabela 'datamedalha'
update atleta set datamedalha = '2020-08-20 12:20:50' where idAtleta = 1;
update atleta set datamedalha = '2020-07-22 12:20:50' where idAtleta in (2,5);
update atleta set datamedalha = '2020-06-28 12:20:50' where idAtleta in (3,4);

-- Mostrar os dados da tabela
select * from Atleta;

-- Exibir apenas o nome e quantidade de medalhas dos atletas
select nome,qtdMedalha from Atleta;

-- Exibir atletas de uma determinada modalidade 
select * from Atleta where modalidade like 'corrida';

-- Exibir dados da tabela ordenados pela modalidade
select * from Atleta order by modalidade asc;

-- Exibir dados da tabela ordenasdos pela quantidade de medalhas em ordem decrescente
select * from Atleta order by qtdMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo o nome contenha a letra "s"
select * from Atleta where nome like "%s%";

-- Exibir os dados da tabela, dos atletas cujo o nome comece com uma determinada letra
select * from Atleta where nome like "G%";

-- Exibir os dados da tabela, dos atletas cujo o nome termine com a letra "o"
select * from Atleta where nome like "%o";

-- Exibir os dados da tabela, dos atletas cujo o nome tenha a penultima letra "r"
select * from Atleta where nome like "%d_";

select * from Atleta;

-- Exibir os dados da modalidade que é diferente de corrida 
select * from Atleta where modalidade != 'corrida';
select * from Atleta where modalidade <> 'corrida';

-- Exibir os dados da modalidade que é menor que 10
select * from Atleta where qtdMedalha < 10;

-- Descrever os schemas das colunas
describe atleta;

-- Eliminar a tabela
drop table Atleta;

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

-- Exibir apenas os titulos e os artistas das músicas
select titulo,artista from musica;

-- Exibir apenas os dados das músicas de um determinado gênero(Trap)
select * from musica where genero like "trap";

-- Exibir apenas os dados das músicas de um determinado artista(Matuê)
select * from musica where artista like "matuê";

-- Exibir os dados da tabela ordenados pelo título da musica
select * from musica order by titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente 
select * from musica order by artista desc;

-- Exibir os dados da tabela, das músicas cujo o título comece com uma determinada letra "A"
select * from musica where titulo like "A%";

-- Exibir os dados da tabela, das músicas cujo o artista comece com uma determinada letra "M"
select * from musica where artista like "M%";

-- Exibir os dados da tabela, das músicas cujo o gênero comece com uma determinada letra "T"
select * from musica where genero like "T%";

-- Exibir os dados da tabela, das músicas cujo o título tenha como penúltima letra uma determinada letra "i"
select * from musica where titulo like "%i_";

-- Eliminar a tabela
drop table musica;
