-- criando o banco de dados
create database db_cidade_das_carnes;

-- informando o uso do banco de dados que foi criado
use db_cidade_das_carnes;

-- criando tabela tb_categoria 
create table tb_categoria(
id bigint not null auto_increment,
tipo varchar(20) not null,
ativo boolean not null,
primary key (id)
);

-- populando dados das categorias
insert into tb_categoria (tipo, ativo) values ("bovino", true);
insert into tb_categoria (tipo, ativo) values ("frango", true);
insert into tb_categoria (tipo, ativo) values ("peixe", true);
insert into tb_categoria (tipo, ativo) values ("suíno", true);
insert into tb_categoria (tipo, ativo) values ("utilidades", true);

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
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("maminha", 20, 59.90, current_date(), 1);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("peito", 30, 9.90, current_date(), 2);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("coxa", 50, 29.90, current_date(), 2);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("alcatra", 60, 69.90, current_date(), 1);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("salmão", 10, 49.90, current_date(), 3);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("bacon", 15, 19.90, current_date(), 4);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("tilápia", 30, 49.90, current_date(), 3);
insert into tb_produto (nome, quantidade, preco, datacadastro, categoria_id) values ("carvão", 50, 50.90, current_date(), 5);

-- select para retornar produtos com o valor maior do que 50 reais
select * from tb_produto where preco > 50;

-- select para retornar produtos com valor entre 3 e 60 reais
select * from tb_produto where preco > 3 and preco < 60;

-- select para retornar produtos com a letra B
select * from tb_produto where nome like "%c%";

-- select com inner join entre a tabela categoria e produto
select * from tb_produto inner join tb_categoria
on tb_categoria.id = tb_produto.categoria_id;

-- select onde traga todos os produtos de uma classe específica
select * from tb_produto inner join tb_categoria
on tb_categoria.id = tb_produto.categoria_id
where tb_categoria.id = 2;