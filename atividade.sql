CREATE DATABASE IF NOT EXISTS SiteFilmes;
USE SiteFilmes;

CREATE TABLE IF NOT EXISTS TipoAtuacao (
	IdTipoAtuacao INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeTipoAtuacao  VARCHAR(50));

CREATE TABLE IF NOT EXISTS Genero (
	IdGenero	  INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeGenerego  VARCHAR(50));
    
CREATE TABLE IF NOT EXISTS Filme (
	IdFilme	   INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeFilme  VARCHAR(200),
	sinopse    VARCHAR(8000),
    duracao    INT,
    anoEstreia DATE);
    
CREATE TABLE IF NOT EXISTS Pais (
	IdPais 	  INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomePais  VARCHAR(50));
    
CREATE TABLE IF NOT EXISTS PaisFilme (
	IdFilme	  INT UNSIGNED NOT NULL,
    IdPais    INT UNSIGNED NOT NULL);
    
ALTER TABLE PaisFilme ADD CONSTRAINT FK_PaisFilme_IdFilme
  FOREIGN KEY (IdFilme) REFERENCES Filme(IdFilme);

ALTER TABLE PaisFilme ADD CONSTRAINT FK_PaisFilme_IdPais
  FOREIGN KEY (IdPais) REFERENCES Pais(IdPais);
  
CREATE TABLE IF NOT EXISTS Pessoa (
	IdPessoa	INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IdPais      INT UNSIGNED NOT NULL,
    nomePessoa  VARCHAR(60));
    
ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_IdPais
  FOREIGN KEY (IdPais) REFERENCES Pais(IdPais); 
  
 CREATE TABLE IF NOT EXISTS Equipe (
	IdPessoa  	  INT UNSIGNED NOT NULL,
    IdFilme   	  INT UNSIGNED NOT NULL,
    IdTipoAtuacao INT UNSIGNED NOT NULL);

ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_Idpessoa
  FOREIGN KEY (IdPessoa) REFERENCES Pessoa(IdPessoa); 
  
ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_IdFilme
  FOREIGN KEY (IdFilme) REFERENCES Filme(IdFilme); 
     
ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_IdTipoAtuacao
  FOREIGN KEY (IdTipoAtuacao) REFERENCES TipoAtuacao(IdTipoAtuacao);
  
   CREATE TABLE IF NOT EXISTS GeneroFilme (
	IdFilme 	  INT UNSIGNED NOT NULL,
    IdGenero   	  INT UNSIGNED NOT NULL);

ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_IdFilme
  FOREIGN KEY (IdFilme) REFERENCES Filme(IdFilme);
  
ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_IdGenero
  FOREIGN KEY (IdGenero) REFERENCES Genero(IdGenero);

/*pais*/
insert into sitefilmes.pais(NomePais)
values('Estados unidos');
insert into sitefilmes.pais(NomePais)
values('França');
insert into sitefilmes.pais(NomePais)
values('Brasil');
insert into sitefilmes.pais(NomePais)
values('Inglaterra');
insert into sitefilmes.pais(NomePais)
values('Canada');

/*Genero*/

insert into sitefilmes.genero(NomeGenerego)
values ('Ação');
insert into sitefilmes.genero(NomeGenerego)
values ('Ficção cientifica');
insert into sitefilmes.genero(NomeGenerego)
values ('Drama');
insert into sitefilmes.genero(NomeGenerego)
values ('Aventura');
insert into sitefilmes.genero(NomeGenerego)
values ('Fantasia');

/*Ator*/
insert into sitefilmes.pessoa(IdPais,nomePessoa)
values (3, 'Thomas Cruise Mapother IV');

update sitefilmes.pessoa 
set IdPais = 1
where (IdPessoa = 1);

/*Filme*/
insert into sitefilmes.filme(NomeFilme,sinopse,duracao,anoEstreia)
values('Máquinas Mortais', 'A Terra está destruída e para sobreviver as cidades se movem em rodas gigantes, conhecidas como Cidades Tração, e lutam com outras para conseguir mais recursos naturais. Quando Londres se envolve em um ataque, Tom é lançado para fora da cidade junto com uma fora da lei, e os dois juntos precisam lutar para sobreviver e ainda enfrentar uma ameaça que coloca a vida no planeta em risco.', 128 , '2018/11/27');

insert into sitefilmes.filme(NomeFilme,sinopse,duracao,anoEstreia)
values('Maze Runner: A Cura Mortal','Thomas parte em uma missão para encontrar a cura de uma doença mortal e descobre que os planos da C.R.U.E.L podem trazer consequências catastróficas para a humanidade.',142, '2018/01/25');

insert into sitefilmes.filme(NomeFilme,sinopse,duracao,anoEstreia)
values('Missão: Impossível - Efeito Fallout', 'Em uma perigosa tarefa para recuperar plutônio roubado, Ethan Hunt opta por salvar sua equipe em vez de completar a missão. Com isso, armas nucleares caem nas mãos de agentes altamente qualificados e que pertencem a uma rede mortal que deseja destruir a civilização. Agora, com o mundo em risco, Ethan e sua equipe da IMF são forçados a aliar-se a um obstinado agente da CIA.', 148, '2018/07/26');

insert into sitefilmes.filme(NomeFilme,sinopse,duracao,anoEstreia)
values('Aquaman', 'Uma aventura cheia de ação que apresenta o vasto e extraordinário mundo subaquático dos sete mares, "Aquaman" conta a história da origem do meio-homem e meio-atlante Arthur Curry, e o leva na jornada da sua vida, que não apenas o forçará a encarar quem realmente é, mas também descobrir se é digno do que nasceu para ser ', 143, '2018/11/26');

insert into sitefilmes.filme(NomeFilme,sinopse,duracao,anoEstreia)
values('Avengers: Infinity War', 'Homem de Ferro, Thor, Hulk e os Vingadores se unem para combater seu inimigo mais poderoso, o maligno Thanos. Em uma missão para coletar todas as seis pedras infinitas, Thanos planeja usá-las para infligir sua vontade maléfica sobre a realidade', 149,'2018/04/23');

/*GENERO FILME*/

insert into sitefilmes.generofilme(IdFilme,IdGenero)
values(1, 5);
insert into sitefilmes.generofilme(IdFilme,IdGenero)
values(2, 1);
insert into sitefilmes.generofilme(IdFilme,IdGenero)
values(3, 1);
insert into sitefilmes.generofilme(IdFilme,IdGenero)
values(4, 2);
insert into sitefilmes.generofilme(IdFilme,IdGenero)
values(5, 3);

/*Paisfilme*/
insert into sitefilmes.paisfilme(IdFilme, IdPais)
values(1,4);
insert into sitefilmes.paisfilme(IdFilme, IdPais)
values(2,1);
insert into sitefilmes.paisfilme(IdFilme, IdPais)
values(3,2);
insert into sitefilmes.paisfilme(IdFilme, IdPais)
values(4,1);
insert into sitefilmes.paisfilme(IdFilme, IdPais)
values(5,5);/*Tem partes no brasil*/

delete from sitefilmes.paisfilme
where(IdFilme = 1);

delete from sitefilmes.generofilme
where(IdFilme = 1);

delete from sitefilmes.filme
where(IdFilme = 1);



