-- Cria banco de dados revista
create database revista;

-- Seleciona o banco de dados revista
use revista;

-- Cria a tabela Revista
-- idRevista será inserido automaticamente, e com valor inicial = 1
create table Revista(
idRevista int primary key auto_increment,
Nome varchar (40),
categoria varchar (30)
);

-- insere dados na tabela Revista, sem informar a categoria
insert into Revista (Nome) 
   values ('Epoca'), ('Veja'),
   ('Quatro Rodas'), ('Claudia');

-- Exibe os dados da tabela Revista   
select * from Revista;

-- Atualiza a categoria das revistas inseridas
update revista set categoria = 'variedade'
 where idRevista in(1, 2);
 update revista set categoria = 'automotivo' 
 where idRevista = 3;
 update revista set categoria = 'fofoca'
 where idRevista = 4;

-- Insere dados completos de mais 3 revistas
insert  into revista values (null, 'Capricho','fofoca'),
(null, 'Toda teen', 'fofoca' ), 
(null,'Super interessante', 'curiosidade'); 

-- Exibe os dados da tabela revista
select * from revista;

-- Exibe a descrição da tabela Revista
desc revista;

-- Altera a tabela Revista para que o tamanho da coluna categoria seja no max 40 
 alter table revista modify categoria varchar(40);

-- Exibe novamente a descrição da tabela Revista para ver a alteração do tamanho 
desc revista;

-- Altera a tabela revista, acrescentando uma coluna chamada periodicidade
alter table revista add periodicidade varchar (15);
-- Exibe novamente os dados da revista
select * from revista;
-- Altera tabela revista, excluindo a coluna periodicidade
alter table revista drop periodicidade;
-- Exibe novamente os dados da revista
select * from revista;

-- Cria a tabela editora
-- idEditora será inserido automaticamente e o valor inicial será 1000
create table editora (
idEditora int primary key auto_increment,
nomeEditora varchar(40),
datafund date
)auto_increment=1000;

-- Insere dados na tabela Editora
insert into editora values
(null, 'abril', '1999-03-12'),
(null, 'globo', '1989-05-23'),
(null, 'alto astral', '1985-07-21');

-- Acrescenta a coluna fkEditora à tabela Revista
alter table revista add fkEditora int;

-- Configura a coluna fkEditora como chave estrangeira que
-- referencia a tabela Editora - coluna idEditora
alter table revista add foreign key (fkEditora) 
       references editora(idEditora);

select * from editora;

select * from revista;

-- Atualiza o valor da coluna fkEditora da tabela Revista
update revista set fkEditora = 1000
      where idRevista in(2,3,4,5,7);
update revista set fkeditora =1001 where idREvista =1;
update revista set fkeditora =1002 where idRevista =6;

-- Exibe os dados das revistas e das editoras correspondentes
select * from revista, editora where fkeditora=ideditora;

-- Exibe os dados das revistas e das editoras correspondentes
-- mas somente de uma determinada editora (informar o nome da editora)
select*from revista, editora where fkeditora=ideditora and nomeeditora = 'Abril';

-- Exibe os dados das revistas e das editoras correspondentes
-- mas sem repetir o valor da coluna fkEditora
select revista.*, nomeEditora, dataFund from revista,editora
    where fkeditora=ideditora;
    
-- Idem ao comando anterior, mas alterando a forma como o nome 
-- da coluna é exibido no resultado do select    
select revista.*, nomeEditora as nome_Edit,
	dataFund as 'Data da Fundação' from revista,editora
    where fkeditora=ideditora;

select nomeEditora as 'Nome Editora' from editora;

select * from editora;

select datafund as 'Data da fundação da editora' from editora;

select e.nomeEditora,r.nome from revista as r, editora as e where fkeditora = ideditora;

select sysdate();


    
    