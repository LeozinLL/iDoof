create table categRestaurante (
nome varchar(100) not null
);
       
alter table categRestaurante Add constraint pk_categRestaurante Primary key (nome);

CREATE TABLE restaurante (
idRestaurante integer NOT NULL,
CNPJ integer NOT NULL unique,
telefone VARCHAR(11) NOT NULL,
nome varchar (100) not null, 
endereco VARCHAR(100) NOT NULL,
nomeCategRestaurante varchar (100) not null
);

ALTER TABLE restaurante ADD CONSTRAINT pk_restaurante PRIMARY KEY (idRestaurante);
alter table restaurante add constraint fk_restaurante foreign key (nomeCategRestaurante) references categRestaurante (nome);


CREATE TABLE tipoCartao (
nome varchar(100) not NULL
);

alter table tipoCartao add constraint pk_tipoCartao primary key (nome);

CREATE TABLE cliente (
idCliente integer NOT NULL,
telefone VARCHAR(11) NOT NULL,
CPF VARCHAR(14) NOT NULL unique,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(100) NOT NULL,
valorSaldoApl float (20) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT pk_cliente PRIMARY KEY (IdCliente);

create table saldoAplicativo 
(
  tipoSaldo varchar(20) not null,
  valorSaldo float(20) NOT NULL,
  idCliente integer not null
);
alter table saldoAplicativo add constraint pk_saldoAplicativo primary key (tipoSaldo);
alter table saldoAplicativo add constraint fk_saldoAplicativo foreign key (idCliente) references Cliente (idCliente);

Create table PIX (
chave varchar (20) not NULL
);

alter table PIX add constraint pk_chave primary key (chave);


create table automovel (
idAutomovel integer not NULL,
cor varchar(20),
tipo varchar(20),
modelo varchar(20)
);
  
ALTER Table automovel add constraint pk_idAutomovel primary key (idAutomovel); 

Create table entregador (
idEntregador integer not null,
CPF varchar(14) not NULL UNIQUE,
nome varchar (100) not NULL,
telefone varchar (11),
idAutomovel integer NOT NULL
);
   
ALTER TABLE entregador add constraint pk_entregador primary key (idEntregador);
aLTER TABLE entregador add constraint fk_entregador Foreign key (idAutomovel) references automovel (idAutomovel);
  
create table pixRestaurante (
chave varchar (20) not NULL,
idRestaurante integer not NULL
);
     
alter table pixRestaurante add constraint fk_pixRestaurante foreign key (chave) references PIX (chave);
Alter table pixRestaurante add constraint fk_pixRestaurante_idRestaurante foreign KEY ( idRestaurante) references restaurante (idRestaurante);

create table categProduto
(
  nome varchar (100) not null 
  );

alter table categProduto add constraint pk_categProduto primary key (nome);

create table produto (
idProduto integer not NULL,
nome varchar(100) not null, 
nomeCategoria varchar(100) NOT NULL,
idRestaurante integer NOT NULL
);

 ALTER Table produto add constraint pk_idProduto primary key (idProduto);
 aLTER TABLE produto add constraint fk_idProduto Foreign key (idRestaurante) REFERENCES restaurante (idRestaurante);
 alter table produto add constraint fk_nome foreign key (nomeCategoria) references categProduto (nome);
 
 
create table cartao (
numeracao varchar (16) not null,
nomeTitular varchar (100) not null,
validade varchar (5) not null,
cvv varchar (3) not null,
idCliente integer not null,
nome varchar (100) not NULL
);

alter table cartao add constraint pk_cartao primary key (numeracao);
alter table cartao add constraint fk_cartao foreign key (nome) references tipoCartao (nome);


CREATE TABLE pagamento (
dataPag DATE NOT NULL,
tipoPagamento VARCHAR(30) NOT NULL
);

alter table pagamento add constraint pk_pagamento primary key (tipoPagamento);


CREATE TABLE pedido (
idPedido integer NOT NULL,
idCliente integer NOT NULL,
idProduto integer NOT NULL,
idRestaurante integer NOT NULL,
status VARCHAR(20) NOT NULL,
valor FLOAT NOT NULL,
qteProdutos INTEGER NOT NULL,
idEntregador integer NOT NULL,
historicoMensagens json not null 
);

ALTER TABLE pedido ADD CONSTRAINT pk_pedido PRIMARY KEY (IdPedido);
ALTER TABLE pedido ADD CONSTRAINT fk_pedido_idRestaurante FOREIGN KEY (idRestaurante) REFERENCES restaurante (idRestaurante);
ALTER TABLE pedido ADD CONSTRAINT fk_pedido_cpf FOREIGN KEY (idEntregador) REFERENCES entregador (idEntregador);
ALTER TABLE pedido ADD CONSTRAINT fk_pedido_idCliente FOREIGN KEY (idCliente) REFERENCES cliente (idCliente);
ALTER TABLE pedido ADD CONSTRAINT fk_pedido_idProduto FOREIGN KEY (idProduto) REFERENCES produto (idProduto);


CREATE TABLE avaliacao (
nota INTEGER not NULL check (nota < 6 and nota > 0),
comentario VARCHAR(300),
idRestaurante integer NOT NULL,
idPedido integer NOT NULL
);

ALTER TABLE avaliacao ADD CONSTRAINT fk_pedido_idRestaurante FOREIGN KEY (idRestaurante) REFERENCES restaurante (idRestaurante);
ALTER TABLE avaliacao ADD CONSTRAINT fk_pedido_idPedido FOREIGN KEY (idPedido) REFERENCES pedido (idPedido);


