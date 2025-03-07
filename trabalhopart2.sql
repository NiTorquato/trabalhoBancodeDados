"Esta é a segunda parte de meu trabalho, onde contem o meu SQL"

create table funcionarios(
id SERIAL PRIMARY KEY,
nome varchar(100) not null,
salario DECIMAL(10,2),
aniversario DATE,
endereco TEXT,
sexo varchar(2), CHECK(sexo IN ('F', 'M', 'NB', 'NI')),
tipo_Funcionario VARCHAR(50)
)

CREATE TABLE Dependente (
    F_ID INT REFERENCES Funcionarios(ID) ON DELETE CASCADE,
	Nome varchar(100) not null,
    Plataforma_Disp VARCHAR(50),
    Idade INT,
    sexo varchar(2),
 CHECK(sexo IN ('F', 'M', 'NB', 'NI')),
    Aniversario DATE,
    Parentesco VARCHAR(50)
)

CREATE TABLE Setores (
    Numero SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Tema TEXT
)

CREATE TABLE Projeto (
    Numero_de_Identificacao SERIAL PRIMARY KEY,
    Objetivo TEXT,
    Nome VARCHAR(100),
    S_Numero INT REFERENCES Setores(Numero) ON DELETE SET NULL
)

CREATE TABLE Jogos (
    J_Nome VARCHAR(100) PRIMARY KEY,
    Diretor VARCHAR(100),
    Requisitos TEXT,
    Periodo_de_Desenvolvimento TEXT
)

CREATE TABLE Programa (
    J_Nome VARCHAR(100) REFERENCES Jogos(J_Nome) ON DELETE CASCADE,
    F_ID INT REFERENCES Funcionarios(ID) ON DELETE CASCADE,
    Horas_Trabalhadas INT,
    Progresso VARCHAR(50),
    PRIMARY KEY (J_Nome, F_ID)
)

CREATE TABLE Programador (
    F_ID INT PRIMARY KEY REFERENCES Funcionarios(ID) ON DELETE CASCADE,
    Area_de_Atuacao VARCHAR(100)
)

CREATE TABLE Animador (
    F_ID INT PRIMARY KEY REFERENCES Funcionarios(ID) ON DELETE CASCADE,
    Estilo_de_Arte VARCHAR(100),
    Modelo_Artistico VARCHAR(100)
)

CREATE TABLE Roteirista (
    F_ID INT PRIMARY KEY REFERENCES Funcionarios(ID) ON DELETE CASCADE,
    Comunicacao TEXT,
    Nivel_de_Lingua_Estrangeira VARCHAR(50),
    Producao_Textual TEXT
)

CREATE TABLE Editor (
    F_ID INT PRIMARY KEY REFERENCES Funcionarios(ID) ON DELETE CASCADE,
    Producao_Audiovisual TEXT,
    Nivel_de_Lideranca VARCHAR(50),
    Supervisor_ID INT REFERENCES Funcionarios(ID) ON DELETE SET NULL
)

CREATE TABLE Associado (
    F_ID INT PRIMARY KEY REFERENCES Funcionarios(ID) ON DELETE CASCADE,
    S_Numero INT REFERENCES Setores(Numero) ON DELETE SET NULL
)

CREATE TABLE Sprites (
    F_ID INT REFERENCES Funcionarios(ID) ON DELETE CASCADE,
    S_Numero INT REFERENCES Setores(Numero) ON DELETE CASCADE,
    PRIMARY KEY (F_ID, S_Numero)
)

CREATE TABLE Idealizam (
    P_Numero_de_Identificacao INT REFERENCES Projeto(Numero_de_Identificacao) ON DELETE CASCADE,
    J_Nome VARCHAR(100) REFERENCES Jogos(J_Nome) ON DELETE CASCADE,
    PRIMARY KEY (P_Numero_de_Identificacao, J_Nome)
)

CREATE TABLE Utilizados (
    J_Nome VARCHAR(100) REFERENCES Jogos(J_Nome) ON DELETE CASCADE,
    Tempo_Necessario INT,
    PRIMARY KEY (J_Nome, Tempo_Necessario)
)

INSERT INTO Funcionarios (nome, salario, aniversario, endereco, sexo, tipo_Funcionario) VALUES
('João Silva', 3500.00, '2000-03-10', 'Ocean View, San Fierro', 'M', 'Programador'),
('Geovanna Antunes', 4200.00, '1007-05-26', 'Bayside, Los Santos', 'F', 'Programador'),
('Ricardo Almeida', 3800.00, '1998-11-05', 'Red County, San Fierro', 'M', 'Programador'),
('Fernanda Nunes', 4000.00, '2000-02-19', 'Rodeo, Los Santos', 'F', 'Programador'),
('Eduardo Oliveira', 4500.00, '1997-08-14', 'Willard, Las Venturas', 'M', 'Programador'),
('Lucas Pereira', 3500.00, '1999-03-12', 'Ganton, Los Santos', 'M', 'Animador'),
('Amanda Souza', 4200.00, '2001-06-25', 'Vinewood, Los Santos', 'F', 'Animador'),
('Bruno Martins', 3800.00, '1997-09-30', 'Mulholland, San Fierro', 'M', 'Animador'),
('Camila Rocha', 4000.00, '2003-01-17', 'Ocean Docks, Los Santos', 'F', 'Animador'),
('Rafael Teixeira', 4500.00, '1995-10-09', 'El Corona, Los Santos', 'M', 'Animador'),
('Beatriz Mendes', 3500.00, '2002-05-10', 'Market, Los Santos', 'F', 'Roteirista'),
('Gabriel Lima', 4200.00, '1996-11-03', 'Hilltop, San Fierro', 'M', 'Roteirista'),
('Gabriella Antunes', 3800.00, '2006-02-14', 'Angel Pine, Blueberry', 'F', 'Roteirista'),
('Vinícius Cardoso', 4000.00, '1995-12-08', 'Tierra Robada, San Fierro', 'M', 'Roteirista'),
('Letícia Santos', 4500.00, '2000-06-21', 'Montgomery, Las Venturas', 'F', 'Roteirista'),
('André Gonçalves', 3500.00, '1998-03-07', 'Los Flores, San Fierro', 'M', 'Editor'),
('Juliana Ribeiro', 4200.00, '2001-04-15', 'Doherty, San Fierro', 'F', 'Editor'),
('Diego Farias', 3800.00, '1999-08-20', 'Fort Carson, San Fierro', 'M', 'Editor'),
('Renata Barros', 4000.00, '2005-02-27', 'Las Venturas Strip, Las Venturas', 'F', 'Editor'),
('Felipe Moura', 4500.00, '1997-09-18', 'Red Light District, Las Venturas', 'M', 'Editor')

UPDATE funcionarios 
SET aniversario = '2007-05-26' 
WHERE id = 2

INSERT INTO Dependente (F_ID, Nome, Plataforma_Disp, Idade, sexo, Aniversario, Parentesco) VALUES
(1, 'Lucas Silva', 'PC', 12, 'M', '2012-06-15', 'Filho'),
(1, 'Mariana Silva', 'PlayStation', 8, 'F', '2016-09-22', 'Filha'),
(3, 'Ana Almeida', 'Xbox', 15, 'F', '2009-02-11', 'Filha'),
(5, 'Rafael Oliveira', 'PC', 10, 'M', '2014-07-08', 'Filho'),
(5, 'Fernanda Oliveira', 'Switch', 6, 'F', '2018-12-03', 'Filha'),
(5, 'Caio Oliveira', 'Tablet', 3, 'M', '2021-05-19', 'Filho'),
(7, 'Beatriz Souza', 'PC', 14, 'F', '2010-11-28', 'Filha'),
(10, 'Henrique Teixeira', 'Mobile', 9, 'M', '2015-04-17', 'Filho'),
(10, 'Luana Teixeira', 'PlayStation', 5, 'F', '2019-08-12', 'Filha')

INSERT INTO Setores (Nome, Tema) VALUES
('Desenvolvimento', 'Programação dos jogos.'),
('Arte', 'Criação de visuais e animações.'),
('Roteiro', 'Criação da história e diálogos.'),
('Edição', 'Edição de áudio e vídeo.'),
('Pesquisa', 'Estudo de novas tecnologias para o mercado.')

INSERT INTO Projeto (Objetivo, Nome, S_Numero) VALUES
('Criar um novo jogo.', 'Projeto Alpha', 1),
('Melhorar as animações.', 'Projeto Gamma', 2),
('Escrever uma nova história.', 'Projeto Beta', 3),
('Editar um novo trailer.', 'Projeto Delta', 4),
('Pesquisar novas ideias.', 'Projeto Epsilon', 5)

INSERT INTO Jogos (J_Nome, Diretor, Requisitos, Periodo_de_Desenvolvimento) VALUES
('Aventura Mágica', 'João Silva', 'Windows 10, 8GB RAM, GTX 1050', '12 meses'),
('Corrida Extrema', 'Fernanda Nunes', 'PS5, 16GB RAM, SSD', '18 meses'),
('Mundo Perdido', 'Ricardo Almeida', 'Xbox Series X, 12GB RAM, Ray Tracing', '24 meses'),
('Batalha Final', 'Juliana Ribeiro', 'PC, 16GB RAM, RTX 2060', '14 meses'),
('Missão Espacial', 'Diego Farias', 'Switch, 6GB RAM', '10 meses')

INSERT INTO Programa (J_Nome, F_ID, Horas_Trabalhadas, Progresso) VALUES
('Aventura Mágica', 1, 160, 'Em andamento'),
('Corrida Extrema', 4, 180, 'Finalizado'),
('Mundo Perdido', 3, 150, 'Em andamento'),
('Batalha Final', 17, 200, 'Em andamento'),
('Missão Espacial', 19, 140, 'Finalizado')

INSERT INTO Programador (F_ID, Area_de_Atuacao) VALUES
(1, 'Desenvolvimento de Jogos'),
(2, 'Desenvolvimento de Jogos'),
(3, 'Desenvolvimento de Jogos'),
(4, 'Desenvolvimento de Jogos'),
(5, 'Desenvolvimento de Jogos');

INSERT INTO Animador (F_ID, Estilo_de_Arte, Modelo_Artistico) VALUES
(6, 'Pixel Art', 'Estilo retrô'),
(7, '3D', 'Estilo cartoon'),
(8, '2D', 'Estilo realista'),
(9, '3D', 'Estilo anime'),
(10, '2D', 'Estilo minimalista')

INSERT INTO Roteirista (F_ID, Comunicacao, Nivel_de_Lingua_Estrangeira, Producao_Textual) VALUES
(11, 'Clara e objetiva', 'Intermediário', 'Roteiros para animações e filmes'),
(12, 'Criativa e envolvente', 'Avançado', 'Roteiros para séries e jogos'),
(13, 'Narrativa envolvente', 'Básico', 'Roteiros para filmes e vídeos curtos'),
(14, 'Explicativa e detalhada', 'Avançado', 'Roteiros para novelas e peças teatrais'),
(15, 'Dialogal e dramática', 'Intermediário', 'Roteiros para filmes e documentários')

INSERT INTO Editor (F_ID, Producao_Audiovisual, Nivel_de_Lideranca, Supervisor_ID) VALUES
(16, 'Edição de vídeos e filmes', 'Médio', NULL),
(17, 'Edição de séries e documentários', 'Alto', 1),
(18, 'Edição de vídeos publicitários', 'Médio', 4),
(19, 'Edição de trailers e vídeos de jogos', 'Baixo', NULL),
(20, 'Edição de filmes e programas de TV', 'Alto', 5)

INSERT INTO Associado (F_ID, S_Numero) VALUES
(1, 1),  
(2, 1),  
(3, 1),  
(4, 1),  
(5, 1),  
(6, 2),  
(7, 2),  
(8, 2),  
(9, 2),  
(10, 2), 
(11, 3), 
(12, 3), 
(13, 3), 
(14, 3), 
(15, 3), 
(16, 4), 
(17, 4), 
(18, 4), 
(19, 4), 
(20, 4)

INSERT INTO Sprites (F_ID, S_Numero) VALUES
(6, 2),  
(7, 2),  
(8, 2),  
(9, 2),  
(10, 2), 
(11, 3), 
(12, 3), 
(13, 3), 
(14, 3), 
(15, 3)

INSERT INTO Idealizam (P_Numero_de_Identificacao, J_Nome) VALUES
(1, 'Aventura Mágica'),
(2, 'Corrida Extrema'),
(3, 'Mundo Perdido'),
(4, 'Batalha Final'),
(5, 'Missão Espacial')

INSERT INTO Utilizados (J_Nome, Tempo_Necessario) VALUES
('Aventura Mágica', 300),
('Corrida Extrema', 200),
('Mundo Perdido', 250),
('Batalha Final', 350),
('Missão Espacial', 400)

SELECT * FROM funcionarios
WHERE tipo_Funcionario = 'Animador'

SELECT * FROM funcionarios
WHERE salario > 3500

SELECT COUNT(*) FROM funcionarios
WHERE salario > 3500

SELECT f.nome, COUNT(*) 
FROM funcionarios f
JOIN dependente d ON f.id = d.F_ID
GROUP BY f.id
ORDER BY COUNT(*) DESC

SELECT f.nome, COUNT(p.J_Nome) AS projetos_trabalhados
FROM funcionarios f
LEFT JOIN programa p ON f.id = p.F_ID
GROUP BY f.id
ORDER BY projetos_trabalhados DESC

SELECT * FROM funcionarios

SELECT * FROM dependente

select * from setores

DELETE FROM Funcionarios 
WHERE id = 1 
