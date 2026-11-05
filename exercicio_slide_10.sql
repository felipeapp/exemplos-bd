drop database if exists exercicio_slide_10;
create database exercicio_slide_10;

use exercicio_slide_10;

# Criação das tabelas
create table fornecedor (
	id int primary key auto_increment not null,
	nome varchar(150) not null unique,
	cidade varchar(100) not null
);

create table categoria (
	id int primary key auto_increment not null,
    nome varchar(150) not null unique
);

create table produto (
	id int primary key auto_increment not null,
	nome varchar(150) not null,
	valor decimal(6,2) not null,
	fornecedor_id int not null,
    categoria_id int not null,
	foreign key(fornecedor_id) references fornecedor(id) on delete restrict on update cascade,
    foreign key(categoria_id) references categoria(id) on delete restrict on update cascade
);

# Inserção dos fornecedores
insert into fornecedor (nome, cidade) value ('Philips', 'Natal');
set @id_philips = last_insert_id();

insert into fornecedor (nome, cidade) value ('Estrela', 'Natal');
set @id_estrela = last_insert_id();

insert into fornecedor (nome, cidade) value ('Toshiba', 'São Gonçalo do Amarante');
set @id_toshiba = last_insert_id();

insert into fornecedor (nome, cidade) value ('Microsoft', 'Parnamirim');
set @id_microsoft = last_insert_id();

# inserção das categorias
insert into categoria (nome) value ('Eletrônico');
set @id_eletronico = last_insert_id();

insert into categoria (nome) value ('Jogo');
set @id_jogo = last_insert_id();

insert into categoria (nome) value ('Informática');
set @id_informatica = last_insert_id();

# inserção dos produtos
insert into produto (nome, valor, fornecedor_id, categoria_id) value ('DVD Player', 150.00, @id_philips, @id_eletronico);
insert into produto (nome, valor, fornecedor_id, categoria_id) value ('Aparelho de Som', 150.00, @id_philips, @id_eletronico);
insert into produto (nome, valor, fornecedor_id, categoria_id) value ('Jogo Detetive', 50.00, @id_estrela, @id_jogo);
insert into produto (nome, valor, fornecedor_id, categoria_id) value ('Teclado', 500.75, @id_microsoft, @id_informatica);
insert into produto (nome, valor, fornecedor_id, categoria_id) value ('SmartTV', 1999.99, @id_toshiba, @id_eletronico);
insert into produto (nome, valor, fornecedor_id, categoria_id) value ('Notebook', 3000.59, @id_philips, @id_informatica);
insert into produto (nome, valor, fornecedor_id, categoria_id) value ('Microfone', 100.00, @id_microsoft, @id_eletronico);

# Mostrando o conteúdo das tabelas
select * from categoria;
select * from fornecedor;
select * from produto;
