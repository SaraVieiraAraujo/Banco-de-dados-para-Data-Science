
1. Apresente os livros e suas respectivas categorias em 1 relatório.


select l.id as Codigo_do_Livro , l.titulo as Titulo_do_LIvro , c.nome as Gênero  from livros l
join categorias c 
on l.categoriaid=c.id



2. Apresente em um relatório de emprestimo, o nome do livro, nome do
associado, tipo do associado, data do emprestimo e a data prevista da
devolução

select l.titulo as Titulo_do_Livro ,a.Nome as Associado ,ta.Nome as Tipo_Associado , 
e.DataEmprestimo ,e.DataDevolucao    from emprestimos  e 
join livros l 
on e.LivroID=l.ID 
join Associados  a 
on a.ID =e.AssociadoID 
join TiposAssociado ta 
on ta.ID = a.TipoID


3. Liste todos os emprestimos devolvidos , apresentando o nome do associado,
livro, autor e categoria do livro

select a.Nome as Associado ,l.titulo as Livro ,au.Nome, c.Nome as Categoria ,  e.DataDevolucao  , e.Devolvido
from emprestimos  e 
join livros l 
on e.LivroID=l.ID 
join Associados  a 
on a.ID =e.AssociadoID 
join Autores  au 
on au.id = l.AutorID
join Categorias c 
on c.ID=l.CategoriaID
Where Devolvido =1

4. Liste todos os emprestimos que estão em atraso de acordo com a data de hoje

select a.Nome as Associado ,l.titulo as Livro ,au.Nome, c.Nome as Categoria ,  e.DataDevolucao  , e.Devolvido , 
DATEDIFF (DAY,DataDevolucao , getdate())  as Dias_em_atraso
from emprestimos  e 
join livros l 
on e.LivroID=l.ID 
join Associados  a 
on a.ID =e.AssociadoID 
join Autores  au 
on au.id = l.AutorID
join Categorias c 
on c.ID=l.CategoriaID
where devolvido =0 and DATEDIFF (DAY,DataDevolucao , getdate()) > 0

/** update Emprestimos set 
DataDevolucao = DATEADD(day,20,dataDevolucao) ***/ 


5. Apresente a quantidade de emprestimo que cada associado fez

select * from Emprestimos  
select a.Nome as Associado , count(e.ID) as Emprestimo 
from emprestimos  e 
join Associados  a 
on e.AssociadoID=a.ID
group by  a.nome


select * from Associados 

6. Apresente a quantidade de livros por categoria

select c.nome    ,COUNT  (l.id ) as QtdLivros from livros l 
join categorias c 
on l.CategoriaID = c.ID 
group by l.CategoriaID , c.nome


7. Apresente todos os emprestimos cuja a data da devolução é maior que a data
atual ordenada pela data da devolução

select * from Emprestimos 
order by DataDevolucao desc 