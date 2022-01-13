-- criando o banco de dados
create database db_generation_game_online;

-- informando o uso do banco de dados que foi criado
use db_generation_game_online;

-- criando tabela tb_classe
create table tb_classe(
id bigint not null auto_increment,
tipo varchar(20) not null,
fraquezas varchar(50) not null,
primary key (id)
);

-- populando dados da classe
insert into tb_classe (tipo, fraquezas) values ("guerreiro", "pouco ganho de EXP");
insert into tb_classe (tipo, fraquezas) values ("curandeiro", "baixo dano em chefões");
insert into tb_classe (tipo, fraquezas) values ("mago", "recebe mais dano");
insert into tb_classe (tipo, fraquezas) values ("atirador", "pouca defesa");
insert into tb_classe (tipo, fraquezas) values ("defensor", "pouca mana");

select * from tb_classe;

-- criando tabela tb_personagem
create table tb_personagem(
id bigint not null auto_increment,
nome varchar(20) not null,
ataque bigint(4) not null,
defesa bigint(4) not null,
categoria_id bigint not null,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_classe (id)
);

-- populando dados dos personagens
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Hydra", 3000, 3000, 1);
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Chelsa", 2300, 1500, 3);
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Cindra", 1000, 1500, 2);
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Tom", 2500, 5000, 5);
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Nídia", 4000, 2000, 1);
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Robert", 3000, 1000, 4);
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Katarina", 3500, 1500, 3);
insert into tb_personagem (nome, ataque, defesa, categoria_id) values ("Driko", 4000, 3000, 4);

-- select para retornar personagens com poder de ataque maior do que 2000
select * from tb_personagem where ataque > 2000;

-- select para retornar personagens com poder de defesa entre 1000 e 2000
select * from tb_personagem where defesa > 1000 and defesa < 2000;

-- select para retornar personagens com a letra C
select * from tb_personagem where nome like "%c%";

-- select com inner join entre tabela classe e personagem
select * from tb_personagem inner join tb_classe
on tb_classe.id = tb_personagem.categoria_id;

-- select onde traga todos os personagem de uma classe específica
select * from tb_personagem inner join tb_classe
on tb_classe.id = tb_personagem.categoria_id
where tb_classe.id = 1;
