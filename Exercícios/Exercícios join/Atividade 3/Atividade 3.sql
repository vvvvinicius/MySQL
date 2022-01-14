-- criando o banco de dados
create database db_farmacia_do_bem;

-- informando o uso do banco de dados que foi criado
use db_farmacia_do_bem;

-- criando tabela tb_categoria 
create table tb_categoria(
id bigint not null auto_increment,
tipo varchar(20) not null,
ativo boolean not null,
primary key (id)
);

-- populando dados das categorias
insert into tb_categoria (tipo, ativo) values ("beleza", true);
insert into tb_categoria (tipo, ativo) values ("remédios", true);
insert into tb_categoria (tipo, ativo) values ("higiene", true);
insert into tb_categoria (tipo, ativo) values ("comida", true);
insert into tb_categoria (tipo, ativo) values ("energético", true);

select * from tb_categoria;

-- criando tabela tb_produto 
create table tb_produto(
id bigint not null auto_increment,
nome varchar(100) not null,
quantidade int not null,
preco decimal(5,2) not null,
datacadastro timestamp,
categoria_id bigint not null,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

-- populando dados dos produtos
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Dipirona", 300, 9.90, current_date(), 2);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Monster", 200, 19.90, current_date(), 5);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Redbull", 150, 29.90, current_date(), 5);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Saldaginho", 100, 4.90, current_date(), 4);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Shampoo", 50, 54.90, current_date(), 3);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Base Mary Kay", 20, 64.90, current_date(), 1);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Neusadina", 400, 1.90, current_date(), 2);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("Coca-cola", 100, 6.90, current_date(), 4);

-- select para retornar produtos com o valor maior do que 50 reais
select * from tb_produto where preco > 50;

-- select para retornar produtos com valor entre 3 e 60 reais
select * from tb_produto where preco > 3 and preco < 60;

-- select para retornar produtos com a letra B
select * from tb_produto where nome like "%b%";

-- select com inner join entre a tabela categoria e produto
select * from tb_produto inner join tb_categoria
on tb_categoria.id = tb_produto.categoria_id;

-- select onde traga todos os produtos de uma classe específica
select * from tb_produto inner join tb_categoria
on tb_categoria.id = tb_produto.categoria_id
where tb_categoria.id = 5;