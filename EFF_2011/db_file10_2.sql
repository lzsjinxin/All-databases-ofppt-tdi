CREATE DATABASE eff2011v1
GO
use eff2011v1
GO

CREATE TABLE personnel(
    matricule int PRIMARY KEY,
    nom NVARCHAR(35),
    prenom NVARCHAR(35),
    telephone int ,
    passe NVARCHAR(35)
)
GO
CREATE TABLE ville (
    codeville int PRIMARY KEY,
    nom_ville NVARCHAR(35)
)
GO
CREATE TABLE marque(
    nommarque NVARCHAR(35) primary KEY
)
GO
CREATE TABLE autocar(
    codecar int primary KEY,
    capacite int ,
    date_achat date,
    consommation int ,
    nom_marque NVARCHAR(35) foreign key REFERENCES marque(nommarque)
)
go 
CREATE TABLE ligne (
    code_ligne int primary key,
    distance int ,
    code_ville_depart int foreign key REFERENCES ville(codeville),
    code_ville_arrivé int foreign key REFERENCES ville(codeville)
)
go 
CREATE TABLE calendrier(
    codecalendrier int primary key,
    jour_voyage int ,
    heure_depart time,
    heure_arrivé time,
    code_ligne int foreign key REFERENCES ligne(code_ligne)

)
GO
CREATE TABLE voyage(
    codevoyage int primary KEY IDENTITY(1,1),
    dh_depart_voyage datetime ,
    dh_arrivé_voyage datetime ,
    places int,
    compteur_depart int,
    compteur_arrivé int,
    matricule int,
    code_car int foreign key REFERENCES autocar(codecar),
    code_calendrier int foreign key REFERENCES calendrier(codecalendrier)
)



insert into personnel VALUES(1,'nom1','prenom1',644778899,'pass1')
insert into personnel VALUES(2,'nom2','prenom2',655889900,'pass2')
insert into personnel VALUES(3,'nom3','prenom3',666990011,'pass3')

go

insert into ville VALUES(1,'ville1')
insert into ville VALUES(2,'ville2')
insert into ville VALUES(3,'ville3')

go

insert into marque VALUES('marque1')
insert into marque VALUES('marque2')
insert into marque VALUES('marque3')

go

insert into autocar VALUES(1,4,getdate(),15,'marque1')
insert into autocar VALUES(2,6,getdate(),25,'marque2')
insert into autocar VALUES(3,8,getdate(),35,'marque3')

go

insert into ligne VALUES(1,32,1,2)
insert into ligne VALUES(2,64,2,3)
insert into ligne VALUES(3,128,3,1)

go

insert into calendrier VALUES(1,5,'13:05','00:05',1)
insert into calendrier VALUES(2,4,'21:25','10:40',2)
insert into calendrier VALUES(3,3,'7:05','20:13',3)

go

insert into voyage VALUES('20210704 13:05','20210705 00:05',4,5000,5001,1234,1,1)
insert into voyage VALUES('20210704 21:25','20210705 10:40',6,7000,7001,1324,2,2)
insert into voyage VALUES('20210704 7:05','20210705 20:13',8,9000,9001,1243,3,3)

select * from personnel
select * from ville
select * from marque
select * from autocar
select * from ligne
select * from calendrier
select * from voyage