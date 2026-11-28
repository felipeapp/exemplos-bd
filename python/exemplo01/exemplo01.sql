drop database if exists exemplo01;
create database exemplo01;

use exemplo01;

create table pessoa (
	id int primary key auto_increment not null,
    cpf char(11) unique not null,
    rg int unique not null,
    nome varchar(250) not null
);

select * from pessoa;
