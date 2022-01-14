-- criando o banco de dados
create database db_pizzaria_legal;

-- informando o uso do banco de dados que foi criado
use db_pizzaria_legal;

-- criando tabela tb_categoria 
create table tb_categoria(
id bigint not null auto_increment,
tipo varchar(20) not null,
tamanho varchar(50) not null,
primary key (id)
);

-- populando dados das categorias
insert into tb_categoria (tipo, tamanho) values ("light", "broto");
insert into tb_categoria (tipo, tamanho) values ("light", "média");
insert into tb_categoria (tipo, tamanho) values ("integral", "broto");
insert into tb_categoria (tipo, tamanho) values ("integral", "média");
insert into tb_categoria (tipo, tamanho) values ("integral", "grande");

select * from tb_categoria;

-- criando tabela tb_pizza
create table tb_pizza(
id bigint not null auto_increment,
pedacos bigint(2) not null,
sabor varchar(50) not null,
preco decimal(5,2) not null,
estoque bigint(5) not null,
categoria_id bigint not null,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

-- populando dados das pizzas
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (8, "mussarela", 49.90, 40, 1);
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (4, "calabresa", 69.90, 50, 3);
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (8, "frango", 59.90, 20, 2);
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (8, "frango com catupiry", 39.90, 30, 1);
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (4, "marguerita", 69.90, 10, 4);
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (4, "salame", 39.90, 30, 5);
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (8, "camarão", 49.90, 40, 3);
insert into tb_pizza (pedacos, sabor, preco, estoque, categoria_id) values (4, "brasileira", 29.90, 50, 2);

-- select para retornar produtos com o valor maior do que 45 reais
select * from tb_pizza where preco > 45;

-- select para retornar produtos com valor entre 29 e 60 reais
select * from tb_pizza where preco > 29 and preco < 60;

-- select para retornar produtos com a letra C
select * from tb_pizza where sabor like "%c%";

-- select com inner join entre a tabela categoria e pizza
select * from tb_pizza inner join tb_categoria
on tb_categoria.id = tb_pizza.categoria_id;

-- select onde traga todos os produtos de uma classe específica
select * from tb_pizza inner join tb_categoria
on tb_categoria.id = tb_pizza.categoria_id
where tb_categoria.id = 4;