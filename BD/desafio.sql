create database desafio;

drop table endereço;

use desafio;

select * from condominio;

create table condominio(
	idCond int primary key auto_increment,
    nomeCond varchar(30) not null,
    descrição varchar(50) not null,
    fkCep char(15),
    foreign key (fkCep) references endereço(idCep)
);

insert into condominio values
(null,"Bela Vista","Perto da praia do guaruja","02256160");

insert into condominio values
(null,"Nova Era","Perto do Pão de açucar","02252341"),
(null,"Santos","Em frente a praia","81255160");


create table endereço(
	idCep char(15) primary key,
	logradouro varchar(30) not null,
    numero int not null,
    bairro varchar(30) not null,
    cidade varchar(30) not null
);

insert into endereço values
("02256160","Avenida","1250","vlia velha","São Paulo");

insert into endereço values
("02252341","Avenida","850","Santos","São Paulo"),
("81255160","Avenida","700","Praia Grande","São Paulo");

select * from condominio, endereço where fkCep = idCep;


create table unidade(
	idUnid int primary key auto_increment,
    apartamento int not null,
    andar varchar(3) not null,
    fkCondominio int,
    foreign key (fkCondominio) references condominio(idCond)
);

insert into unidade values
(null,58,"3º",1),
(null,80,"1º",3),
(null,30,"10º",2);

select * from unidade;

create table pessoa(
	idPessoa int primary key auto_increment,
    nomePessoa varchar(30) not null,
    telefoneFix varchar(20) not null,
    telefoneCel varchar(20) not null
);

insert into pessoa values
(null,"Rafael Holland","2546-1837","9 3182-3719"),
(null,"Gabriel Monteiro","1875-1928","9 4681-1379"),
(null,"Larrisa lima","2518-3542","9 5494-1256");

select * from pessoa;

create table possui(
	idPossui int primary key auto_increment,
    porcentagem varchar(10),
    fkPessoa int,
    foreign key (fkPessoa) references pessoa(idPessoa),
    fkUnidade int,
    foreign key (fkUnidade) references unidade(idUnid)
    );

insert into possui values
(null,"30%",1,1),
(null,"60%",2,2),
(null,"10%",3,3);

select * from possui;

select condominio,pessoa,unidade;

select condominio.*, unidade.* from condominio, unidade where idCond = idUnid;
