create database Hotelaria;
use Hotelaria;

create table Cliente( 
cod int not null auto_increment,
nome varchar(80) not null,
cpf int not null,
primary key(cod),
Tipo_convenio varchar(40)
 );
 
insert into Cliente values(null, "José", 567856346, "vip");
insert into Cliente values(null, "Jonatan", 376383467, "vip");
insert into Cliente values(null, "Jailson", 467786468, "vip");

 create table Reserva(
 cod int not null auto_increment,
 primary key(cod),
 DataInicio date not null,
 DataFim date not null,
 quarto int not null,
 Valor double(9,2) not null,
 Clientecod int not null,
 foreign key(Clientecod) references Cliente(cod)
 );
 
insert into reserva values (null, 20210806, 20220806, 20, 200.00, 2);
insert into reserva values (null, 20210807, 20220807, 30, 300.00, 3);
insert into reserva values (null, 20210808, 20220808, 40, 400.00, 4);

 
 create table Hospede(
cod int not null auto_increment,
primary key(cod),
nome varchar(80) not null,
Reservacod int not  null,
Telefone char(15) not null,
Email varchar(60) not null
 );
 
insert into Hospede values(null,"José", "2", 68790594, "pedro@gmail.com");
insert into Hospede values(null, "Jonatan", "3", 34698552, "jonatan@gmail.com");
insert into Hospede values(null, "amilton", "4", 16735873, "amilton@gmail.com");

 create table Quarto(
 cod int not null auto_increment,
 primary key(cod),
 numero int not null,
 andar int not null,
 classificacao varchar(40) not null,
 Hospedecod int not null,
 foreign key(Hospedecod) references Hospede(cod)
 );
 
insert into Quarto values(null, "2", "3", "5 estrelas", 1);
insert into Quarto values(null, "3", "4", "4 estrelas", 2);

 create table Servicos(
  cod int not null auto_increment,
  primary key(cod),
  itens varchar(50) not null,
  tipo varchar(50) not null,
  Observacao varchar(100),
  Quartocod int not null,
  Servico_copacod int not null,
  foreign key(Quartocod) references Quarto(cod),
  foreign key(Servico_copacod) references Servico_copa(cod)
 );
 
insert into Servicos values(null, "colher", "cozinhar", "ok", 2, 2);
insert into Servicos values(null, "vassoura", "varrer", "ok", 3, 3);
insert into Servicos values(null, "pano", "limpar", "ok", 4, 4);
insert into Servicos values(null, "espanador", "tirar poeira", "ok", 5, 5);
 
 create table Servico_copa(
   cod int not null auto_increment,
   primary key(cod),
   Registro varchar(100) not null,
   tipo_servico varchar(40) not null
 );
 
insert into Servico_copa values(null, "Preparou comida", "cozinhou");
insert into Servico_copa values(null, "Limpou a cozinha", "Limpou");
 Delete from Reservas where valor > 100;
 
-- 10) Apagar todos hospedes 
 Delete from Hospede where cod > 0;
 
-- 11) Atualizar o valor das reservas para 100,00 onde a data for igual a data de hoje.--
update Reservas set Valor = 100 where DataInicio = 20210806;

-- 12) Selecionar todas reservas feitas entre maio e junho de 2018
select * from Reserva where DataInicio between 20180501 and 20180601;

-- 13) Quantos clientes existem?
select count(cod) from Cliente;

-- 14) Quantos quartos existem no andar de número 2.
select count(cod) from Quarto where andar = 2;

-- 15) Qual a média de valor das reservas.
select avg(Valor) from Reserva;

-- 16) Selecionar o nome e CPF dos clientes.
select Nome, Cpf from Cliente;

-- 17) Selecionar todos serviços do tipo “almoço”
select * from Servicos where tipo = "Almoço";

-- 18) Qual o somatório de valor de reservas realizadas.
select sum(valor) from Reserva;

-- 19) Selecionar o nome, telefone e email dos hospedes ordenados pelo nome
select nome,telefone,email from Hospede order by Nome;

-- 20) Apagar todas os serviços_copa com código menor que 10
delete from Servico_copa where cod < 10;

-- 21) Selecionar nome e telefone dos hospede de código entre 15 e 20
select nome,telefone from Hospede where cod between 15 and 20;

-- 22) Selecionar registro e tipo_serviço do serviço copa ordenados por cod.
select Registro,Tipo_Servico from Servico_Copa order by cod;

-- 23) Quantos serviços foram realizados do tipo “limpeza”
select count(cod) from Servicos where tipo = "Limpeza";

-- 25) Selecionar o itens e tipo dos serviço realizados para o quarto de código 2.
select intens,tipo from Servicos where Quartocod = 2;

-- 26) Qual a média de reserva realizadas para o quarto de numero 4.
select avg(Valor) from Reserva where quarto = 4;

-- 27) Atualizar a data para 20130401 das reservas realizadas para o quarto 8.
update Reserva set DataFim = 20130401 where quarto = 8;

-- 28) Deletar todas reservas com valor inferior a 35.00
delete from Reserva where valor < 35;

-- 29) Deletar todos serviços realizados com código diferente de 150.
 delete from Servicos where cod != 150;
 
 
 
 