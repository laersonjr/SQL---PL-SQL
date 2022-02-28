--criando funçao para media ponderada;

CREATE OR REPLACE FUNCTION Fn_mediaPond
                    (nota1 in number,
                     peso1 in number,
                     nota2 in number,
                     peso2 in number)
return number
is
media_pond number;
begin
        media_pond:=(nota1*peso1+nota2*peso2)/(peso1+peso2);
        return media_pond;
end;
/

-- retornance valor de função
select  Fn_mediaPond(10,1,10,1) from SYS.DUAL;
select  Fn_mediaPond(8,4,10,6) from SYS.DUAL;

-- REtornando atraves de output]
SET SERVEROUTPUT ON
BEGIN
dbms_output.put_line(Fn_mediaPond(5,5,10,1)); 
END;
/

-- Criando função que realizar o fatorial de um número
CREATE OR REPLACE FUNCTION fn_fact (var_num int)
RETURN INT IS var_result INT;
BEGIN
var_result := 1;
    FOR i IN 1..var_num LOOP
        var_result := i*var_result;
    END LOOP;
RETURN var_result;
END;

select fn_fact(5) from SYS.DUAL;
