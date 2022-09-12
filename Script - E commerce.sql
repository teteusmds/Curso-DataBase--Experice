-- Criação do banco de dados

create database ecommerce;

use ecommerce;

show tables;
insert into Clients (Fname, Minit, Lname, CPF, Address)values
	('Maria','M','Clara','123456789','Rua 10, San Martin - Recife'),
	('Matheus','O','Florentino','987654321','Rua 20, Barro - Recife'),
	('Jose','F','Henrique','132456789','Rua 30, Mustardinha - Recife'),
	('Paulo','S','Ricador','154326789','Rua 40, Mangueira - Recife'),
	('Lucas','G','Alves','987456321','Rua 50, Prado - Recife'),
	('Lais','M','Oliveira','987321654','Rua 60, San Martin - Recife');

insert into product (Pname,classification_kids,category,avaliação, size)values
	('Fone de ouvido',false,'Eletrônico','4',null),
	('Barbie Elsa',true,'Brinquedos','3',null),
	('Body Carters',true,'Vestimenta','5',null),
	('Microfone velho - Youtuber',false,'Eletrônico','4',null),
	('Farinha de arroz',false,'Alimentos','2',null),
	('Mouse',false,'Eletrônico','3',null);

select * from clients;
select * from product;

delete from orders where inOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)values
	(1,default,'compra via aplicativo',null,1),
	(2,default,'compra via aplicativo',50,0),
	(3,'confirmado',null,null,1),
	(4,default ,'compra via web site',150,0);
                         
select * from orders;

insert into productOrders(idPOproduct, idPOorder, poQuantity, poStatus)values
	(1,1,2,null),
	(2,1,1,null),
	(3,2,1,null);
                              

insert into productStorage(storageLocation,quantity)values
	('Recife',100),
	('Recife',50),	
	('Recife',25),
	('Olinda',75),
	('Jaboatão',100),	
	('Olinda',200);

insert into storageLocation(idLproduct, idLstorage, location)values
	(1,2,'RE'),
	(2,4,'Ol');

insert into supplier (SocialName, CNPJ, contact)values
	('teteus',37979792000106,'88383007'),
	('luuke', 67979792050105,'91168317'),
	('WoW', 67973863460112,'85049406');

select * from supplier;
insert into productSupplier(idPsSupplier, idPsProduct, quantity)values
	(1,1,200),
	(2,2,400),
	(3,3,600),
	(4,4,100),
	(5,5,50),
	(6,6,25); 

insert into seller(SocialName, AbsName, CNPJ, CPF, location, contact)values
	('NeuroTech',null,37979792000106,null,'Recife','91168317'),
	('Liferay',null,null,12915833435,'Recife','81168315'),
	('UFRPE',null,38279596000451,null,'Recife','61128319');

select * from seller; 

insert into productSeller(idPseller, idPproduct, prodQuantity)values
	(1,6,80),
	(2,7,10);

select * from productSeller;

select count(*) clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ', Lname) as Client, idOrder as Request,  orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)values
	(2, default, 'Compra via aplicativo',null,1);

select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;
 
 select * from orders;
select c.idClient,Fname,  count(*) as Number_of_Orders from clients c 
					inner join orders o ON c.idClient = o.idOrderClient
					inner join productOrder p  on p.idPOorder = o.idOrder
			group by idClient;
    
create table clients(
  idClient int auto_increment primary key,
  Fname varchar(10),
  Minit char(3),
  Lname varchar(20),
  CPF char(11) not null,
  Address varchar(30),
  constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;
desc clients;

create table product(
  idProduct int auto_increment primary key,
  Pname varchar(10),
  classification_kids bool default false,
  category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
  avaliação float default 0,
  size varchar(10)
);

create table payments(
  idClient int ,
  idPayment int,
  typePayment enum('Boleto','Cartão','Dois cartões'),
  limitAvaible float,
  primary key(idClient, idPpayment)
);

drop table orders;
create table orders(
  idOrder int auto_increment primary key,
  idOrderClient int,
  orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
  orderDescription varchar(255),
  sendValue float default 10,
  paymentCash bool default false,
  constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
            on update cascade
);
desc orders;

create table productStorage(
  idProdStorage int auto_increment primary key,
  storageLocation varchar(255),
  quantity int default 0
);


create table supplier(
  idSupplier int auto_increment primary key,
  SocialName varchar(2555) not null,
  CNPJ char(15) not null,
  contact char(11) not null,
  constraint unique_supplier unique (CNPJ)
);
desc supplier;


create table seller(
  idSeller int auto_increment primary key,
  SocialName varchar(255) not null,
  AbstName varchar(255),
  CNPJ char(15),
  CPF char(9),
  location varchar(255),
  contact char(11) not null,
  constraint unique_cnpj_seller unique (CNPJ),
  constraint unique_cpf_seller unique (CPF)
);


create table productSeller(
  idPseller int,
  idProduct int,
  prodQuantity int default 1,
  primary key(indPseller, idProduct),
  constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
  constraint fk_product_product foreign key (idProduct) references product(idProduct)
);
desc productSeller;


create table productOrder(
  idPOproduct int,
  idPOorder int,
  poQuantity int default 1,
  poStatus enum('Disponível','Sem estoque') default 'Disponível',
  primary key(idPOproduct, idPOorder),
  constraint fk_productOrder_seller foreign key (idPOproduct) references product(idProduct),
  constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
  idLproduct int,
  idLstorage int,
  location varchar(255) not null,
  primary key(idLproduct,idLstorage),
  constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
  constraint fk_storage_location_storage foreign key (iLstorage) references orders(productSeller)
);

create table productSupplier(
  idPsSupplier int,
  idPsProduct int,
  quantity int not null,
  primary key(idPsSupplier,idPsProduct),
  constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
  constraint fk_product_supplier_product foreign key (idPsProduct) references products(idProduct)
);
desc productSupplier;

show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';


