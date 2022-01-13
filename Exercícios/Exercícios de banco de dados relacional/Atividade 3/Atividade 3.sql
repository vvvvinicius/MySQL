-- criando database
create database db_exercicio3;

-- informando que vamos usar a database criada
use db_exercicio3;

-- criando tabela
create table tb_estudantes(
id bigint auto_increment,
nome varchar(20) not null,
sobrenome varchar(20) not null,
turma varchar(20) not null,
nota decimal(2,1) not null,
primary key (id)
);

-- populando dados
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("Josefina", "Marques", "1º B", 3.6);
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("Joana", "Santos", "2º C", 5.6);
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("Rodrigo", "Silva", "4º D", 8.7);
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("Denise", "Rodrigues", "2º C", 5.1);
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("Laura", "Fereira", "1º B", 7.5);
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("Beatriz", "Barbosa", "4º B", 4.6);
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("João", "Freitas", "2º C", 8.5);
INSERT INTO tb_estudantes(nome, sobrenome, turma, nota) values ("Vitória", "Martins", "1º B", 9.5);

-- para retornar as notas maiores do que 7
select * from tb_estudantes where nota > 7;

-- para retornar as notas menores do que 7
select * from tb_estudantes where nota < 7;

-- atualizando um dado da tabela
update tb_estudantes set nota = 8.5 where id = 1;


