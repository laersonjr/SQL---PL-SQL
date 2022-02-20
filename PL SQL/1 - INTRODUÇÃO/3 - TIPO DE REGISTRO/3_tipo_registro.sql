-- Exibe dados de um funcionario da tabela 'employees', schema 'hr' --
--% comercial na variavel fora PL/SQL pedir valor para variavel
set SERVEROUTPUT ON;

DECLARE
-- Definição de tipos
TYPE TFuncionario IS RECORD(
Nome VARCHAR2(40) ,
Depto VARCHAR2(20),
Salario NUMBER(10,2)
);
-- Declaração de variáveis
vFunc TFuncionario;
BEGIN
-- Atribuir valor para o registro vProduto
SELECT a.FIRST_NAME,a.DEPARTMENT_ID,a.SALARY
INTO vFunc.Nome, vFunc.Depto, vFunc.Salario
FROM hr.employees a
WHERE a.EMPLOYEE_ID = 103;
-- Imprimir na tela os dados recuperados
dbms_output.put_line('Nome do Func: '||vFunc.Nome||chr(10)||
'Depto: '||vFunc.Depto||chr(10)||
'Salario: '||to_char(vFunc.Salario)
);
END;
/


DECLARE
TYPE TSenso is RECORD (
Estado varchar(100),
Ano varchar(10),
Soma_PIB INT,
Qtd_Cidade INT,
COD_Estado varchar(10));

vSenso TSenso;

BEGIN
SELECT a.estado, a.ano, count(a.estado), sum(a.pib)
INTO vSenso.Estado, vSenso.Ano, vSenso.Qtd_cidade, vSenso.Soma_PIB
from senso a
where a.ano = 2014
and a.cod_uf = 11
group by a.estado, a.ano;
DBMS_OUTPUT.put_line('vSenso.Estado : ' || vSenso.Estado);
DBMS_OUTPUT.put_line('vSenso.Ano : ' || vSenso.Ano);
DBMS_OUTPUT.put_line('vSenso.Qtd_cidade : ' || vSenso.Qtd_cidade);
DBMS_OUTPUT.put_line('vSenso.Soma_PIB : ' || vSenso.Soma_PIB);
END;