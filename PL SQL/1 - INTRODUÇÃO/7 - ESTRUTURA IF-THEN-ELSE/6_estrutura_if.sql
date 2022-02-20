
-- Bloco if then comparando valores
SET SERVEROUTPUT ON
ACCEPT v_digitado PROMPT 'Digite o numero da sorte:'
DECLARE
      v_numero int;
      v_sorte int default 5;     
  BEGIN
      v_numero:=&v_digitado;
      IF v_numero = v_sorte THEN
        DBMS_OUTPUT.PUT_LINE('Parabens!!! Você acertou!!!');
      END IF;
  END;
  /
  
-- exemplo usando a estrutura IF - THEN - ELSE  
  SET SERVEROUTPUT ON
ACCEPT v_digitado PROMPT 'Digite o nuemero da sorte:'
DECLARE
      v_numero int;
      v_sorte int default 5;     
  BEGIN
      v_numero:=&v_digitado;
      IF v_numero = v_sorte THEN
        DBMS_OUTPUT.PUT_LINE('Parabens!!! Voce acertou');
        else
         DBMS_OUTPUT.PUT_LINE('oh oHH!! errou tente outra vez!');
   END IF;
  END;
  /
-- USANDO A ESTRUTURA IF THEN ELSEIF  
  SET SERVEROUTPUT ON
  ACCEPT v_digitado PROMPT 'Digite um numero de 0 a 100:'
  DECLARE
      v_numero int;     
  BEGIN
      v_numero:=&v_digitado;
      IF v_numero <=10 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 0 a 10');
        ELSIF  v_numero > 10 and v_numero<=30 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 11 a 30');
        ELSIF  v_numero > 30 and v_numero<=50 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 31 a 50');
        ELSIF  v_numero > 50 and v_numero<=100 THEN
            DBMS_OUTPUT.PUT_LINE('seu numero esta entre 51 a 100');
        else
            DBMS_OUTPUT.PUT_LINE('seu numero esta fora os limites');
   END IF;
  END;
  /
  
 -- Bloco anônimo que faz insert na tabela dependendo da região
  ACCEPT v_regiao PROMPT 'Digite a Região: '
  DECLARE
    v_qtd_departamento INT;
    v_media_salario decimal(12,2);
    v_qtd_funcionarios INT;
    v_continente varchar2(30);
    v_cod_regiao int;
  BEGIN
   v_cod_regiao:=&v_regiao;
      select count(distinct(a.department_id)), avg(a.salary), count(a.department_id), e.region_name
      into v_qtd_departamento, v_media_salario, v_qtd_funcionarios, v_continente
    from HR.employees a
        inner join HR.departments b on a.department_id = b.department_id
        inner join HR.locations c on b.location_id = c.location_id
        inner join HR.countries d on c.country_id = d.country_id
        inner join HR.regions e on d.region_id = e.region_id
   where d.region_id = v_cod_regiao
   group by e.region_name;

   
   if v_continente  = 'Europe' then
        insert into region_eu (qtd_departamento, media_salario, qtd_funcionarios)
        values (v_qtd_departamento, v_media_salario, v_qtd_funcionarios);
     elsif v_continente = 'Americas' then
        insert into region_amer (qtd_departamento, media_salario, qtd_funcionarios)
        values (v_qtd_departamento, v_media_salario, v_qtd_funcionarios);
     elsif v_continente = 'Asia' then
        insert into region_asia (qtd_departamento, media_salario, qtd_funcionarios)
        values (v_qtd_departamento, v_media_salario, v_qtd_funcionarios);
     elsif v_continente = 'Middle East and Africa' then
        insert into region_east (qtd_departamento, media_salario, qtd_funcionarios)
        values (v_qtd_departamento, v_media_salario, v_qtd_funcionarios);
     else DBMS_OUTPUT.PUT_LINE('Região invalida ou região sem funcionários');
   end if;
   
      
   EXCEPTION
         WHEN no_data_found THEN
           DBMS_OUTPUT.PUT_LINE('Região não encontrada');
    
  END;
  
  select * from HR.regions
  
    select * from region_eu;
    select * from region_amer;
    select * from region_asia;
    select * from region_east;
  
   create table region_eu (
    qtd_departamento INT,
    media_salario decimal(12,2),
    qtd_funcionarios INT,
    regiao varchar(18) default 'Europe'
  )
  
    create table region_amer (
    qtd_departamento INT,
    media_salario decimal(12,2),
    qtd_funcionarios INT,
    regiao varchar(18) default 'Americas'
  )
  
  create table region_asia (
    qtd_departamento INT,
    media_salario decimal(12,2),
    qtd_funcionarios INT,
    regiao varchar(18) default 'Asia'
  )
  
  create table region_east (
    qtd_departamento INT,
    media_salario decimal(12,2),
    qtd_funcionarios INT,
    regiao varchar(50) default 'Middle East and Africa'
  )
  

  select count(distinct(a.department_id)), avg(a.salary), count(a.department_id), e.region_name
    from HR.employees a
        inner join HR.departments b on a.department_id = b.department_id
        inner join HR.locations c on b.location_id = c.location_id
        inner join HR.countries d on c.country_id = d.country_id
        inner join HR.regions e on d.region_id = e.region_id
   where e.region_id = 4
   group by e.region_name;
  