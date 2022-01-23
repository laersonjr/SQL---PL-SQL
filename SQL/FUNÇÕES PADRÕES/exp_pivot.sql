-- Valores da coluna são apresentados na linha do cabeçalho
select * from (
SELECT a.estado, a.ano, a.populacao
	FROM senso a)
    pivot (
    sum(populacao)
    for ano in ('2010', '2011', '2012', '2013' ,'2014'));

-- Aqui temos o resultado da mesma consulta acima, porém através de linhas
select estado, sum(populacao) as soma_popuacao, ano
from senso
group by ano, estado
order by estado, ano asc;