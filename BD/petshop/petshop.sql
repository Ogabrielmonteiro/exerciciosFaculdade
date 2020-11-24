create database petshop;
use petshop;


create table pet(
	idPet int auto_increment primary key,
    tipoAnimal varchar(20) not null,
    nome varchar(30) not null,
    raca varchar(20) not null,
    nasPet date not null
)auto_increment = 101; 

select * from pet;

insert into pet values
(null,"gato","miau","persa","2005-09-20");

insert into pet values
(null,"cachorro","jade","vira lata","2009-04-26"),
(null,"papagaio","pirata","galego","2015-05-02"),
(null,"hamster","astolfo","chinês","2013-02-15");


create table cliente(
	idCliente int primary key auto_increment,
    nome varchar(50) not null,
    telFixo varchar(15) not null,
    telCel varchar(20) not null,
    rua varchar(50) not null,
    bairro varchar(50) not null,
    cep varchar(15) not null,
    numero_casa int not null
);

alter table pet add foreign key (fkcliente) references cliente(idCliente);
alter table pet add column fkcliente int;

select * from cliente;

insert into cliente values
(null,"Jorge Amado","(11)1564 2837","(11)9 5644 2837","Rua das Americas","vila velha","02256-450",120),
(null,"Robson Amado","(11)8705 6419","(11)9 9718 4518","Av Paulista","Augusta","04585-123",4850);

update pet set fkcliente = 1 where idPet = 101;
update pet set fkcliente = 1 where idPet = 103;
update pet set fkcliente = 2 where idPet = 102;
update pet set fkcliente = 2 where idPet = 104;

-- Altere o tamanho da coluna nome do cliente.
alter table cliente modify nome varchar(60);

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from pet where tipoAnimal = "gato";

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nome,naspet from pet;
-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from pet order by nome;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from cliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet where nome like "p%";

--  Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from cliente where nome like "%Amado";

-- Alterar o telefone de um determinado cliente
update cliente set telFixo = "(11) 0854 6418" where idcliente = 2;

-- Exibir os dados dos clientes para verificar se alterou.
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos
select * from pet,cliente where fkcliente=idCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente
select * from pet,cliente where fkcliente=idCliente and cliente.nome = 'Robson Amado'; 

-- Excluir algum pet.
delete from pet where idPet = 101;

-- Exibir os dados dos pets para verificar se excluiu.
select * from pet;

