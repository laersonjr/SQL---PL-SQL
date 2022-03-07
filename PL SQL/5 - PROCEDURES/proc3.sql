--PROCEDURE CALCULADORA
CREATE OR replace PROCEDURE proc_calc(operacao IN VARCHAR, --A ADICAO --D DIVISAO --S -SUBTR M --MULTIPL
                                      pnum1    IN NUMBER, 
                                      pnum2    IN NUMBER, 
                                      retorno OUT NUMBER) 

IS 
MSG_OUTRAS EXCEPTION;
BEGIN 

 IF operacao='A' THEN 
    retorno := pnum1 + pnum2; 
  ELSIF operacao='S' THEN 
    retorno := pnum1 - pnum2; 
  ELSIF operacao='M' THEN 
    retorno := pnum1*pnum2; 
  ELSIF operacao='D' THEN 
    retorno := pnum1/pnum2; 
    else
    raise MSG_OUTRAS;
END IF; 
  EXCEPTION 
  WHEN MSG_OUTRAS THEN 
    dbms_output.put_line('Erro nao catalogado'); 
 
  WHEN OTHERS THEN 
    dbms_output.put_line('erro: '||SQLERRM); 
  END;
  /
  SET serveroutput on
  --EXECUTANDO PROCEDURE
  DECLARE
  retorno number:=0;
  BEGIN
    proc_calc ('S',10,3,retorno);
    dbms_output.put_line(retorno);
  END;
  
   DECLARE
  retorno number:=0;
  BEGIN
    proc_calc ('A',10,3,retorno);
    dbms_output.put_line(retorno);
  END;
  
   DECLARE
  retorno number:=0;
  BEGIN
    proc_calc ('D',10,3,retorno);
    dbms_output.put_line(retorno);
  END;
  
   DECLARE
  retorno number:=0;
  BEGIN
    proc_calc ('M',10,3,retorno);
    dbms_output.put_line(retorno);
  END;
  
   DECLARE
  retorno number:=0;
  BEGIN
    proc_calc ('x',10,3,retorno);
    dbms_output.put_line(retorno);
  END;
  
  /
  
  
--OUTRO EXEMPLO 
SET serveroutput on
CREATE OR REPLACE
PROCEDURE proc_new_salary (percentual IN NUMBER,
                            id_func IN NUMBER,
                            nome_comp OUT VARCHAR,
                            sal_ant OUT NUMBER,
                            sal_novo OUT NUMBER)
IS
    
BEGIN
    select first_name || ' ' || last_name, salary ,(salary*(percentual/100)+salary) into nome_comp, sal_ant, sal_novo 
    from HR.employees where employee_id = id_func;
EXCEPTION
WHEN OTHERS THEN 
    dbms_output.put_line('erro: '||SQLERRM); 
END;




DECLARE
nome_comp varchar(50);
sal_ant number := 0;
sal_novo number :=0;
BEGIN
    proc_new_salary(20,100, nome_comp, sal_ant, sal_novo);
    dbms_output.put_line('Nome: ' || nome_comp || ' Antigo salário: R$' || sal_ant || ' Novo salário: R$' || sal_novo);
END;
                    