SET SERVEROUTPUT ON
<<BLOCOPRINCIPAL>> --declaracao de label de escopo
DECLARE
V_NUM1 NUMBER := 100;
BEGIN
DECLARE
V_NUM1 NUMBER := 50;
BEGIN
DBMS_OUTPUT.PUT_LINE('Impress�o 1 '||BLOCOPRINCIPAL.V_NUM1);
DBMS_OUTPUT.PUT_LINE('Impress�o 2 '||V_NUM1);
END;
DBMS_OUTPUT.PUT_LINE('Impress�o 3 '||V_NUM1);
END;
/

<<BLOCOTESTE>>
DECLARE
    V_NUMERO1 NUMBER:=100; --Atribuindo valor a variavel
BEGIN
    DBMS_OUTPUT.PUT_LINE('Impress�o 1 bloco 1: ' || V_NUMERO1); --Imprimindo 1 valor
    V_NUMERO1 := V_NUMERO1 + 100; --Atribuindo um novo valor a variavel
    DBMS_OUTPUT.PUT_LINE('Impress�o 2 bloco 1: ' || V_NUMERO1); --Imprimindo esse novo valor
    DECLARE --Declarando a variavel em outro bloco
    V_NUMERO1 NUMBER:= 300;
    BEGIN --Novo bloco an�nimo
    DBMS_OUTPUT.PUT_LINE('Impress�o 3 bloco 2: ' || BLOCOTESTE.V_NUMERO1); --Imprimindo com refer�ncia ao label
    DBMS_OUTPUT.PUT_LINE('Impress�o 3 bloco 2: ' || V_NUMERO1); --Imprimindo o valor atribuido dentro do bloco an�nimo
    END;
    DBMS_OUTPUT.PUT_LINE('Impress�o 3 bloco 2: ' || V_NUMERO1); --Imprimindo valor fora do 2 bloco criado
END;

--outro exemplo
DECLARE V_TEMP NUMBER:=100;
BEGIN
  DBMS_OUTPUT.PUT_LINE(V_TEMP);
  DECLARE V_TEMP NUMBER:=200;
  BEGIN
    DBMS_OUTPUT.PUT_LINE(V_TEMP);
  END;
  DBMS_OUTPUT.PUT_LINE(V_TEMP);
END;
/