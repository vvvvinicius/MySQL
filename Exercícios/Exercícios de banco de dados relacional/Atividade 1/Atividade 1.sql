-- criando database
create database db_exercicio1;

-- informando que vamos usar a database criada
use db_exercicio1;

-- criando tabela
create table tb_funcionarios(
id bigint auto_increment,
nome varchar(20) not null,
sobrenome varchar(20) not null,
idade int(2) not null,
salario decimal(4, 3) not null,
primary key (id)
);

-- populando dados
INSERT INTO tb_funcionarios(nome, sobrenome, idade, salario) values ("João", "Pereira", 35, 3.400);
INSERT INTO tb_funcionarios(nome, sobrenome, idade, salario) values ("Maria", "Joaquina", 24, 1.000);
INSERT INTO tb_funcionarios(nome, sobrenome, idade, salario) values ("Mario", "Mendes", 32, 2.500);
INSERT INTO tb_funcionarios(nome, sobrenome, idade, salario) values ("Daniel", "Silva", 20, 4.200);
INSERT INTO tb_funcionarios(nome, sobrenome, idade, salario) values ("Joana", "Santos", 26, 1.200);

-- para retornar os salários maiores do que 2000
select * from tb_funcionarios where salario > 2.000;

-- para retornar os salários menores do que 2000
select * from tb_funcionarios where salario < 2.000;

-- atualizando um dado da tabela
update tb_funcionarios set idade = 30 where id = 5;