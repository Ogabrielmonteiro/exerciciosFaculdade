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

alter table pet add column fk

