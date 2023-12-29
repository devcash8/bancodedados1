-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address) 
	   values('Carlos','S','da Hora', 12346789, 'rua A 23, Centro - SSA'),
		     ('Mônica','M','Feitosa', 987654321,'Praça B 34, Centro - SSA'),
			 ('Ana','C','Santos', 45678913,'avenida 7 19, Barra - CAM'),
			 ('Antônio ','T','Moreira', 789123456,'rua G 81, Lapa - Cidade Nova'),
			 ('Roberty','K','Rico', 98745631,'Ala S 19, Itapuã - City s'),
			 ('Rodrigo','S','Santoro', 654789123,'Palacio Z 7, CAB - Brasilia');


-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, rating, size) values
							  ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elza',true,'Brinquedos','3',null),
                              ('Bola de Futebol infantil',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestuario','5',null),
                              ('Fantasia da Wandiinha',true,'Vestuario','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2',null),
                               ('Feijão Japonês',False,'Alimentos','3',null),
                                ('Poltrona da Vovó',False,'Móveis','3','2x30x60'),
                              ('coleira PP',False,'Pet','3',null),
                              ('Colageno',False,'Medicamentos','3',null),
								('Omega 3',False,'Medicamentos','3',null),
							  ('base neutra facial',False,'Cosmeticos','3',null),
                               ('Relogio Garmin',False,'Eletrônico','3',null);

select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

-- delete from orders where idOrderClient in  (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (1, default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,1,2,null),
                         (2,1,1,null),
                         (3,2,1,null);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsPsupplier, idPsProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idProduct, prodQuantity) values 
						 (1,6,80),
                         (2,7,10);

select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (2, default,'compra via aplicativo',null,1);
                             
select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;

select count(*)  from clients c, orders o
				where c.idClient = idOrderClient
                group by idOrder;

select * from orders;

-- recuperação de pedido com produto associado
select * from clients c 
				inner join orders o ON c.idclient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder;
	
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 