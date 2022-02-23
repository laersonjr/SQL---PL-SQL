SET SERVEROUTPUT ON
DECLARE
-- Declaração de variáveis
viDFunc HR.EMPLOYEES.EMPLOYEE_ID%type;
vNome HR.EMPLOYEES.FIRST_NAME%type;
VSalario HR.EMPLOYEES.SALARY%type;
-- Declaração de cursores
CURSOR cs_salario_top_10 is
    SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc;
BEGIN
-- Abre cursor
OPEN cs_salario_top_10;
-- Executa um loop com 10 ciclos
FOR i IN 1..10 LOOP
-- Extrai dados o registro corrente do cursor e avança para o próximo
FETCH cs_salario_top_10 INTO viDFunc,vNome,VSalario;
-- Imprime dados extraídos na tela
dbms_output.put_line(viDFunc||' - '||vNome||' - '||VSalario);
END LOOP;
--fecha cursor
close cs_salario_top_10;
END;
/

-- Exemplo
SELECT * FROM SENSO;

DECLARE
varAno senso.ano%TYPE;
varEstado senso.estado%type;
varNomeMun senso.nome_mun%TYPE;
varPopulacao senso.populacao%TYPE;
CURSOR cs_top_20_pop is
    select ano, estado, nome_mun, populacao 
    from senso 
    where ano = 2014
    order by populacao desc;
BEGIN
open cs_top_20_pop;
for i in 1..20 loop
fetch cs_top_20_pop into varAno, varEstado, varNomeMun, varPopulacao;
DBMS_OUTPUT.PUT_LINE(varAno || ' - ' || varEstado || ' - ' || varNomeMun || ' - ' || varPopulacao);
end loop;
close cs_top_20_pop;
END;
