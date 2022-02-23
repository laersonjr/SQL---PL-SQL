SET SERVEROUTPUT ON
--CURSOR IMPLICITO ORACLE
BEGIN
-- Inicia o loop no conjunto ativo do cursor
FOR vFunc in (SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.SALARY
FROM HR.EMPLOYEES a
order by a.salary desc)
LOOP
-- Imprime dados extraídos na tela
dbms_output.put_line(VFunc.EMPLOYEE_ID||' - '||VFunc.FIRST_NAME||' - '||VFunc.SALARY);
END LOOP;
END;
/

-- Exemplo
--CURSOR IMPLICITO ORACLE
BEGIN

FOR vEstado in (SELECT ano, estado, sum(populacao) as soma
    from senso
    where ano = 2014
    group by ano, estado
    order by 3 asc)
LOOP
    dbms_output.put_line(vEstado.ano || ' - ' || vEstado.estado || ' - ' || vEstado.soma);
END LOOP;
END;