-- Exemplos com ASCII, traz o número ASCII da primeira letra
select ascii('ab')teste from SYS.DUAL
union all
select ascii('a') from SYS.DUAL
union all
select ascii('b') from SYS.DUAL;


-- Exemplos com LOWER( ), retorna todos os campos com letra minuscula
select a.DEPARTMENT_NAME nome_depto,
      LOWER(a.DEPARTMENT_NAME)nome_depto_l, 
      LOWER('Curso SQL'),
      LOWER('Letras minusculas')
from HR.DEPARTMENTS a;

-- Exemplos com UPPER( ), retorna todos os campos com letra maiuscula
select a.DEPARTMENT_NAME nome_depto,  
       UPPER(a.DEPARTMENT_NAME)nome_depto_U, 
       UPPER('Curso SQL')
from HR.DEPARTMENTS a;

-- Exemplos com INITCAP( ), transfora a primeira letra em maiuscula
select a.DEPARTMENT_NAME nome_depto, 
         INITCAP(UPPER(a.DEPARTMENT_NAME))nome_depto_i, 
         INITCAP('curso SQL'),
         INITCAP('primeira letra maiuscula'),
         INITCAP(LOWER('primeira LETRA MAIUSCULA'))
from HR.DEPARTMENTS a;

-- Exemplos com CONCAT( ), concatena palavras

select a.FIRST_NAME,
       a.LAST_NAME,
       concat(a.FIRST_NAME, a.LAST_NAME) nome_completo,
       (a.FIRST_NAME || ' ' || a.LAST_NAME) as out_form_concat,
       'Forma de' || ' concatenar' || ' Tbm',
       concat(a.FIRST_NAME, (' ' || a.LAST_NAME)) agregando
from HR.EMPLOYEES a;

--outra opcao concatenar
select a.FIRST_NAME,
       a.LAST_NAME,
       a.FIRST_NAME||' '||a.LAST_NAME as nome_completo,
       a.FIRST_NAME||' '||a.LAST_NAME||' '||a.salary as texto
from HR.EMPLOYEES a;


-- Exemplos com LPAD( ), completa o campo com a quantidade e valor informado a esquerda

select a.EMPLOYEE_ID,
       LPAD(a.EMPLOYEE_ID,10,'0')ID_LPAD,
       a.FIRST_NAME
from HR.EMPLOYEES a;


-- Exemplos com RPAD( ), completa o campo com a quantidade e valor informado a direita

select a.EMPLOYEE_ID,
       RPAD(a.EMPLOYEE_ID,10,'X')ID_LPAD,
       a.FIRST_NAME
from HR.EMPLOYEES a;

-- Exemplos com SUBSTR( ), remove e retonar para da empressão, a partir de x posição retorna y caracteres
select SUBSTR('ORACLE',2,4) FROM SYS.DUAL;

select a.FIRST_NAME,
       a.LAST_NAME,
       SUBSTR(a.FIRST_NAME,1,1)INI_1,
       SUBSTR(a.LAST_NAME,1,1)INI2,
       CONCAT(SUBSTR(a.FIRST_NAME,1,1),SUBSTR(a.LAST_NAME,1,1)) texto3,
       INITCAP(CONCAT(SUBSTR(a.FIRST_NAME,1,2), (' ' || SUBSTR(a.LAST_NAME,1,2))))
from HR.EMPLOYEES a;
--outro exemplo

select a.FIRST_NAME,
    SUBSTR(a.FIRST_NAME,1,3)PARTE1,
    NVL(SUBSTR(a.FIRST_NAME,4,10), 'VL_NULL')PARTE2
from HR.EMPLOYEES a;

-- Exemplos com INSTR( ), retonar a posição do valor escolhido referente ao campo

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'r') posicao FROM HR.JOBS a;

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'es') posicao FROM HR.JOBS a;

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'re') posicao FROM HR.JOBS a;

SELECT a.JOB_TITLE,INSTR(a.JOB_TITLE,'t',12) a_partir_da_posicao FROM HR.JOBS a;

-- Exemplos com LTRIM( ) Limpar campo a esquerda
SELECT a.JOB_TITLE,
       LTRIM(a.JOB_TITLE,'A') posicao, 
       LTRIM(SUBSTR(a.JOB_TITLE,9,5), 'A')
       FROM HR.JOBS a;
       
-- Tirando as letras que iniciam com "AFPS'
SELECT a.JOB_TITLE,LTRIM(a.JOB_TITLE,'AFPS') posicao FROM HR.JOBS a;

--exemplo ltrim
select   '       Andre' com_espaco,
         LTRIM('        Andre',' ') sem_espaco 
from dual;

--exemplo ltrim
select concat('    Andre',LTRIM('        Andre',' ')) sem_espaco from dual;

-- Exemplos com RTRIM( )
-- Tirando as letras que finaliza com "TRE'
SELECT a.JOB_TITLE,RTRIM(a.JOB_TITLE,'tre') posicao FROM HR.JOBS a;
--exemplo
select 'Andre     ' com_espaco,'Andre'  sem_espaco from dual;

select concat(' Andre       ','Andre') espaco from dual;

select concat(RTRIM(' Andre       '),'Andre') sem_espaco from dual;

-- Exemplos com LENGTH( ), retorna qtd de caracteres
SELECT a.JOB_TITLE,
       LENGTH(a.JOB_TITLE) tamanho FROM HR.JOBS a;

-- Exemplos com TRANSLATE( )
SELECT a.JOB_TITLE,
      TRANSLATE(a.JOB_TITLE,'S','X') traducao_masc,
      TRANSLATE(a.JOB_TITLE,'s','X') traducao_min 
FROM HR.JOBS a;

-- Substitui P por X, A por Y e F por Z
SELECT a.JOB_TITLE,TRANSLATE(a.JOB_TITLE,'PAF','XYZ') traducao FROM HR.JOBS a;

-- Exemplos com REPLACE( ), substitui um campo por outro
SELECT a.JOB_TITLE,
       REPLACE(a.JOB_TITLE,'Manager','Gerente'), 
       REPLACE(a.JOB_TITLE, ' ', '_')
       FROM HR.JOBS a;

-- Exemplos com DECODE( ) - Funções de conversão 

SELECT a.JOB_TITLE  FROM HR.JOBS a;

SELECT a.JOB_TITLE,
       decode(JOB_TITLE,
                            'President','Presidente',
                            'Administration Vice President','Vice Presiente ADM',
                            'Administration Assistant','Assist Adm',
                            'Finance Manager','Gerente Financ',
                            'Accountant','Contador',
                            'Accounting Manager','Gerente de contas',
                            'Public Accountant','Contas Publicas',
                            'Sales Manager','Gerente de vendas',
                            'Sales Representative','Repres. Vendas',
                            'Purchasing Manager','Gerente de compras',
                            'Purchasing Clerk','Aux Compras',
                            'Stock Manager','Gerente de estoque',
                            'Stock Clerk','Aux Estoque',
                            'Shipping Clerk','Aux de carregamento',
                            'Programmer','Programador',
                            'Marketing Manager','Gerente de MKT',
                            'Marketing Representative','Repres de Marketing',
                            'Human Resources Representative','Repres RH',
                            'Public Relations Representative','Relacoes Publicas',
                            ' ', '_') decodif
FROM HR.JOBS a;

-- Exemplos com REVERSE( ) - Reverte o campo selecionado
SELECT a.JOB_TITLE,
       reverse(a.JOB_TITLE) revertido
FROM HR.JOBS a;

--outras funções, DUMP retorna o tipo, tamanho e valor ASCII
select (a.FIRST_NAME)nome,
        DUMP(a.FIRST_NAME)dump_nome,
        VSIZE(a.FIRST_NAME) as vsize,
        LENGTH(a.FIRST_NAME) as lenght     
        from hr.employees a;


