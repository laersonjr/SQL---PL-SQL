CREATE OR REPLACE
PROCEDURE PROC_DET_FUNC
IS
  CURSOR emp_cur
  IS
    SELECT first_name, last_name, salary FROM HR.EMPLOYEES;
    --RECEBENDO VALORES DO CURSOR
    emp_rec emp_cur%rowtype;
BEGIN
  FOR emp_rec IN emp_cur
  LOOP
    dbms_output.put_line('Nome do funcionario: ' || emp_rec.first_name);
    dbms_output.put_line('Sobrenome do funcionario: ' ||emp_rec.last_name);
    dbms_output.put_line('Salário do funcionario: ' ||emp_rec.salary);
    dbms_output.put_line('---------------------------------------------');
  END LOOP;
END;

--executando procedure
SET serveroutput on
begin
 PROC_DET_FUNC;
end;

--outra forma de execucao
EXECUTE PROC_DET_FUNC;

-- EXERCICIO
SELECT * FROM senso where estado = 'Distrito Federal';

CREATE OR REPLACE
PROCEDURE proc_info_estados
IS
    CURSOR cr_info_estados
    IS
        select estado, count(estado)as qtd_cidade, sum(populacao) as pop_estado, sum(pib) as pib_estado 
        from senso
        where ano='2014'
        group by estado;
        var_info_estado cr_info_estados%rowtype;
BEGIN
    FOR var_info_estado IN cr_info_estados
    LOOP
        dbms_output.put_line('Nome do estado: ' || var_info_estado.estado);
        dbms_output.put_line('Quantidade de cidades: ' || var_info_estado.qtd_cidade);
        dbms_output.put_line('População do estado: ' || var_info_estado.pop_estado);
        dbms_output.put_line('Pib do estado: ' || var_info_estado.pib_estado);
        dbms_output.put_line('---------------------------------------------');
    END LOOP;
END;

execute proc_info_estados;

begin
proc_info_estados;
end;