-- criando o banco de dados
create database db_cursoDaMinhaVida;

-- informando o uso do banco de dados que foi criado
use db_cursoDaMinhaVida;

-- criando tabela tb_categoria 
create table tb_categoria(
id bigint not null auto_increment,
tipo varchar(20) not null,
ativo boolean not null,
primary key (id)
);

-- populando dados das categorias
insert into tb_categoria (tipo, ativo) values ("informática", true);
insert into tb_categoria (tipo, ativo) values ("social", true);
insert into tb_categoria (tipo, ativo) values ("matemática", true);
insert into tb_categoria (tipo, ativo) values ("idioma", true);
insert into tb_categoria (tipo, ativo) values ("jardinagem", true);

select * from tb_categoria;

-- criando tabela tb_produto 
create table tb_curso(
id bigint not null auto_increment,
nome varchar(100) not null,
maximo_alunos int(3) not null,
mensalidade decimal(5,2) not null,
carga_horas int(3) not null,
categoria_id bigint not null,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

-- populando dados dos produtos
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("alemão", 50, 99.90, 300, 4);
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("design gráfico", 100, 59.90, 100, 1);
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("japonês", 20, 49.90, 500, 4);
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("bonsai", 10, 9.90, 20, 5);
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("cálculos básicos", 15, 39.90, 20, 3);
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("cuidador de idosos", 5, 79.90, 100, 2);
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("adubagem", 15, 59.90, 30, 5);
insert into tb_curso (nome, maximo_alunos, mensalidade, carga_horas, categoria_id) values ("espanhol", 30, 39.90, 20, 4);

-- select para retornar produtos com o valor maior do que 50 reais
select * from tb_curso where mensalidade > 50;

-- select para retornar produtos com valor entre 3 e 60 reais
select * from tb_curso where mensalidade > 3 and mensalidade < 60;

-- select para retornar produtos com a letra J
select * from tb_curso where nome like "%j%";

-- select com inner join entre a tabela categoria e curso
select * from tb_curso inner join tb_categoria
on tb_categoria.id = tb_curso.categoria_id;

-- select onde traga todos os produtos de uma classe específica
select * from tb_curso inner join tb_categoria
on tb_categoria.id = tb_curso.categoria_id
where tb_categoria.id = 2;