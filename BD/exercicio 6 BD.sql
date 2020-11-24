create database exercicio;

drop table gasto;

use exercicio;

create table pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(40) not null,
    dtNascimento date not null,
    profissão varchar(40) not null
);

alter table gasto add column fkPessoa int;
alter table gasto add foreign key (fkPessoa) references pessoa(idPessoa);

insert into pessoa values
(null,"Gabriel Monteiro","2001-09-21","programador"),
(null,"Jorge Amado","2001-09-21","jornalisata");

insert into pessoa values
(null,"Rafael Holand","1999-10-15","beta tester");

create table gasto(
	idGasto int primary key auto_increment,
    dt date not null,
    valor varchar(30) not null,
    descrição varchar(50)
);

insert into gasto values
(null,"2020-05-20","R$50,00","padaria"),
(null,"2020-05-21","R$30,00","mercado"),
(null,"2020-05-22","R$150,00","farmacia");

insert into gasto values
(null,"2020-05-20","R$150,00","whey",3),
(null,"2020-05-21","R$120,00","restaurante",1),
(null,"2020-05-22","R$38,00","Bk",2);

select * from pessoa;
select * from gasto;

update gasto set fkPessoa = 1 where idGasto = 1;
update gasto set fkPessoa = 2 where idGasto = 2;
update gasto set fkPessoa = 3 where idGasto = 3;

select nome, profissão from pessoa where idPessoa = 1;

select * from pessoa,gasto where fkPessoa=idPessoa;

select pessoa.nome, gasto.valor from pessoa, gasto where fkPessoa = idPessoa;

update pessoa set profissão = "Policia Civil" where idPessoa = 1;

delete from gasto where idGasto = 6; 






