--exemplo usando case
SET SERVEROUTPUT ON
ACCEPT v_nota_dig PROMPT 'Digite sua Nota:'

DECLARE
      v_nota integer;
    BEGIN
      v_nota := &v_nota_dig;
    
     CASE v_nota
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Nota Excelente');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('Nota muito boa');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('Boa nota');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Nota na média');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Nota abaixo da média');
        ELSE DBMS_OUTPUT.PUT_LINE('Sem classificação de notas');
      END CASE;
   END;
   /
   
 -- exemplo usando case com EXCEPTION  
SET SERVEROUTPUT ON
ACCEPT v_nota_dig PROMPT 'Digite sua Nota:'

DECLARE
      v_nota integer;
    BEGIN
      v_nota := &v_nota_dig;   
     CASE v_nota
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Nota Excelente');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('Nota muito boa');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('Boa nota');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Nota na média');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Nota abaixo da média');
      END CASE;
      EXCEPTION
        WHEN CASE_NOT_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('Sem classificação de notas');
   END;
   /

ACCEPT v_ano_dig PROMPT 'Digite o ano: ' 
ACCEPT v_cod_uf_dig PROMPT 'Digite o código do estado: ' 
DECLARE
    v_ano int;
    v_cod_uf int;
    v_soma_pib decimal(12,2);
BEGIN
    v_ano:=&v_ano_dig;
    v_cod_uf:=&v_cod_uf_dig; 
       
    select sum(pib) into v_soma_pib from senso where ano = v_ano and cod_uf = v_cod_uf;
    DBMS_OUTPUT.PUT_LINE(v_soma_pib);
    DBMS_OUTPUT.PUT_LINE(v_ano);
    DBMS_OUTPUT.PUT_LINE(v_cod_uf);
    CASE 
        WHEN v_soma_pib between 0 and 15000000 THEN DBMS_OUTPUT.PUT_LINE('PIB baixo');
        WHEN v_soma_pib between 15000001 and 30000000 THEN DBMS_OUTPUT.PUT_LINE('PIB médio');
        WHEN v_soma_pib between 30000001 and 45000000 THEN DBMS_OUTPUT.PUT_LINE('PIB alto');
        WHEN v_soma_pib > 45000000 THEN DBMS_OUTPUT.PUT_LINE('PIB muito alto');
    end case;
END;

SELECT ESTADO, cod_uf, SUM(PIB) FROM SENSO A where ano = 2014 GROUP BY ESTADO, cod_uf ORDER BY 3 ASC