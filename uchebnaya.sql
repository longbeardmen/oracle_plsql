create table branch (
  bno integer not null,
  street varchar2(30),
  city varchar2(30),
  tel_number integer,
  primary key (bno),
  constraint uniq_tel unique (tel_number)
);
insert into branch values(1,'brovki,1','minsk','111111111');
insert into branch values(2,'brovki,1','minsk','222222222');
insert into branch values(3,'brovki,3','minsk','333333333');

create table stuff (
  sno integer not null,
  fname varchar2(30),
  lname varchar2(30),
  address varchar2(30),
  tel_number integer,
  position varchar2(30),
  sex varchar2(6),
  dob date,
  salary integer,
  bno integer not null,
  primary key (sno),
  constraint connect_stuff_to_bno foreign key (bno) references branch,
  constraint check_sex check(sex in ('male', 'female'))
);
insert into stuff values(1, 'roman', 'tehanov', 'gikalo,1,minsk','444444444','student', 'male','23.08.1996', '5000', 1);
insert into stuff values(2, 'sasha', 'pushkin', 'gikalo,2,minsk','555555555','writer', 'male','23.08.1996', '5000', 2);
insert into stuff values(3, 'lev', 'tolstoy', 'gikalo,3,minsk','666666666','writer', 'male','23.08.1996', '5000', 3);
insert into stuff values(4, 'garik', 'harlamov', 'gikalo,4,minsk','454454454','student', 'male','23.08.1996', '500', 1);
insert into stuff values(5, 'pavel', 'volya', 'gikalo,5,minsk','565565565','writer', 'male','23.08.1996', '100', 2);
insert into stuff values(6, 'ruslan', 'beliy', 'gikalo,6,minsk','676676676','writer', 'male','23.08.1996', '3000', 3);

create table property_for_rent (
  pno integer not null,
  street varchar2(30),
  city varchar2(30),
  type varchar2(1),
  rooms integer,
  rent integer,
  primary key (pno),
  constraint chech_prop_type check (type in ('h', 'f')),
  ono integer constraint connect_rent_property_to_ono references owner,
  sno integer constraint connect_rent_property_to_sno references stUff,
  bno integer constraint connect_rent_property_to_bno references branch
);
insert into property_for_rent values(1, 'platonova,1', 'minsk', 'h', 1, 100, 1, 1, 1);
insert into property_for_rent values(2, 'platonova,2', 'minsk', 'f', 2, 200, 2, 2, 2);
insert into property_for_rent values(3, 'platonova,1', 'minsk', 'h', 3, 300, 3, 3, 3);
insert into property_for_rent values(4, 'platonova,2', 'minsk', 'f', 3, 400, 3, 3, 3);

create table renter (
  rno integer not null,
  fname varchar2(30),
  lname varchar2(30),
  address varchar2(30),
  tel_number integer,
  pref_type varchar2(1),
  max_rent integer,
  primary key (rno),
  constraint chech_pref_rent_type check (pref_type in ('h', 'f')),
  bno integer constraint connect_renter_to_bno references branch
);
insert into renter values(1, 'iosif', 'stalin', 'kolasa,1,minsk','777777777', 'h', 100, 1);
insert into renter values(2, 'yuliy', 'gusman', 'kolasa,2,minsk','888888888', 'f', 200, 2);
insert into renter values(3, 'sasha', 'mslyakov', 'kolasa,2,minsk','999999999', 'h', 300, 3);
insert into renter values(4, 'iosif', 'stalin', 'minsk,kolasa,8','777777777', 'h', 100, 1);
insert into renter values(5, 'yuliy', 'gusman', 'mogilev, kolasa,7','888888888', 'f', 200, 2);
insert into renter values(6, 'sasha', 'mslyakov', 'minsk, kolasa,2','999999999', 'h', 300, 3);

create table owner (
  ono integer not null,
  fname varchar2(30),
  lname varchar2(30),
  address varchar2(30),
  tel_number integer,
  primary key (ono)
);
insert into owner values(1, 'pavel', 'bulka', 'kupaly,1,minsk','121121121');
insert into owner values(2, 'vova', 'putin', 'kupaly,2,minsk','232232232');
insert into owner values(3, 'barak', 'obama', 'kupaly,3,minsk','343343343');

create table viewing (
  date1 date,
  comment1 varchar2(30),
  rno integer constraint connect_viewing_to_rno references renter,
  pno integer constraint connect_viewing_to_pno references property_for_rent,
  primary key (rno, pno)
);
insert into viewing values('10.10.2009', 'comment 1', 1, 1);
insert into viewing values('20.10.2009', 'comment 2', 2, 2);
insert into viewing values('10.11.2007', 'comment 3', 3, 3);

create sequence beardmen.my_sequence
increment by 1
start with 1
nomaxvalue
nominvalue
nocycle
nocache;

-- create or replace TRIGGER branch_id
-- BEFORE INSERT
-- ON branch
-- FOR EACH ROW
-- BEGIN
-- SELECT my_sequence.nextval
-- INTO :new.bno
-- FROM dual;
-- END;
-- /
--
-- create or replace TRIGGER stuff_id
-- BEFORE INSERT
-- ON stuff
-- FOR EACH ROW
-- BEGIN
-- SELECT my_sequence.nextval
-- INTO :new.sno
-- FROM dual;
-- END;
-- /
--
-- create or replace TRIGGER property_for_rent_id
-- BEFORE INSERT
-- ON property_for_rent
-- FOR EACH ROW
-- BEGIN
-- SELECT my_sequence.nextval
-- INTO :new.pno
-- FROM dual;
-- END;
-- /
--
-- create or replace TRIGGER renter_id
-- BEFORE INSERT
-- ON renter
-- FOR EACH ROW
-- BEGIN
-- SELECT my_sequence.nextval
-- INTO :new.rno
-- FROM dual;
-- END;
-- /
--
-- create or replace TRIGGER owner_id
-- BEFORE INSERT
-- ON branch
-- FOR EACH ROW
-- BEGIN
-- SELECT my_sequence.nextval
-- INTO :new.bno
-- FROM dual;
-- END;
-- /

/*Lab 2*/

/*Вывести в одном поле адреса и стоимость всех 3-х комнатных квартир, предлагаемых в аренду*/
select (street ||'; '|| city||'; '||rent) as "street, city, rent" from property_for_rent where rooms = 3;

/*Получить список арендаторов, осматривавших объекты аренды в 2009 году*/
select * from renter where rno in (select rno from viewing where date1 between '01.01.2009' and '31.12.2009');
select * from renter where rno in (select rno from viewing where to_char(date1, 'yyyy') = '2009');

/*Определить минимальную и максимальную зарплаты сотрудников во всех отделениях. Подписать вычисляемые поля как «Минимальная зарплата» и «Максимальная зарплата».*/
SELECT bno, min(salary) as "min salary", max(salary) as "max salary" FROM stuff GROUP BY bno;

/*Вывести отделения, в которых суммарная заработная плата больше 3000$*/
SELECT sum(salary), bno FROM stuff GROUP BY bno having  sum(salary) > 5200;


--------------------------------------------------------------------------------
-- представления
---- информация об офисах в городе минск
create view select_for_minsk as select * from branch where city = 'minsk';

---- мин стоимость
CREATE VIEW min_rent AS SELECT * FROM property_for_rent
  WHERE rent in (SELECT MIN (rent) FROM property_for_rent);

---- информация о числе осмотров
CREATE VIEW review_count AS SELECT COUNT(*) AS count
  FROM viewing WHERE comment1 IS NOT NULL;

---- информация об арендаторах
CREATE OR REPLACE VIEW room_renter AS SELECT * FROM renter WHERE rno IN
  (SELECT renter.rno FROM viewing, renter, property_for_rent
    WHERE viewing.rno = renter.rno AND viewing.pno = property_for_rent.pno
      AND property_for_rent.rooms = 3 AND
      property_for_rent.city IN SUBSTR(renter.address, 1, LENGTH(property_for_rent.city)));

---- max count of person in branch
CREATE VIEW max_person_count AS SELECT * FROM branch WHERE bno IN
  (SELECT bno FROM stuff GROUP BY bno
    HAVING COUNT(bno) = (SELECT MAX(COUNT(bno)) FROM stuff GROUP BY bno));

---- rentor in Staff
CREATE VIEW year_quter_rent AS
  SELECT s.sno,s.fname, s.lname, s.tel_number,PFR.pno, PFR.city,PFR.street,PFR.type,
  PFR.rooms,PFR.rent FROM stuff s, property_for_rent PFR, viewing
    WHERE s.sno = PFR.sno AND PFR.pno = viewing.pno
      AND TO_CHAR (date1,'Q') = TO_CHAR(sysdate,'Q');

---- more then 2 viewing
CREATE OR REPLACE VIEW view_counts AS SELECT o.*
  FROM Owner o, property_for_rent PFR WHERE o.ono = PFR.ono
  AND PFR.pno IN (SELECT pno FROM
    (SELECT pno, COUNT(rno) FROM Viewing GROUP BY pno HAVING COUNT(rno)>1));
