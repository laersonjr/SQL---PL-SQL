-- ABS

select a.FIRST_NAME,
       a.SALARY,
       a.SALARY*-1 SALARIO_NEGATIVO,
       abs(a.SALARY*-1) SALARIO_ABS
from HR.EMPLOYEES a


--Rand

/*
RANDOM
U – Upper case
L – Lower case
A – Alfanumérico (Alphanumeric)
X – Alfanumérico com caracteres upper case (Alphanumeric with upper case alphabets)
P – Somente caracteres imprimíveis (printable characters only)
Outros caracteres: retorno será somente em upper case (Providing any other character will return the output in upper case only)
*/
select dbms_random.value from dual;

select trunc(dbms_random.value(1, 99), 0) x from dual;

select trunc(dbms_random.value(-10, 10), 0) x from dual;

select trunc(dbms_random.value(1, 99), 3) x from dual;

select dbms_random.string('U', 5) x from dual;
select dbms_random.string('U', 2) x from dual;
select dbms_random.string('L', 5) x from dual;
select dbms_random.string('A', 10) x from dual;
select dbms_random.string('X',10) x from dual;
select dbms_random.string('P',10) x from dual;

-- ROUND, ROUND(NUMERO,QTD_CASAS), se colocar -1, vai trazer o número fechado mais próximo
select ROUND(45.923,1) as R1_1Casa, 
       ROUND(45.923)as R2_0Casa, 
       ROUND(45.323,1) as R3_1Casa, 
       ROUND(45.323,-1) as R4_Num_Fechado_Próximo,
       ROUND(44.323,-1) R5_Num_Fechado_Próximo,
       ROUND(45.323,-2) as R4_Num_Fechado_Próximo,
       ROUND(54.323,-2) R5_Num_Fechado_Próximo FROM DUAL

-- ROUND      
SELECT A.FIRST_NAME,
       A.SALARY,
       A.SALARY/33 as SALARIO_DIV33,
       ROUND(A.SALARY/33,2) SALARIO_CASA_DEC
FROM HR.EMPLOYEES A;

-- TRUNC, OBS: arredonda para baixa o valor da casa decimal
select TRUNC(45.923,1)T1, 
       TRUNC(45.923)T2, 
       TRUNC(45.323,1)T3, 
       TRUNC(46.523,-1) T4,
       TRUNC(44.323,-1) T5 FROM DUAL
       
SELECT A.FIRST_NAME,A.SALARY,
       A.SALARY/33 NOVO,
       TRUNC(A.SALARY/33,2) NOVO
FROM HR.EMPLOYEES A

--SQRT, retorna raiz quadrada
SELECT SQRT(4) FROM DUAL;
SELECT SQRT(9) FROM DUAL;

SELECT A.SALARY,
      ROUND(SQRT(A.SALARY),2)
      FROM HR.EMPLOYEES A

--SIGN(valor), retorna 1, null ou -1, para valores positivos, nuloes ou negativos
SELECT SIGN(-20) TESTE_NEGATIVO,
       SIGN(null) TESTE_null,
       SIGN(30) TESTE_POSITVO,
       SIGN(0) TESTE_ZERO
FROM DUAL;

--POWER(valor, n), potência
select  power(3,2)P1, 
        power(3,3)P2, 
        power(3,4)P3,
        power(2,2)P4
        FROM DUAL;

SELECT A.SALARY, POWER(A.SALARY,2) ELEVADO
FROM HR.EMPLOYEES A

--MOD Devolve o resto da divisão de valor1 por valor2.]
SELECT MOD(3,2)RET FROM DUAL;
SELECT MOD(4,2)RET FROM DUAL;
SELECT MOD(200,80)RET FROM DUAL;


--EXP Devolve o valor 'e' elevado a n. e=2.7182818
select ROUND(exp(1),2)E1,
       TRUNC(exp(1),2)E2,
       ROUND(exp(4),2)E3,
       TRUNC(exp(4),2)E4
from dual;
 