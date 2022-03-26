create database Rpgonline

use Rpgonline

create table Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL,
)

create table Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)

create table Personagens(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(15) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
)

create table Habilidade(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL
)

create table ClasseHabilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadesId INT FOREIGN KEY REFERENCES Habilidade(HabilidadeId)
)

INSERT INTO Usuarios(Email,Senha) VALUES('test@gmail.com', '1234')

select * from Usuarios

INSERT INTO Classes VALUES('Bárbaro', 'Descrição do Bárbaro')
INSERT INTO Habilidade VALUES('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens VALUES('DeuBug', 1, 1)
INSERT INTO ClasseHabilidade VALUES(1, 1), (1, 2)

INSERT INTO Usuarios(Email,Senha) VALUES('email2@gmail.com', '123456')
INSERT INTO Classes VALUES('Monge', 'Descrição do Monge')
INSERT INTO Habilidade VALUES('Recupera Vida')
INSERT INTO Personagens VALUES('BitBug', 2, 2)
INSERT INTO ClasseHabilidade VALUES(2, 2), (2, 3)

update Usuarios
set senha = '12456'
where UsuarioId = 1

delete from Usuarios where UsuarioId = 1

select * from Classes
select * from Habilidade
select * from Personagens
select * from ClasseHabilidade

select a.NomePersonagem, b.Nome Classe, b.Descricao from Personagens a
join Classes b ON b.ClasseId = a.ClasseId


select * from ClasseHabilidade a
join Classes b ON b.ClasseId = a.ClasseId
join Habilidade c ON c.HabilidadeId = a.HabilidadesId

CREATE LOGIN jogador
WITH PASSWORD = 'test1234'
CREATE USER aluno FOR LOGIN jogador
GRANT SELECT TO aluno