-- criação do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela client
CREATE TABLE client(
idCliente int auto_increment PRIMARY KEY,
Fname VARCHAR(10),
Minit CHAR(3),
Lname VARCHAR(20),
CPF CHAR(11) not null,
Address VARCHAR(30),
CONSTRAINTS UNIQUE_cpf_client UNIQUE (CPF)
);

-- criar tabela produto

-- size =dimensão do produto
CREATE TABLE product(
idProduct int auto_increment PRIMARY KEY,
Pname VARCHAR(10),
classification_kids bool,
category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos')DEFAULT,
avaliação FLOAT,
SIZE VARCHAR(10),
constraint UNIQUE_cpf_client UNIQUE (CPF)
);

--para ser continuado no desafio
CREATE TABLE payments(
idclient int,
idPayment int,
typePayment enum('Boleto','Cartã'),
limitAvailable FLOAT,
PRIMARY KEY(idCliente, id_payment)
);

-- criar tabela pedido
CREATE TABLE ORDER(
idOrder int auto_increment PRIMARY KEY,
idOrderClient int,
orderStatus enum('Cancelado','Confirmado','Em processamento') not NULL,
orderDescription VARCHAR(255),
sendValue FLOAT DEFAULT 10,
constraint fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idCliente)

--criar tabela estoque
CREATE TABLE productStorage(
idProdStorage int auto_increment primary KEY,
STORAGELocation varchar(255),
quantity int default 0,

--criar tabela fornecedor
CREATE TABLE supplier(
idSupplier int auto_increment primary KEY,
SocialName varchar(255) not null,
CNPJ char (15) noy NULL,
contact CHAR(11) not NULL,
contraint UNIQUE_supplier UNIQUE(CNPJ)
);


--criar tabela vendedor
create TABLE seller(
idSeller int auto_increment primary KEY,
SocialName VARCHAR(255) not NULL,
CNPJ char(15),
CPF char (9),
contact CHAR(11) not NULL,
constraint UNIQUE_cnpj_seller UNIQUE (CNPJ),
constraint UNIQUE_cpf_seller unique(CPF)
);

create table productSeller(
idPseller int,
idProduct int,
prodQuantity int DEFAULT 1,
PRIMARY KEY (idPseller, idProduct),
constraint fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
constraint fk_product_product FOREIGN KEY (idProduct)REFERENCES product(idProduct)
);

create table productOrder(
idPOproduct int,
idPOorder int,
poQuantity int DEFAULT 1,
poStatus enum ('Disponivel','Sem estoque') default 'Disponivel',
primary KEY (idPOproduct,idPOorder),
constraint fk_product_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
constraint fk_product_product FOREIGN KEY (idPOorder REFERENCES order (idOrder)
);

CREATE TABLE storageLocation(
idproduct int,
idstorage int,
location VARCHAR(255) not null,
constraint fk_product_seller FOREIGN KEY (idproduct) REFERENCES product(idProduct),
constraint fk_product_product FOREIGN KEY (idstorage) REFERENCES orders (productSeller)
);