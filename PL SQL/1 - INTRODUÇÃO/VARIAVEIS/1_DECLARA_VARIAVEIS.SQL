SET SERVEROUTPUT ON
DECLARE

v_tot_sal NUMBER(10,2);
v_depto NUMBER;
v_qtd int;

BEGIN
v_depto:=100;
SELECT SUM(A.salary),count(*) qtd
  INTO v_tot_sal,v_qtd
  FROM hr.employees A WHERE A.department_id=v_depto;
 
 dbms_output.put_line('Total de salario depto  '||v_depto||' é '||v_tot_sal);
 dbms_output.put_line('Total de de Colaboradores é  '||v_qtd);
 dbms_output.put_line('Media de Salario  '||round(v_tot_sal/v_qtd,2));

END;

DECLARE

v_ano VARCHAR2(10);
v_estado VARCHAR2(100);
v_pib NUMBER(10,2);
v_qtd_cidade INT;
v_populacao NUMBER(10,2);

BEGIN
v_ano := '2014';
v_estado := 'Paraíba';
select a.estado, count(a.estado), sum(a.pib), sum(a.populacao)
    into v_estado, v_qtd_cidade, v_pib, v_populacao
    from senso a where a.ano=v_ano and a.estado=v_estado
    group by a.estado;
    dbms_output.put_line('v_ano : ' || v_ano);
    DBMS_OUTPUT.PUT_LINE('v_estado : ' || v_estado);
    DBMS_OUTPUT.PUT_LINE('v_qtd_cidade : ' || v_qtd_cidade);
    DBMS_OUTPUT.PUT_LINE('v_pib : ' || v_pib);
    DBMS_OUTPUT.PUT_LINE('v_populacao : ' || v_populacao);
END;

select a.estado, count(a.estado), sum(a.pib), sum(a.populacao)
from senso a where a.ano='2014' and a.estado='Paraíba'
    group by a.estado;