create table tbAluno(
	idAluno int primary key not null auto_increment,
    nomeAluno varchar(100) not null,
    idadaAluno int
)auto_increment=1;

Create table tbTelefoneAluno(
	idTelefoneAluno int primary key not null auto_increment,
	NumeroTelefoneAluno varchar(10),
    idAluno int not null,
	foreign key (idAluno) references tbAluno(idAluno) 
)auto_increment=1;

insert into tbAluno (nomeAluno,idadaAluno) values ("Joseph Silva", 20);
insert into tbAluno (nomeAluno,idadaAluno) values ("Igor da Silva",18);
insert into tbAluno (nomeAluno,idadaAluno) values ("Gabriel Monteiro",17);

insert into tbTelefoneAluno (NumeroTelefoneAluno,idAluno) value ("9 85125212",1);
insert into tbTelefoneAluno (NumeroTelefoneAluno,idAluno) value ("9 05143275",2);
insert into tbTelefoneAluno (NumeroTelefoneAluno,idAluno) value ("9 04861269",3);

update tbTelefoneAluno set NumeroTelefoneAluno = "9 12562168" where idTelefoneAluno = 2;

select * from tbAluno;
select * from tbTelefoneAluno;