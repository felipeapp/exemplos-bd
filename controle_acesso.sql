drop database if exists controle_acesso;
create database controle_acesso;

use controle_acesso;

create table sala (
	id int primary key not null auto_increment,
    numero int not null unique,
    nome varchar(100) not null unique
);

create table usuario (
	id int primary key not null auto_increment,
    nome varchar(100) not null,
    endereco varchar(200) not null
);

create table permissao (
	id_sala int not null,
    id_usuario int not null,
    horario datetime not null default now(),
    primary key(id_sala, id_usuario),
    foreign key(id_sala) references sala(id)
		on update cascade on delete restrict,
    foreign key(id_usuario) references usuario(id)
		on update cascade on delete restrict
);

create table tag (
	id int primary key not null auto_increment,
    codigo char(8) not null unique,
    tipo enum('veicular', 'cartao', 'chaveiro') not null,
    id_usuario int,
    horario datetime,
    foreign key(id_usuario) references usuario(id)
		on update cascade on delete restrict
);

create table acesso (
	id_usuario int not null,
    id_sala int not null,
    id_tag int not null,
    permitido bool not null,
    horario datetime not null default now(),
    primary key(id_usuario, id_sala, id_tag, horario),
    foreign key(id_sala) references sala(id)
		on update cascade on delete restrict,
    foreign key(id_usuario) references usuario(id)
		on update cascade on delete restrict,
	foreign key(id_tag) references tag(id)
		on update cascade on delete restrict
);

create table servidor(
	id_usuario int primary key not null,
	matricula int not null unique,
    foreign key(id_usuario) references usuario(id)
		on update cascade on delete restrict
);

create table externo(
	id_usuario int primary key not null,
	cpf char(11) not null unique,
    id_servidor int not null,
    foreign key(id_usuario) references usuario(id)
		on update cascade on delete restrict,
	foreign key(id_servidor) references servidor(id_usuario)
		on update cascade on delete restrict
);
