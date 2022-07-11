insert into categRestaurante (nome)
values ('Churrascaria');

insert into categRestaurante (nome)
values ('Sorveteria');

insert into categRestaurante (nome)
values ('Comida Japonesa');

insert into Restaurante ( IDRestaurante , CNPJ, Telefone , Endereco, Nome, NomeCategRestaurante)
values ( 0, 1001, 021999999999, 'BR 101', 'Vacaria', 'Churrascaria');

insert into categproduto (nome)
values ('Sobremesa');

Insert into categproduto (nome)
values ('Almoço');

insert into categproduto (nome)
values ('Café da manhã');

insert into produto (idproduto, nome, nomecategoria,idrestaurante)
values ( 0 , 'Brigadeiro', 'Sobremesa', 0);

insert into cliente ( idcliente,telefone,cpf,nome,endereco,valorsaldoapl)
values (0, '21912345678', '123.486.789-00' , 'Daniel' , 'Amaral Peixoto', 0);

INSERT into tipocartao (nome)
values ( 'Débito');

INSERT into tipocartao (nome)
values ( 'Crédito');

insert into cartao (numeracao , nometitular,validade,cvv, idcliente, nome)
values ('0000111122223333', 'Daniel Oliveira', '02/23', '123', 0, 'Débito');


insert into automovel ( idautomovel,cor,tipo,modelo)
values (0, 'Vermelho', 'Carro','Fiat Uno');

insert into entregador (identregador, cpf,nome, telefone, idautomovel)
values (0, '123.456.789-00' , 'Roger', '21912436587', 0);

insert into pedido (idpedido, idcliente,idproduto,idrestaurante,status,valor,qteprodutos,identregador,historicomensagens)
values (0,0,0,0,'Recebido',3, 1,0,'{}');

insert into avaliacao (nota, comentario,idrestaurante,idpedido)
values (5 , 'Comentário enche linguiça', 0, 0);


