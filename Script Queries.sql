USE [Filmes]
GO

--1 - Buscar o nome e ano dos filmes

select nome, 
ano 
from Filmes

--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

select nome,
ano, 
duracao 
from Filmes 
order by ano asc

--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o

select nome, 
ano, 
duracao 
from Filmes
where nome like '%De Volta para o Futuro%'

--4 - Buscar os filmes lan�ados em 1997

select nome,
ano, 
duracao 
from Filmes 
where ano = 1997

--5 - Buscar os filmes lan�ados AP�S o ano 2000

select nome, 
ano, 
duracao 
from Filmes 
where ano > 2000

--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

select nome, 
ano, 
duracao 
from Filmes 
where (Duracao > 100 and Duracao < 150) 
order by Duracao asc

--7 - Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela quantidade em ordem decrescente

SELECT ano, 
COUNT(*) AS quantidade 
FROM Filmes 
GROUP BY ano 
ORDER BY quantidade DESC;

--8 - Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome

SELECT Atores.Id, 
Atores.PrimeiroNome, 
Atores.UltimoNome, 
Atores.Genero 
FROM Atores 
where Atores.Genero = 'M';

--9 - Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT Atores.Id, 
Atores.PrimeiroNome, 
Atores.UltimoNome, 
Atores.Genero 
FROM Atores 
where Atores.Genero = 'F' 
order by Atores.PrimeiroNome ASC;

--10 - Buscar o nome do filme e o g�nero

select filme.nome, 
generos.Genero 
from [dbo].[Filmes] filme 
inner join FilmesGenero filmeGerneros
on filme.Id = filmeGerneros.IdFilme
inner join Generos generos
on filmeGerneros.IdGenero = generos.Id

--11 - Buscar o nome do filme e o g�nero do tipo "Mist�rio"

select filme.nome, generos.Genero 
from [dbo].[Filmes] filme 
inner join FilmesGenero filmeGerneros
on filme.Id = filmeGerneros.IdFilme
inner join Generos generos
on filmeGerneros.IdGenero = generos.Id
where generos.Genero = 'Mist�rio'

--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

select filme.nome, 
atores.PrimeiroNome, 
atores.UltimoNome,
elencoFilme.Papel
from [dbo].[Filmes] filme 
inner join ElencoFilme elencoFilme
on filme.id = elencoFilme.IdFilme
inner join Atores atores
on atores.Id = elencoFilme.IdAtor
