create database db_cidade_das_carnes;

use db_cidade_das_carnes;

create table tb_categoria(
id bigint auto_increment,
descricao varchar(255) not null,
ativo boolean not null,
primary key (id)
);

insert into tb_categoria (descricao, ativo) values ("Bovino",true);
insert into tb_categoria (descricao, ativo) values ("Suino",true);
insert into tb_categoria (descricao, ativo) values ("Aves",true);
insert into tb_categoria (descricao, ativo) values ("pertence feijoada",true);
insert into tb_categoria (descricao, ativo) values ("imbutidos",true);
insert into tb_categoria (descricao, ativo) values ("soja",true);
insert into tb_categoria (descricao, ativo) values ("outros",true);

select * from tb_categoria;

create table tb_produtos (
id bigint auto_increment,
nome varchar (255) not null,
preco decimal(6,2) not null,
qtproduto int not null,
dtvalidade date,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("ASA",40.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Picanha",20.00,30, "2021-11-08", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("coxa de frango",20.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Bacon",30.00,30, "2021-11-09", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("hamburguer",60.00,30, "2021-09-07", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Cupim",20.00,30, "2021-11-10", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Peito de frango",25.00,30, "2021-11-09", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Orelha de porco",20.00,30, "2021-11-07", 4);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Salame",18.00,30, "2021-11-21", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("medalhao",50.00,30, "2021-11-15", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("mocoto",20.00,30, "2021-10-05", 2);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("chuleta",20.00,30, "2021-10-07", 1);
insert into tb_produtos (nome, preco, qtProduto) values ("acendedor de churrasqueira",20.00,30);
insert into tb_produtos (nome, preco, qtProduto) values ("soprador de churrasqueira",35.00,30);

select * from tb_produtos;

-- ordenando com ordem alfab??tica, de A pra Z
select * from tb_produtos order by nome;

-- ordenando com ordem alfab??tica, o DESC representa decrescente e faz ser de de Z pra A
select * from tb_produtos order by nome DESC;

-- ordenando duas colunas de forma decrescente, separa por v??rgula para funcionar
select * from tb_produtos order by nome, preco DESC;

-- AND, OR e NOT para opera????es l??gicas 
-- AND = vai trazer resultado se as duas condi????es forem v??lidas
-- OR = vai trazer resultado se uma das condi????es for v??lida
-- NOT = excluir do resultado

select * from tb_produtos where preco > 20 and categoria_id = 1;
-- exemplo do uso de and, para considerar as duas condi????es

-- IN e BETWEEN 
-- dispensa o uso de uma linha grande

-- in = define qual item queremos exibir
-- between = define o intervalo para exibir

select * from tb_produtos where preco in (20, 30, 40);
-- o in no uso acima vai trazer os pre??os onde o produto ?? 20, 30 ou 40, ou seja, substitui o OR

select * from tb_produtos where preco between 20 and 40;
-- o uso do between a cima vai trazer os pre??os onde o produto ?? 20 e 40

-- % indica qualquer texto, ?? um caracter coringa
-- exemplo ha% - vai buscar em todo o banco de dados as palavras que COME??AM com "ha" e o restane do texto se completa com %, ou seja, a regra ??: inicia com "ha"
-- exemplo %ha - vai buscar em todo o banco de dados as palavras que TERMINAM com "ha" e o in??cio do texto se completa com %, ou seja, a regra ??: termina com "ha"
-- exemplo %ha% - vai buscar em todo o banco de dados as palavras que CONT??M "ha", independente do in??cio, meio ou fim da palavra

-- like
select * from tb_produtos where nome like "%ha";
-- resultado ?? picanha, pois ?? o ??nico produto que termina com "ha"

select * from tb_produtos where nome like "ha%";
-- resultado ?? hamburguer, pois ?? o ??nico que come??a com "ha"

select * from tb_produtos where nome like "%ha%";
-- resultado ?? picanha, hamburguer, orelha de porco e medalh??o, pois todas t??m o "ha" em alguma posi????o da palavra

-- MATEM??TICA -- 

-- COUNT = conta coisas

select count(*) from tb_produtos;
-- o resultado ?? 14, o n??mero total de produtos

select count(categoria_id) from tb_produtos;
-- resultado ?? 12, pois dois produtos est??o sem categoria

-- SUM = soma
select sum(preco) from tb_produtos;
-- resultado ?? 398, pois ?? a soma total dos pre??os dos produtos

-- AVG = m??dia
select avg(preco) from tb_produtos;
-- resultado ?? 28.428571, pois ?? a soma de todos os produtos dividido pela quantidade de itens

-- group by = agrupa o que ?? igual, no exemplo abaixo vai tirar uma m??dia de cada categ??ria
select categoria_id, avg(preco) from tb_produtos group by categoria_id;

-- max e min
-- max = vai mostrar o maior valor
-- min = vai mostar o menor valor

-- mostrando o valor maior da tabela de pre??os
select max(preco) from tb_produtos;

-- mostrando o valor menor da tabela de pre??os
select min(preco) from tb_produtos;

-- as vai criar um alias, ou seja, um apelido para a coluna, exemplo:
select max(preco) as Maior_Pre??o from tb_produtos;

 -- join = vai unir coisas (tabelas)
 -- inner join = vai dizer ao SQL para mostrar apenas os produtos que possuem uma categoria associada, ou seja, vai mostrar apenas o que tiver rela????o entre as duas tabelas e categoria definida
 -- left join = al??m de pegar o que est?? associado (como no inner) + o que n??o tem categoria mas est?? o lado esquerdo, no caso, os produtos
 -- right join = al??m de pegar o que est?? associado (como no inner) + o que n??o tem categoria mas est?? o lado direito, no caso, as categorias
 
 -- tabela com chave estrangeira fica do lado esquerdo
 -- tabela com chave prim??ria fica do lado direito
 
 -- pr??tica -- 

 -- inner join
 select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao 
 -- selecionando nome, pre??o e descri????o da tabela produtos
 from tb_produtos inner join tb_categoria
 -- estou dizendo para juntar o que h?? rela????o entre as tabelas
 on tb_categoria.id = tb_produtos.categoria_id;
 -- id = chave prim??ria da tabela categoria
 -- categoria_id = chave estrangeira da categoria produtos
 -- estou dizendo ao MySQL atributos para a jun????o
 -- tb_produtos.nome vai informar onde queremos consultar, ou seja, o nome ser?? consultado na tabela tb_produtos
 
 -- left join
  select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao 
 -- selecionando nome, pre??o e descri????o da tabela produtos
 from tb_produtos left join tb_categoria
 -- estou dizendo para juntar o que h?? rela????o entre as tabelas + o lado esquerdo que ?? produtos
 on tb_categoria.id = tb_produtos.categoria_id;
 
 -- right join
  select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao 
 -- selecionando nome, pre??o e descri????o da tabela produtos
 from tb_produtos right join tb_categoria
 -- estou dizendo para juntar o que h?? rela????o entre as tabelas + o lado direito que ?? categoria
 on tb_categoria.id = tb_produtos.categoria_id;
 