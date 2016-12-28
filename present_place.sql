
create table place (
  place_number varchar2(20) not null,
  space integer not null,
  primary key (place_number)
);
insert into place values('102', 20);
insert into place values('103', 20);
insert into place values('104', 20);
insert into place values('105', 20);
insert into place values('106', 20);
insert into place values('107', 20);
insert into place values('108', 20);
insert into place values('109', 20);
insert into place values('110', 20);
insert into place values('111', 20);
insert into place values('112', 20);
insert into place values('113', 20);


create table delegate (
  passport_serial_number varchar2(22) not null,
  first_name varchar2(20) not null,
  family_name varchar2(20) not null,
  patronymic varchar2(20) not null,
  work_phone varchar2(20) not null,
  home_phone varchar2(20) not null,
  mobile_phone varchar2(20),
  email varchar2(50),
  primary key (passport_serial_number)
);
insert into delegate values ('mc232232232', 'grisha', 'urgant', 'petrovich', '234234234', '34343434', '111222111', '1yandex@yandex.com');
insert into delegate values ('mc333444333', 'misha', 'kuntsevich', 'nikolaevich', '222333222', '333444333', '444555444', '2yandex@yandex.com');
insert into delegate values ('mc444555444', 'olya', 'buzova', 'petrovna', '555666555', '666777666', '777888777', '3yandex@yandex.com');
insert into delegate values ('mc555666555', 'sergey', 'svetlakov', 'aleksandrovich', '888999888', '999000999', '000111000', '4yandex@yandex.com');
insert into delegate values ('mc666777666', 'semen', 'slepakov', 'evgenievich', '000111222', '111222333', '222333444', '5yandex@yandex.com');
insert into delegate values ('mc777888777', 'nurlan', 'saburov', 'mamberbekovich', '444555666', '666777888', '888999000', '6yandex@yandex.com');
insert into delegate values ('mc888999888', 'yuliya', 'ahmedova', 'sulikonovna', '00112233', '11223344', '44556677', '7yandex@yandex.com');


create table company (
  unn_code varchar2(20) not null,
  name varchar2(20) not null,
  legal_address_city varchar2(20),
  legal_address_street varchar2(20),
  legal_address_country varchar2(20),
  web_page varchar2(20),
  fax varchar2(20),
  passport_serial_number varchar2(22) constraint delegate_company references delegate,
  primary key (unn_code)
);
insert into company values ('unn_code_1', 'bguir', 'minsk', 'kolasa,1', 'belarus', 'bguir.com', 'fax_bguir', 'mc232232232');
insert into company values ('unn_code_2', 'bgu', 'minsk', 'kolasa,2', 'belarus', 'bgu.com', 'fax_bgu', 'mc333444333');
insert into company values ('unn_code_3', 'bntu', 'minsk', 'kolasa,3', 'belarus', 'bntu.com', 'fax_bntu', 'mc444555444');
insert into company values ('unn_code_4', 'bgpu', 'minsk', 'kolasa,4', 'belarus', 'bgpu.com', 'fax_bgpu', 'mc555666555');
insert into company values ('unn_code_5', 'bgtu', 'minsk', 'kolasa,5', 'belarus', 'bgtu.com', 'fax_bgtu', 'mc666777666');
insert into company values ('unn_code_6', 'bgmu', 'minsk', 'kolasa,6', 'belarus', 'bgmu.com', 'fax_bgmu', 'mc777888777');
insert into company values ('unn_code_7', 'mglu', 'minsk', 'kolasa,7', 'belarus', 'mglu.com', 'fax_mglu', 'mc888999888');


create table production (
  production_code varchar2(20) not null,
  name varchar2(20) not null,
  description varchar2(20),
  presented_items_count integer,
  primary key (production_code),
  unn_code varchar2(20) constraint company_production references company
);
insert into production values ('prod_code_1', 'shampoo_1', 'desc_1', '11', 'unn_code_1');
insert into production values ('prod_code_2', 'shampoo_2', 'desc_2', '12', 'unn_code_2');
insert into production values ('prod_code_3', 'shampoo_3', 'desc_3', '13', 'unn_code_3');
insert into production values ('prod_code_4', 'shampoo_4', 'desc_4', '14', 'unn_code_4');
insert into production values ('prod_code_5', 'shampoo_5', 'desc_5', '15', 'unn_code_5');
insert into production values ('prod_code_6', 'shampoo_6', 'desc_6', '16', 'unn_code_6');
insert into production values ('prod_code_7', 'shampoo_7', 'desc_7', '17', 'unn_code_7');

create table product_order (
  order_id varchar2(20) not null,
  items_count integer not null,
  production_code varchar2(20) constraint order_production references production,
  passport_serial_number varchar2(22) constraint delegate_production references delegate,
  ord_date date,
  primary key (order_id)
);
insert into product_order values ('order_code_1', 1, 'prod_code_1', 'mc232232232', '1-DEC-2016');
insert into product_order values ('order_code_2', 2, 'prod_code_2', 'mc333444333', '2-DEC-2016');
insert into product_order values ('order_code_3', 3, 'prod_code_3', 'mc444555444', '3-DEC-2016');
insert into product_order values ('order_code_4', 4, 'prod_code_4', 'mc555666555', '4-DEC-2016');
insert into product_order values ('order_code_5', 5, 'prod_code_5', 'mc666777666', '5-DEC-2016');
insert into product_order values ('order_code_6', 6, 'prod_code_6', 'mc777888777', '6-DEC-2016');
insert into product_order values ('order_code_7', 7, 'prod_code_7', 'mc888999888', '7-DEC-2016');
insert into product_order values ('order_code_8', 5, 'prod_code_3', 'mc232232232', '1-DEC-2016');
insert into product_order values ('order_code_9', 3, 'prod_code_1', 'mc333444333', '2-DEC-2016');
insert into product_order values ('order_code_10', 2, 'prod_code_6', 'mc444555444', '3-DEC-2016');
insert into product_order values ('order_code_11', 4, 'prod_code_5', 'mc555666555', '4-DEC-2016');
insert into product_order values ('order_code_12', 5, 'prod_code_2', 'mc666777666', '5-DEC-2016');
insert into product_order values ('order_code_13', 6, 'prod_code_1', 'mc777888777', '6-DEC-2016');
insert into product_order values ('order_code_14', 1, 'prod_code_4', 'mc888999888', '7-DEC-2016');


create table rent (
  rent_id varchar2(20) not null,
  place_number varchar2(20) constraint place_number_rent references place,
  unn_code varchar2(20) constraint unn_rent references company,
  primary key (rent_id)
);
insert into rent values ('rent_code_2', '102', 'unn_code_2');
insert into rent values ('rent_code_3', '103', 'unn_code_3');
insert into rent values ('rent_code_4', '104', 'unn_code_4');
insert into rent values ('rent_code_5', '105', 'unn_code_5');
insert into rent values ('rent_code_6', '106', 'unn_code_6');
insert into rent values ('rent_code_7', '107', 'unn_code_7');


create table present_date(
  present_date_id varchar2(20) not null,
  name varchar2(20),
  calendar_date date,
  present_days integer,
  primary key (present_date_id)
);

insert into present_date values ('present_date_1', 'tibo2014', '1-MAY-2014', 3);
insert into present_date values ('present_date_2', 'tibo2017', '1-jun-2015', 3);
insert into present_date values ('present_date_2', 'tibo2017', '1-jun-2017', 3);
insert into present_date values ('present_date_2', 'tibo2017', '1-jul-2017', 3);
insert into present_date values ('present_date_2', 'tibo2017', '1-dec-2017', 3);

alter table present_date add present_days integer;
--------------------------------------------------------------------------------
-- ЗАПРОСЫ
---- условный
---- вывести список продуктов, которых имеется в наличии более 15шт.
SELECT name, description, presented_items_count
  FROM production WHERE presented_items_count > 15;

---- итоговый
---- вывести число продуктов, заказанных какждым представителем компании
SELECT (delegate.first_name ||' '|| delegate.family_name||' '||delegate.patronymic)
 AS "full name", SUM (product_order.items_count) "order size"
  FROM delegate, product_order
  WHERE delegate.passport_serial_number=product_order.passport_serial_number
  GROUP BY (delegate.first_name ||' '|| delegate.family_name||' '||delegate.patronymic)
  ORDER BY SUM(product_order.items_count) DESC;

---- запрос с использованием условия по полю с типом date + запрос на объединение
---- вывести список товаров, заказынных до 5 числа
SELECT production.name, product_order.items_count, product_order.ord_date
  FROM production, product_order
  WHERE production.production_code=product_order.production_code
  AND TO_NUMBER(TO_CHAR(product_order.ord_date, 'dd')) < 5;

---- union
select name , sum(items_count) "count" from production left join product_order
  using (production_code)
  group by name
  union
  select name, count(*) "count" from company left join rent
  on company.unn_code = rent.unn_code group by name;

---- параметрический
---- вывести информацию о выставочном месте по номеру места
SELECT * FROM rent WHERE place_number = &number;

---- запрос с использованием оператора IN
---- выбрать все товары, которых заказли меньше 3шт.
SELECT * FROM production where production_code
  IN (SELECT production_code FROM product_order WHERE items_count < 3);

---- INNER JOIN
SELECT * FROM place JOIN rent USING (place_number);

---- OUTER JOIN
SELECT first_name, family_name, passport_serial_number, unn_code
  FROM delegate LEFT JOIN company USING (passport_serial_number);

---- any/all
---- вывести заказ с максимальным числом заказанных продуктов
SELECT * FROM product_order
  WHERE items_count >= ALL (SELECT items_count FROM product_order);

---- EXISTS/NOT EXISTS
---- вывести лица, на которых не зарегистрирована компания
SELECT * FROM delegate WHERE NOT EXISTS (SELECT * FROM company
  WHERE delegate.passport_serial_number = company.passport_serial_number);


--------------------------------------------------------------------------------
-- ПРЕДСТАВЛЕНИЯ
---- горизонтальное обновляемое
---- выбрать все Минские компании
CREATE OR REPLACE VIEW minsk_companies AS
  SELECT * FROM company WHERE legal_address_city = 'minsk'
  WITH CHECK OPTION;

---- вертикальные необновляемые

CREATE OR REPLACE VIEW company_info AS
  SELECT delegate.first_name, delegate.family_name, company.name,
    company.unn_code, company.web_page FROM delegate, company
    WHERE delegate.passport_serial_number = company.passport_serial_number AND
      company.legal_address_city = 'minsk';

--------------------------------------------------------------------------------
-- Процедуры
---- Написать процедуру, которая принимает в качестве параметра номер
---- выставочного места и выводит список всех предприятий или товаров,
---- принимающих участие в выставке.

SET SERVEROUTPUT ON;

create or replace PROCEDURE event_companies(param IN varchar2) AS
  CURSOR rent_filter IS
    SELECT * FROM rent LEFT JOIN company USING (unn_code)
      where rent.place_number = param;

  CURSOR products(CODE production.unn_code%TYPE) IS
    SELECT * FROM production WHERE code = production.unn_code;

BEGIN
  FOR i IN rent_filter LOOP
    DBMS_OUTPUT.PUT_LINE('company:'||' '||i.name);
    DBMS_OUTPUT.PUT_LINE('products:');
    FOR j IN products(i.unn_code) LOOP
      DBMS_OUTPUT.PUT_LINE('--------'||' '||j.name);
    END LOOP;
  END LOOP;
END;
/

begin
event_companies('103');
end;
/
--------------------------------------------------------------------------------
-- ФУНКЦИИ
---- Создать функцию, возвращающую количество дней, прошедших между датой
---- последней выставки и сегодняшней датой. Если первая дата больше второй,
---- функция возвращает -1.

create or replace function get_date_diff(tmp IN varchar2)
  return integer as date_diff integer;

last_date date;
cur_date date;

own_excp exception;
PRAGMA EXCEPTION_INIT (own_excp, -01861);

BEGIN
  cur_date:=to_date(tmp, 'dd.mm.yy');
  select max(calendar_date) into last_date from present_date;
  if (cur_date > last_date) then
    date_diff:=(cur_date - last_date);
  else
    date_diff:=(-1);
  end if;
  return date_diff;
  EXCEPTION
	WHEN own_excp then RAISE_APPLICATION_ERROR(-20001,'введен некорректный тип данных - нужен number');
END;
/

---- without exception
DECLARE
cur_date date;
res integer;
begin
select SYSDATE into cur_date FROM DUAL;
res:=first_pkg.get_date_diff(cur_date);
dbms_output.put_line(res);
end;
/

---- with exception
DECLARE
cur_date date;
res integer;
begin
select SYSDATE into cur_date FROM DUAL;
res:=first_pkg.get_date_diff('123');
dbms_output.put_line(res);
end;
/

---- raise user exceptions
create or replace procedure raise_error as
  excp exception;
  PRAGMA EXCEPTION_INIT(excp, -20001);
  res integer;
begin
  res:=get_date_diff('123');
  exception when excp then DBMS_OUTPUT.put_line('run own excp');
end;
/

begin
raise_error;
end;
/
--------------------------------------------------------------------------------
--##############################################################################
--------------------------------------------------------------------------------
-- PACKAGE

CREATE OR REPLACE PACKAGE first_pkg AS
  PROCEDURE event_companies(param IN varchar2);
  PROCEDURE raise_error;
  FUNCTION get_date_diff(tmp IN varchar2) return integer;
END;
 /


CREATE OR REPLACE PACKAGE BODY first_pkg AS
  PROCEDURE event_companies(param IN varchar2) AS
    CURSOR rent_filter IS
      SELECT * FROM rent LEFT JOIN company USING (unn_code)
        where rent.place_number = param;

    CURSOR products(CODE production.unn_code%TYPE) IS
      SELECT * FROM production WHERE code = production.unn_code;

  BEGIN
    FOR i IN rent_filter LOOP
      DBMS_OUTPUT.PUT_LINE('company:'||' '||i.name);
      DBMS_OUTPUT.PUT_LINE('products:');
      FOR j IN products(i.unn_code) LOOP
        DBMS_OUTPUT.PUT_LINE('--------'||' '||j.name);
      END LOOP;
    END LOOP;
  END;

  FUNCTION get_date_diff(tmp IN varchar2)
    return integer as date_diff integer;

  last_date date;
  cur_date date;

  own_excp exception;
  PRAGMA EXCEPTION_INIT (own_excp, -01861);

  BEGIN
    cur_date:=to_date(tmp, 'dd.mm.yy');
    select max(calendar_date) into last_date from present_date;
    if (cur_date > last_date) then
      date_diff:=(cur_date - last_date);
    else
      date_diff:=(-1);
    end if;
    return date_diff;
    EXCEPTION
  	WHEN own_excp then RAISE_APPLICATION_ERROR(-20001,'введен некорректный тип данных - нужен number');
    WHEN others then DBMS_OUTPUT.put_line('run own excp ' || SQLCODE);
  END;

  procedure raise_error as
    excp exception;
    PRAGMA EXCEPTION_INIT(excp, -20001);
    res integer;
  begin
    res:=get_date_diff('123');
    exception when excp then DBMS_OUTPUT.put_line('run own excp');
  end;
END;
 /

begin
  first_pkg.event_companies('103');
end;
/

 DECLARE
  cur_date date;
  res integer;
 begin
  select SYSDATE into cur_date FROM DUAL;
  res:=first_pkg.get_date_diff(cur_date);
  dbms_output.put_line(res);
  dbms_output.put_line('#################');
  first_pkg.event_companies('303');
  dbms_output.put_line('#################');
  first_pkg.raise_error;
 end;
 /

 begin
  first_pkg.raise_error;
 end;
 /

--------------------------------------------------------------------------------
--##############################################################################
--------------------------------------------------------------------------------
-- LOCAL

CREATE OR REPLACE procedure local_block (tmp IN varchar2) AS
  own_excp exception;
  PRAGMA EXCEPTION_INIT (own_excp, -1858);
  FUNCTION inner_function return integer as date_diff integer;

    last_date date;
    cur_date date;
    begin
      select max(calendar_date) into last_date from present_date;

      cur_date:=to_date(tmp, 'dd.mm.yy');

      if (cur_date > last_date) then
        date_diff:=(cur_date - last_date);
      else
        date_diff:=(-1);
      end if;
      return date_diff;
    end;

BEGIN
  if(inner_function > 1) then
    DBMS_OUTPUT.put_line('Last presentation finished '||inner_function||' days ago');
  else
    DBMS_OUTPUT.put_line('Dear visitor, wait for a while. presentation did not finished');
  end if;

  EXCEPTION
    WHEN own_excp then RAISE_APPLICATION_ERROR(-20001,'check format. put something like 12-DEC-18');
    WHEN others then DBMS_OUTPUT.put_line('RUN OTHER EXCEPTION: ' || SQLCODE);
END;
/


begin
  local_block('12-DEC-13');
end;
/
--------------------------------------------------------------------------------
--##############################################################################
--------------------------------------------------------------------------------
--  OVERLOADED
CREATE OR REPLACE PACKAGE OVERLOADED AS
  procedure get_month(param date);
  procedure get_month(param varchar2);
END;
 /

create or replace PACKAGE BODY OVERLOADED AS
  procedure get_month(param IN date) AS
  begin
    dbms_output.put_line('first '||to_char(param, 'mon'));
  end get_month;

  procedure get_month(param IN varchar2) AS
  begin
    dbms_output.put_line('second '||substr(param, 4, 3));
  end get_month;

END OVERLOADED;
/
--ЛИБО
declare param date;
begin
  select sysdate into param from dual;
  OVERLOADED.get_month(param);
end;
/

--ЛИБО
declare param varchar2(20);
begin
  param:='12-DEC-18';
  OVERLOADED.get_month(param);
end;
/
--------------------------------------------------------------------------------
--##############################################################################
--------------------------------------------------------------------------------
--TRIGGERS
---- trigger on insert, update, delete on delegate.work_phone
create table log1 (
  col_name varchar2(20) not null,
  log_type varchar2(20) not null,
  old_value varchar2(20),
  new_value varchar2(20),
  author varchar2(20) not null,
  log_date_time varchar2(40) not null
);

CREATE OR REPLACE TRIGGER trigger1
  AFTER
    INSERT OR
    DELETE OR
    UPDATE
  ON delegate
FOR EACH ROW
BEGIN
  CASE
    WHEN INSERTING THEN
      insert into LOG1(col_name, log_type, new_value, author, log_date_time)
         values('work_phone', 'insert', :new.work_phone, sys_context('userenv', 'CURRENT_USER'), to_char(current_timestamp, 'dd.mm.yyyy hh:mm'));
    WHEN UPDATING('work_phone') THEN
      insert into LOG1
         values('work_phone', 'update', :old.work_phone, :new.work_phone, sys_context('userenv', 'CURRENT_USER'), to_char(current_timestamp, 'dd.mm.yyyy hh:mm'));
    WHEN DELETING THEN
      insert into LOG1(col_name, log_type, old_value, author, log_date_time)
         values('work_phone', 'deleteing', :old.work_phone, sys_context('userenv', 'CURRENT_USER'), to_char(current_timestamp, 'dd.mm.yyyy hh:mm'));
  END CASE;
END;
/

insert into delegate values ('mc_trig_test_6', 'trig_name_6', 'trig_second_name_6', 'trig_patr_6', 'trig_work_phone_6', 'trig_home_phone_6', 'trig_mobile_phone_6', 'ololo@yandex.com');

insert into delegate values ('mc_trig_test_5', 'trig_name_5', 'trig_second_name_5', 'trig_patr_5', 'trig_work_phone_5', 'trig_home_phone_5', 'trig_mobile_phone_5', 'ololo@yandex.com');
update delegate set work_phone='work_phone_update_2' where work_phone='trig_work_phone_2';
delete from delegate where work_phone='trig_work_phone_4';

--------------------------------------------------------------------------------
----
CREATE OR REPLACE TRIGGER trigger2
  BEFORE
    CREATE OR
    DROP OR
    ALTER
  ON schema
BEGIN
  IF (ora_sysevent = 'CREATE' AND ora_dict_obj_type = 'TABLE') THEN
		if to_number(to_char(SYSDATE, 'HH24')) > 8 AND to_number(to_char(SYSDATE, 'HH24')) < 17 then
			raise_application_error(-20002,'ACCESS DENIED!');
		else
			insert into LOG2(user_name, log_time, log_type)
         values(sys_context('userenv', 'CURRENT_USER'), to_char(current_timestamp, 'dd.mm.yyyy hh:mm'), 'create table');
		end if;
  END IF;

  IF (ora_sysevent = 'DROP' AND ora_dict_obj_type = 'TABLE') THEN
		if to_number(to_char(SYSDATE, 'HH24')) > 8 AND to_number(to_char(SYSDATE, 'HH24')) < 17 then
			raise_application_error(-20002,'ACCESS DENIED!');
		else
			insert into LOG2(user_name, log_time, log_type)
         values(sys_context('userenv', 'CURRENT_USER'), to_char(current_timestamp, 'dd.mm.yyyy hh:mm'), 'drop table');
		end if;
  END IF;

  IF (ora_sysevent = 'ALTER' AND ora_dict_obj_type = 'TABLE') THEN
		if to_number(to_char(SYSDATE, 'HH24')) > 8 AND to_number(to_char(SYSDATE, 'HH24')) < 17 then
			raise_application_error(-20002,'ACCESS DENIED!');
		else
			insert into LOG2(user_name, log_time, log_type)
         values(sys_context('userenv', 'CURRENT_USER'), to_char(current_timestamp, 'dd.mm.yyyy hh:mm'), 'alter table');
		end if;
  END IF;
END;
/

--------------------------------------------------------------------------------
---- lOGON/LOGOFF
create table SYSTEM.LOG3(
  user_name varchar2(20),
  activity_type varchar2(10),
  log_time varchar2(40),
  records_num number
);

-- LOGON
CREATE OR REPLACE TRIGGER trigger_3_1
  AFTER LOGON ON DATABASE
DECLARE
	records_count number;
BEGIN
	  select count(*)
	  into records_count
	  from present_place.production;
    insert into SYSTEM.LOG3(user_name, activity_type, log_time, records_num)
      values(USER,'logon', to_char(current_timestamp, 'dd.mm.yyyy hh:mm'), records_count);
END trigger_3_1;
/

-- LOGOFF
CREATE OR REPLACE TRIGGER trigger32
BEFORE LOGOFF ON DATABASE
DECLARE
	records_count number;
BEGIN
	  select count(*)
	  into records_count
    from present_place.production;
      insert into SYSTEM.LOG3(user_name, activity_type, log_time, records_num)
        values(USER,'logoff', to_char(current_timestamp, 'dd.mm.yyyy hh:mm'), records_count);
END trigger_3_2;
/

--------------------------------------------------------------------------------
--⦁	При вставке данных в таблицу «Организация выставки» проверять не занято ли
---- уже выставочное место, запрещать отдавать более 20% мест на выставке одному
---- предприятию.

create or replace procedure check_proc(code IN varchar2) as
  necessary_count number;
  available_count number;
  used_space number;
BEGIN
  select count(*) into available_count from place;
  select count(*) into necessary_count from rent where unn_code = code;
  used_space:= round(necessary_count/available_count*100,2);
  dbms_output.put_line('used space(%): '||used_space);
END;
/

create or replace function check_func(code IN varchar2) return number as
  res number;
  necessary_count number;
  available_count number;
BEGIN
  select count(*) into available_count from place;
  select count(*) into necessary_count from rent where unn_code = code;
  res:=round((necessary_count+1)/available_count*100, 2);
  return res;
END;
/

create or replace trigger check_trig before insert on rent for each ROW
declare
  necessary_area number;
begin
  check_proc(:new.unn_code);
  necessary_area:=check_func(:new.unn_code);
  dbms_output.put_line('will be used space(%): '||necessary_area);
  if(necessary_area > 20) then
    RAISE_APPLICATION_ERROR (-20004, 'We are sorry. We provide only 20% of area.');
  end if;
end;
/

insert into rent values ('rent_code_1123', '107', 'unn_code_1');

--------------------------------------------------------------------------------
--⦁	Контролировать даты проведения выставок: количество дней выставки не менее
---- 3-х, время между выставками не менее 2-х дней и т.д.

create or replace function check_fail(new_date date, new_duration integer) return
  boolean as
  last_date date;
  duration integer;
  diff integer;
  result boolean;
begin
  select max(calendar_date) into last_date from present_date;
  select present_days into duration from present_date where calendar_date = last_date;
  diff:= new_date - (last_date + duration);
  if(new_duration < 3 or diff < 2) then
    result:=true;
    last_present_info;
  else
    result:=false;
  end if;
  return result;
  exception when no_data_found then
    if(new_duration < 3) then
      last_present_info;
      return true;
    else
      return false;
    end if;
end;
/

create or replace procedure last_present_info as
  last_date date;
  duration integer;
begin
  select max(calendar_date) into last_date from present_date;
  select present_days into duration from present_date where calendar_date = last_date;
  dbms_output.put_line('Last presentation info:');
  dbms_output.put_line('-- start date: '|| last_date);
  dbms_output.put_line('--  duration: '|| duration);
  dbms_output.put_line('Set presentation after 2 days from last one finished('||
    to_char(last_date + duration + 2, 'dd.mm.yy') ||') or choose duration from 3 or more days.');
  exception when no_data_found then
    dbms_output.put_line('There is no any presentation before. Choose duration from 3 or more days.');
end;
/

create or replace trigger check_date before insert on present_date for each ROW
declare
begin
  if(check_fail(:new.calendar_date,:new.present_days))then
    RAISE_APPLICATION_ERROR (-20005, 'Incorrect date of new presentation.');
  end if;
end;
/

insert into present_date values ('present_date_4', 'tibo2016_1', '26-MAY-2016', 3);
insert into present_date values ('present_date_14', 'tibo2016_1', '8-jun-2017', 3);

--------------------------------------------------------------------------------
--⦁	В дополнительной таблице обновлять информацию о количестве выставок по
---- месяцам.

create table month_info(
  month_name varchar2(10),
  presentation_count integer
);

create or replace view parsed_month_count as
  SELECT count(to_char(calendar_date, 'month')) mcount, to_char(calendar_date, 'month') mname from present_date group by to_char(calendar_date, 'month');

create or replace procedure update_month_info(param date) as
  CURSOR month_count is
    SELECT count(to_char(calendar_date, 'month')) from present_date
    where to_char(param, 'month') = to_char(calendar_date, 'month');

  CURSOR info_month_count is
    SELECT count(to_char(param, 'month')) from month_info
    where to_char(param, 'month') = month_name;

  t_mcount number;
  count_from_info number;
  pragma AUTONOMOUS_TRANSACTION;
begin
  open month_count;
  fetch month_count into t_mcount;

  open info_month_count;
  fetch info_month_count into count_from_info;

  if(count_from_info=0) then
    insert into month_info values(to_char(param, 'month'), t_mcount + 1);
  else
    update month_info set presentation_count = presentation_count + 1
      where month_name like to_char(param, 'month');
  end if;
  close month_count;
  close info_month_count;
  commit;
end;
/

create or replace trigger events_per_month
  after insert or update on present_date for each row
declare
begin
  update_month_info(:new.calendar_date);
end;
/


-- 3 of JAN
insert into present_date values ('present_date_1', 'tibo2016_1', '1-jan-2016', 3);
insert into present_date values ('present_date_2', 'tibo2016_2', '8-jan-2016', 3);
insert into present_date values ('present_date_3', 'tibo2016_3', '15-jan-2016', 3);
-- 2 of FEB
insert into present_date values ('present_date_4', 'tibo2016_4', '1-feb-2016', 3);
insert into present_date values ('present_date_5', 'tibo2016_5', '8-feb-2016', 3);
-- 1 of JUNE
insert into present_date values ('present_date_6', 'tibo2016_6', '1-jun-2016', 3);
-- 2 of OCT
insert into present_date values ('present_date_7', 'tibo2016_7', '1-oct-2016', 3);
insert into present_date values ('present_date_8', 'tibo2016_8', '8-oct-2016', 3);
-- 2 of NOV
insert into present_date values ('present_date_9', 'tibo2016_9', '1-nov-2016', 3);
insert into present_date values ('present_date_10', 'tibo2016_10', '8-nov-2016', 3);

--------------------------------------------------------------------------------
--##############################################################################
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--##############################################################################
--------------------------------------------------------------------------------

-- триггеры
-- create or replace TRIGGER check_count
-- after INSERT
-- ON product_order
-- FOR EACH ROW
-- DECLARE
-- available_count integer;
-- necessary_count integer;
-- code varchar2(100);
-- trans_excep exception;
-- BEGIN
--   select production.presented_items_count
--   into available_count
--   from production, product_order
--   where production.production_code = product_order.production_code;
--
--   select product_order.production_code
--   into necessary_count
--   from production, product_order
--   where production.production_code = product_order.production_code;
--
--   select production.production_code
--   into code
--   from production, product_order
--   where production.production_code = product_order.production_code;
--
--   dbms_output.put_line(code||' '||available_count||' '||necessary_count);
--
--   -- if available_count < necessary_count then raise trans_excep;
--   -- else
--   -- update production
--   --   set presented_items_count=(available_count-necessary_count)
--   --   where production_code = code;
--   -- end if;
--   -- exception
--   -- when trans_excep then dbms_output.put_line('not enough products');
--
-- END check_count;
-- /
