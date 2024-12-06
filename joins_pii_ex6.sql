CREATE  DATABASE joins_pii_ex6;

use joins_pii_ex6;

CREATE TABLE modelo(
	codMod INT,
	Nome VARCHAR(10),
    Marca VARCHAR(10),
    PRIMARY KEY(codMod) 
);

CREATE TABLE veiculo(
	Matricula VARCHAR(8),
    cor VARCHAR(15),
    codMod int,
    NIF int,
    PRIMARY KEY(Matricula),
    FOREIGN KEY(codMod) REFERENCES modelo(codMod),
    FOREIGN KEY(NIF) REFERENCES cliente(NIF)
);

CREATE TABLE cliente(
	NIF INT,
    Nome VARCHAR(30),
    dtNasc DATE,
    PRIMARY KEY(NIF)
);

CREATE TABLE estacionamento(
	Num INT,
    Piso INT,
    Capacidade INT,
    PRIMARY KEY(Num)
);

CREATE TABLE estaciona(
	cod INT,
    dataEntrada DATE,
    dataSaida DATE,
    horaEntrada TIME,
    horaSaida TIME,
    Matricula VARCHAR(9),
    Num INT,
    PRIMARY KEY(cod),
    FOREIGN KEY(Matricula) REFERENCES veiculo(Matricula),
    FOREIGN KEY(Num) REFERENCES estacionamento(Num)
);

INSERT INTO modelo VALUES
(1,"Serie A","BMW"),
(2,"Corolla","Toyota"),
(3,"208","Peugeot");


INSERT INTO cliente VALUES
(123456789,"Paulo Brificado","2000-10-28"),
(987654321,"Jalam Bipau","2000-05-15"),
(265128257,"Jacinto Pinto","2000-12-02");

INSERT INTO veiculo VALUES
("BRA-4567", "amarelo",1,123456789),
("XYZ-8293", "cinzento",2,987654321),
("QKL-3048", "cinzento",3,265128257);

INSERT INTO estacionamento VALUES
(20,1,30),
(21,1,30),
(40,2,25);

INSERT INTO estaciona VALUES
(1,"2024-11-05","2024-11-26","03:09:04","15:30:17","BRA-4567",20),
(2,"2024-11-19","2024-11-22","18:00:00","15:23:09","XYZ-8293",21),
(3,"2024-09-27","2024-10-20","05:00:56","14:50:36","QKL-3048",40);

#EX A
SELECT Matricula, Nome
FROM veiculo
inner join cliente
on veiculo.NIF = cliente.NIF ;

alter table estacionamento
add column matricula varchar(8);

alter table estacionamento
ADD constraint Matricula
foreign key(Matricula) references veiculo(matricula);

update estacionamento 
set matricula = "BRA-4567";

#EX B
select cliente.NIF,cliente.NOME
from cliente
left outer join veiculo
on veiculo.NIF = cliente.NIF
where Matricula = "BRA-4567";
#EX C
select veiculo.matricula,veiculo.cor
from veiculo
left outer join estacionamento
on veiculo.matricula = estacionamento.Matricula
where Num = 20;

select matricula,ano
where cod=1;