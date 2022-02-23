SET SERVEROUTPUT ON
DECLARE
-- Declaração de variáveis
viDFunc HR.EMPLOYEES.EMPLOYEE_ID%type;
vNome HR.EMPLOYEES.FIRST_NAME%type;
VSalario HR.EMPLOYEES.SALARY%type;
v_posicao int default 0;
-- Declaração de cursores
CURSOR cs_salario is
 SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc;
BEGIN
-- Abre cursor se ainda não estiver aberto
IF NOT cs_salario%ISOPEN THEN
OPEN cs_salario;
END IF;
-- Executa um loop 
LOOP
-- Extrai dados o registro corrente do cursor e avança para o próximo
FETCH cs_salario INTO  viDFunc,vNome,VSalario;

-- Sai do Loop quando não houver mais registros para processar
EXIT WHEN cs_salario%NOTFOUND;
-- Imprime dados extraídos na tela
v_posicao:=v_posicao+1;
dbms_output.put_line(v_posicao||' - '||viDFunc||' - '||vNome||' - '||VSalario);
END LOOP;
-- Fechar cursor
CLOSE cs_salario;
END;

-- Exemplo
DECLARE
varAno senso.ano%TYPE;
varEstado senso.estado%TYPE;
varPopulacao senso.populacao%TYPE;
varPosicao int default 1;

CURSOR cs_pop_estado is 
    SELECT ano, estado, SUM(populacao)
    FROM senso
    WHERE ano = 2014
    GROUP BY ano, estado
    ORDER BY 3 DESC;
    
BEGIN
IF NOT cs_pop_estado%ISOPEN THEN
OPEN cs_pop_estado;
END IF;

LOOP
FETCH cs_pop_estado into varAno, varEstado, varPopulacao;
EXIT WHEN cs_pop_estado%NOTFOUND;

DBMS_OUTPUT.PUT_LINE(varPosicao || ' - ' || varAno || ' - ' || varEstado || ' - ' || varPopulacao);
varPosicao := varPosicao +1;
END LOOP;

IF cs_pop_estado%ISOPEN then
CLOSE cs_pop_estado;
END IF;

END;