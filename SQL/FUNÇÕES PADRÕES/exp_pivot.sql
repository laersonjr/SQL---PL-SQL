-- Valores da coluna são apresentados na linha do cabeçalho
select * from (
SELECT a.estado, a.ano, a.populacao
	FROM senso a)
    pivot (
    sum(populacao)
    for ano in ('2010', '2011', '2012', '2013' ,'2014'));
    
select estado, 
    sum(case when ano=2010 then ano end) as ANO_2010,
    sum(case when ano=2011 then ano end) as ANO_2011,
    sum(case when ano=2012 then ano end) as ANO_2012,
    sum(case when ano=2013 then ano end) as ANO_2013,
    sum(case when ano=2014 then ano end) as ANO_2014
from senso
group by estado;


-- Aqui temos o resultado da mesma consulta acima, porém através de linhas
select estado, sum(populacao) as soma_populacao, ano
from senso
group by ano, estado
order by estado, ano asc;

--

select estado, 
    sum(case when ano=2010 then ano end) as ANO_2010,
    sum(case when ano=2011 then ano end) as ANO_2011,
    sum(case when ano=2012 then ano end) as ANO_2012,
    sum(case when ano=2013 then ano end) as ANO_2013,
    sum(case when ano=2014 then ano end) as ANO_2014
from senso
group by estado;