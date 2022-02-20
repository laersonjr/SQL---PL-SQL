-- Laço for para tabuada
set SERVEROUTPUT ON;
--CRIANDO SET SERVEROUTPUT ON
ACCEPT V_Digitado PROMPT 'Digite a tabuada:'
DECLARE
 
 V_TAB INT;
 
 BEGIN
    V_TAB:=&V_Digitado;
    FOR  SEQ IN 1..10 LOOP
         DBMS_OUTPUT.PUT_LINE (V_TAB||' X '||SEQ||' = '||SEQ*V_TAB);
     END LOOP;
 END;
 
 
--TABELA DE TESTE
CREATE TABLE TESTE_FOR
(
NUMERO1 INT,
NUMERO2 INT
);

--LOOP PARA INSERT

 BEGIN  
    FOR  VALOR IN 1..10 LOOP
         INSERT INTO TESTE_FOR (NUMERO1) VALUES (VALOR);
     END LOOP;
     COMMIT;
 END;
 
 --VERIFCANDO
 SELECT * FROM TESTE_FOR;

--EXEMPLO UPDATE

 BEGIN  
    FOR  VALOR IN 1..10 LOOP
         UPDATE TESTE_FOR SET NUMERO2=NUMERO1*VALOR
         WHERE numero1=VALOR;
     END LOOP;
     COMMIT;
 END;

--
 --VERIFCANDO
 SELECT * FROM TESTE_FOR;
 
 
 --LOOP REVERSE
 BEGIN
   
       FOR x IN 1..5 LOOP
          dbms_output.put_line('Contador crescente : '|| TO_CHAR(x) );
       END LOOP;
   
       dbms_output.put_line(' - ');
       
       FOR x IN REVERSE 1..5 LOOP
        dbms_output.put_line('Contador decrescente : '|| TO_CHAR(x) );
       END LOOP;
 
  END;
  
 
  
  create table senso_pb (
    id int,
    cod_uf varchar2(2),
    estado varchar2(50),
    nome_mun varchar2(100),
    populacao int);
    
    
    begin 
        insert into senso_pb(cod_uf, estado, nome_mun, populacao)
        select cod_uf, estado, nome_mun, populacao from senso where ano = 2014 and estado = 'Paraíba';
    end;

-- Necessário corrigir, código que faz update no ID de acordo com a posição row_number ordenando por populacao (Corrigido)
declare
    v_qtd_linhas int;
    v_linha_aux int;
    v_nome_mun senso_pb.nome_mun%TYPE;
begin
    select count(*) into v_qtd_linhas from senso_pb;
    for x in 1..v_qtd_linhas loop
        update senso_pb set id = x where nome_mun = (
            select nome_mun from (
                select nome_mun, row_number() over (order by populacao asc) as rownumber
                from senso_pb) where rownumber = x); 
        
    end loop;
end;

select * from senso_pb order by populacao asc;
 
SELECT * FROM (
SELECT
ROW_NUMBER() OVER (ORDER BY populacao ASC) AS rownumber, senso_pb.nome_mun
FROM senso_pb
)
WHERE rownumber = 1;
update senso_pb set id = 2 
where nome_mun = v_aux_cidade; 
 