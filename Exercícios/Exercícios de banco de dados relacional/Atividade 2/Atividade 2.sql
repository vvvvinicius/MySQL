-- criando database
create database db_exercicio2;

-- informando o uso da database criada
use db_exercicio2;

-- criando tabela
create table tb_produtos(
id bigint auto_increment,
tipo varchar(20) not null,
cor varchar(20) not null,
tamanho varchar(20) not null,
valor decimal(6, 2) not null,
primary key (id)
);

-- populando dados
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("camiseta", "azul", "P", 649.90);
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("shorts", "preto", "M", 199.90);
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("blusa", "branca", "G", 519.90);
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("chinelo", "rosa", "38", 229.90);
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("touca", "lilás", "tamanho único", 29.90);
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("meia", "diversas", "tamanho único", 49.90);
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("calça", "roxa", "M", 99.90);
INSERT INTO tb_produtos(tipo, cor, tamanho, valor) values ("tênis", "amarelo", "40", 829.90);

-- para retornar os produtos com valor maior do que 500
select * from tb_produtos where valor > 500;

-- para retornar os produtos com valor menor do que 500
select * from tb_produtos where valor < 500;

-- atualizando um dado da tabela
update tb_produtos set valor = 119.99 where id = 6;