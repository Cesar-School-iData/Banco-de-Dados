
##-------------------------FEED(Com ou sem filtros)--------------

#Feed ordenado pela linha do tempo 
#Apresenta apenas problemas não resolvidos
select p.id, p.categoria, p.especificacao, p.status,
u.nome_predio,
a.andar, a.espaco, a.numero,
max(data_hora) as Ultimo_relato, count(data_hora) as Quantidade_relatos	
	from reporta r inner join
		(problema p
			inner join ambiente a
				on p.ambiente_id = a.id
			inner join unidade u
		on a.unidade_id  = u.id)
	on r.problema_id = p.id 
where p.status != 1
group by p.id 
order by max(data_hora) desc;

#Feed ordenado pela linha do tempo 
#Apresenta problemas resolvidos
select p.id, p.categoria, p.especificacao, p.status,
u.nome_predio,
a.andar, a.espaco, a.numero,
max(data_hora) as Ultimo_relato, count(data_hora) as Quantidade_relatos, p.data_hora_resolucao  
	from reporta r inner join
		(problema p
			inner join ambiente a
				on p.ambiente_id = a.id
			inner join unidade u
		on a.unidade_id  = u.id)
	on r.problema_id = p.id 
where p.status = 1
group by p.id 
order by max(data_hora) desc;

#Feed ordenado pela linha do tempo 
#Apresenta problemas resolvidos ou não
select p.id, p.categoria, p.especificacao, p.status,
u.nome_predio,
a.andar, a.espaco, a.numero,
max(data_hora) as Ultimo_relato, count(data_hora) as Quantidade_relatos  
	from reporta r inner join
		(problema p
			inner join ambiente a
				on p.ambiente_id = a.id
			inner join unidade u
		on a.unidade_id  = u.id)
	on r.problema_id = p.id 
group by p.id 
order by max(data_hora) desc;

#Feed ordenado pela linha do tempo 
#Apresenta problemas selecionados através da filtragem do ambiente e predio
select p.id, p.categoria, p.especificacao, p.status,
u.nome_predio,
a.andar, a.espaco, a.numero,
max(data_hora) as "Ultimo relato", count(data_hora) as "Quantidade relatos"  
	from reporta r inner join
		(problema p
			inner join ambiente a
				on p.ambiente_id = a.id
			inner join unidade u
		on a.unidade_id  = u.id)
	on r.problema_id = p.id 
where u.nome_predio = 'Brum' and a.espaco = 'Sala' and a.numero = 10
group by p.id  
order by max(data_hora) desc;

#Feed ordenado pela linha do tempo 
#Apresenta problemas selecionados através da filtragem categoria e especificação
select p.id, p.categoria, p.especificacao, p.status,
u.nome_predio,
a.andar, a.espaco, a.numero,
max(data_hora) as "Ultimo relato", count(data_hora) as "Quantidade relatos"  
	from reporta r inner join
		(problema p
			inner join ambiente a
				on p.ambiente_id = a.id
			inner join unidade u
		on a.unidade_id  = u.id)
	on r.problema_id = p.id 
where p.categoria = 'Mobilia' and p.especificacao  = 'Mesa'
group by p.id  
order by max(data_hora) desc;


#Feed ordenado pela linha do tempo 
#Apresenta problemas selecionados através da filtragem do predio
select p.id, p.categoria, p.especificacao, p.status,
u.nome_predio,
a.andar, a.espaco, a.numero,
max(data_hora) as "Ultimo relato", count(data_hora) as "Quantidade relatos"  
	from reporta r inner join
		(problema p
			inner join ambiente a
				on p.ambiente_id = a.id
			inner join unidade u
		on a.unidade_id  = u.id)
	on r.problema_id = p.id 
where u.nome_predio ='Bom Jesus'
group by p.id  
order by max(data_hora) desc;

#Acessando mais informações sobre um problema mostrando as observações

select r.observação, r.data_hora, r.problema_id 
from reporta r 
where r.problema_id = 15;

##---------------DASHBOARD---------------
#Quantidade de reports
select  count(*) as quantidade_relatos
from reporta r;

#Quantidade de reports 
#de problemas resolvidos
select  count(*) as quantidade_relatos
from reporta r inner join problema p 
on p.id = r.problema_id 
where p.status = 1;

#Quantidade de reports 
#com problemas não resolvidos
select  count(*) as quantidade_relatos
from reporta r inner join problema p 
on p.id = r.problema_id 
where p.status != 1;

#Quantidade de problemas
select  count(*) as quantidade_problema
from problema p;

#Quantidade de problemas resolvidos
select  count(*) as quantidade_problema_resolvidos
from problema p 
where p.status = 1;

#Quantidade de problemas não resolvidos
select  count(*) as quantidade_problema_nao_resolvidos
from problema p 
where p.status != 1;

#Quantidade de problemas por predio
select u.nome_predio, count(p.id) as quantidade_problema_predio
from unidade u left join ambiente a 
on a.unidade_id = u.id 
left  join problema p 
on p.ambiente_id = a.id 
group by u.id
order by quantidade_problema_predio desc;

#Quantidade de problemas resolvidos por prédio 
select u.nome_predio, count(p.id) as quantidade_problema_resolvido_predio
from unidade u left join ambiente a on a.unidade_id = u.id 
left join (select * from problema p where p.status = 1) p on a.id = p.ambiente_id
group by u.id
order by quantidade_problema_resolvido_predio desc;

#Quantidade de problemas não resolvidos por prédio 
select u.nome_predio, count(p.id) as quantidade_problema_nao_resolvido_predio
from unidade u left join ambiente a on a.unidade_id = u.id 
left join (select * from problema p where p.status != 1) p on a.id = p.ambiente_id
group by u.id
order by quantidade_problema_nao_resolvido_predio desc;

#Quantidade de problemas por categoria
SELECT p.categoria  , COUNT(p.categoria) as quantidade_problema_categoria
FROM  problema p 
GROUP BY p.categoria
order by quantidade_problema_categoria desc;

#Quantidade de problemas resolvidos por categoria
SELECT p.categoria  , COUNT(p2.categoria) as quantidade_problema_resolvido_categoria
FROM  problema p left join (select * from problema p2 where p2.status = 1) p2
on p.id = p2.id
GROUP BY p.categoria
order by quantidade_problema_resolvido_categoria desc;

#Quantidade de problemas não resolvidos por categoria
SELECT p.categoria  , COUNT(p2.categoria) as quantidade_problema_nao_resolvido_categoria
FROM  problema p left join (select * from problema p2 where p2.status != 1) p2
on p.id = p2.id
GROUP BY p.categoria
order by quantidade_problema_nao_resolvido_categoria desc;

#Quantidade da ocorrencia das categorias em cada predio
SELECT p.categoria, u.nome_predio, COUNT(p.categoria) as quantidade_problema_categoria
from unidade u inner join ambiente a 
on a.unidade_id = u.id 
inner  join problema p 
on p.ambiente_id = a.id 
GROUP BY u.id ,p.categoria
order by quantidade_problema_categoria desc;

#Quantidade da ocorrencia resolvidas das categorias em cada predio
SELECT p.categoria, u.nome_predio, COUNT(p2.categoria) as quantidade_problema_resolvido_categoria
from unidade u inner join ambiente a 
on a.unidade_id = u.id 
inner  join problema p 
on p.ambiente_id = a.id 
left join (select * from problema p2 where p2.status = 1) p2 on p2.id = p.id 
GROUP BY p.categoria, u.id
order by quantidade_problema_resolvido_categoria desc;

#Quantidade da ocorrencia não resolvidas das categorias em cada predio
SELECT p.categoria, u.nome_predio, COUNT(p2.categoria) as quantidade_problema_nao_resolvido_categoria
from unidade u inner join ambiente a 
on a.unidade_id = u.id 
inner  join problema p 
on p.ambiente_id = a.id 
left join (select * from problema p2 where p2.status != 1) p2 on p2.id = p.id 
GROUP BY p.categoria, u.id
order by quantidade_problema_nao_resolvido_categoria desc;

#Quntidade de Problemas por ambiente de cada prédio
select u.nome_predio,
a.espaco, a.numero, a.andar ,
count(p.id) as quantidade_problema_ambiente
	from problema p 
		right join ambiente a 
	on a.id = p.ambiente_id
	inner  join unidade u on u.id = a.unidade_id 
group by a.id
order by quantidade_problema_ambiente desc;

#Quntidade de Problemas resolvidos por ambiente de cada prédio
select u.nome_predio,
a.espaco, a.numero, a.andar ,
count(p2.id) as quantidade_problema_ambiente
	from problema p 
		right join ambiente a 
	on a.id = p.ambiente_id
	inner  join unidade u on u.id = a.unidade_id 
	left join (select * from problema p2 where p2.status = 1) p2 on p.id = p2.id
group by a.id
order by quantidade_problema_ambiente desc;

#Quntidade de Problemas não resolvidos por ambiente de cada prédio
select u.nome_predio,
a.espaco, a.numero, a.andar ,
count(p2.id) as quantidade_problema_ambiente
	from problema p 
		right join ambiente a 
	on a.id = p.ambiente_id
	inner  join unidade u on u.id = a.unidade_id 
	left join (select * from problema p2 where p2.status != 1) p2 on p.id = p2.id
group by a.id
order by quantidade_problema_ambiente desc;

#Dados de todos os poblemas contendo a hora do primeiro relado e a hora da resolução 
select  u.nome_predio,
p.categoria, p.especificacao, p.status, p.administrador_id,
a.andar, a.espaco, a.numero,
p.data_hora_resolucao, min(r.data_hora) as hora_relato, count(r.reportador_id) 
from unidade u inner join ambiente a on u.id = a.unidade_id
	inner join problema p on p.ambiente_id = a.id
	inner join reporta r on r.problema_id = p.id 
	inner join administrador a2 on a2.usuario_id = p.administrador_id 
group by p.id 
order by data_hora_resolucao desc, hora_relato;

#Dados dos poblemas resolvidos contendo a hora do primeiro relado e a hora da resolução 
select  u.nome_predio,
p.id,
p.categoria, p.especificacao, p.status,
a.andar, a.espaco, a.numero,
p.data_hora_resolucao, min(r.data_hora) as hora_relato, count(r.reportador_id) 
from unidade u inner join ambiente a on u.id = a.unidade_id  
inner join problema p on p.ambiente_id = a.id 
inner join reporta r on r.problema_id = p.id 
where p.data_hora_resolucao is not null 
group by p.id
order by data_hora_resolucao desc;

#Dados dos poblemas não resolvidos contendo
#hora do primeiro relado
select  u.nome_predio,
p.id,
p.categoria, p.especificacao, p.status,
a.andar, a.espaco, a.numero,
min(r.data_hora) as hora_relato, count(r.reportador_id) 
from unidade u inner join ambiente a on u.id = a.unidade_id  
inner join problema p on p.ambiente_id = a.id 
inner join reporta r on r.problema_id = p.id 
where p.data_hora_resolucao is null 
group by p.id
order by hora_relato;

#Dados dos problemas no brum
select  u.nome_predio,
p.categoria, p.especificacao, p.status, p.administrador_id,
a.andar, a.espaco, a.numero,
p.data_hora_resolucao, min(r.data_hora) as hora_relato, count(r.reportador_id) 
from unidade u inner join ambiente a on u.id = a.unidade_id
	inner join problema p on p.ambiente_id = a.id
	inner join reporta r on r.problema_id = p.id 
	inner join administrador a2 on a2.usuario_id = p.administrador_id 
where u.nome_predio = 'Brum'
group by p.id 
order by data_hora_resolucao desc, hora_relato;

#Dados dos problemas no Bom Jesus
select  u.nome_predio,
p.categoria, p.especificacao, p.status, p.administrador_id,
a.andar, a.espaco, a.numero,
p.data_hora_resolucao, min(r.data_hora) as hora_relato, count(r.reportador_id) 
from unidade u inner join ambiente a on u.id = a.unidade_id
	inner join problema p on p.ambiente_id = a.id
	inner join reporta r on r.problema_id = p.id 
	inner join administrador a2 on a2.usuario_id = p.administrador_id 
where u.nome_predio = 'Bom Jesus'
group by p.id 
order by data_hora_resolucao desc, hora_relato;

#Consultas gerais
SELECT * FROM problema p;

select * from ambiente a;

select * from administrador a;

select * from reporta r;

select * from reportador r;

select * from unidade u;

select * from usuario u;
