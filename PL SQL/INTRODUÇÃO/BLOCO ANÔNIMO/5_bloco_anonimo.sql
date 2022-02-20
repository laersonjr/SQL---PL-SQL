-- Exemplo mostras quantidade de  funcionarios na tabela EMPLOYEES
set SERVEROUTPUT ON;
DECLARE
-- Declaração de variáveis
vCount INTEGER;
BEGIN
-- Recuperar quantidade de Funcionarios cadastrados
SELECT count(*)
INTO vCount
FROM HR.EMPLOYEES;
-- Imprimir, na tela, a quantidade de Funcionarios cadastrados
dbms_output.put_line('Existem '||to_char(vCount)||' Funcionarios cadastrados.');
EXCEPTION
/* Se ocorrer qualquer erro, informar o usuário que não foi possível
verificar a quantidade de produtos cadastrados */
WHEN OTHERS THEN
dbms_output.put_line('Não foi possível verificar a quantidade de'||
'Funcionarios cadastrados.');
END;
/

-- Exemplo print de data

DECLARE
    V_HOJE date default sysdate;
BEGIN
    -- IMPRIME A DATA
    DBMS_OUTPUT.PUT_LINE('HOJE É '||V_HOJE);
END;

--CONTANDO DIAS DE VIDA
DECLARE
  V_DATA_NASC DATE :='05/11/77';
  V_HOJE DATE default sysdate;
  V_DIAS INT;
  BEGIN
    V_DIAS:=V_HOJE-V_DATA_NASC;
    DBMS_OUTPUT.PUT_LINE('ESTOU VIVO A  '||V_DIAS||' DIAS');
  END;

-- Consultar quantidade de estado e cidade
DECLARE
vQtdCidade INT;
vQtdEstado INT;

BEGIN
    select count(distinct(a.estado)), count(distinct(a.nome_mun))
    into vQtdEstado, vQtdCidade 
    from senso a;
    
    DBMS_OUTPUT.PUT_LINE('Quantidade de cidades : ' || vQtdCidade);
    DBMS_OUTPUT.PUT_LINE('Quantidade de estados : ' || vQtdEstado);
END;

-- Bloco anônimo que calcula idade.
DECLARE

vDataNascimento date;
vDataAtual date default sysdate;
vIdade int;

-- Formado de data deve ser inserido ddmmyyyy
BEGIN
    vIdade := TRUNC(MONTHS_BETWEEN(sysdate,to_date(to_char(&vDataNascimento),'dd/mm/yyyy'))/12);
    DBMS_OUTPUT.put_line('Sua idade é : ' || vIdade);

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Valor incorreto para data');

END;

  

