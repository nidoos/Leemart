drop table rfid cascade constraints;
drop table place cascade constraints;
drop table stock cascade constraints;
drop table calculate cascade constraints;
drop table sales cascade constraints;

create table rfid(
r_num varchar2(30),
admin number(2),
use number(2),
constraints rfid_r_pk primary key(r_num)
);
create table place(
kind varchar2(10),
loc number(2),
constraints pl_kin_pk primary key(kind)
);

create table stock(
name varchar2(20),
kind varchar2(10),
b_num varchar2(35),
count number(4),
price number(10),
in_date DATE,
lim_date DATE,
event varchar2(50),
constraints st_b_pk primary key(name),
constraints st_k_fk  foreign key(kind) references place(kind)
);


create table calculate(
name varchar2(20),
price number(10),
count number(4),
total number(10),
r_num varchar2(30),
constraints cal_b_fk  foreign key(name) references stock(name)
);

create table sales(
Sdate DATE,
people number(4),
sum number(9),
constraints sa_da_pk primary key(Sdate));

commit

select * from sales

insert into PLACE values('snack',1);
insert into PLACE values('fruit',2);
insert into PLACE values('furniture',3);
insert into PLACE values('bakery',4);

insert into stock values('예감','snack','1234',12,1200,'2020-12-01','2020-12-08','1+1');
insert into stock values('사탕','snack','12134',58,200,'2020-11-11','2020-11-20','');
insert into stock values('파인애플','fruit','11111',11,6980,sysdate,sysdate+7,'');
insert into stock values('의자','furniture', 55555,13,130000,to_char(sysdate,'YYYY-MM-DD'),to_char((sysdate+(INTERVAL '10' YEAR)),'YYYY-MM-DD'),'');

insert into CALCULATE values('파인애플',5600,4,'');
insert into CALCULATE values('포카칩',1500,2,'12334');
insert into CALCULATE values('의자',3500,2,'1445777342');
insert into CALCULATE values('피자빵',2500,6,'1445777342');
insert into CALCULATE values('모카빵',0,1,'606252409214');
insert into CALCULATE values('의자',35000,1,'58902290626');

select name,kind,b_num,price,to_char(lim_date,'YYYY-MM-DD') from stock where lim_date<sysdate-2;
select name, kind, b_num, count, price,to_char(in_date,'YYYY-MM-DD'),to_char(lim_date,'YYYY-MM-DD') from stock order by lim_date;

insert into sales values(to_char(sysdate-6,'YYYY-MM-DD'),202,27500000);
insert into sales values(to_char(sysdate-5,'YYYY-MM-DD'),250,32000000);
insert into sales values(to_char(sysdate-4,'YYYY-MM-DD'),161,17800000);
insert into sales values(to_char(sysdate-3,'YYYY-MM-DD'),125,13500000);
insert into sales values(to_char(sysdate-2,'YYYY-MM-DD'),142,16000000);
insert into sales values(to_char(sysdate-1,'YYYY-MM-DD'),192,20000000);
insert into sales values(to_char(sysdate,'YYYY-MM-DD'),222,25000000);

insert into rfid values('46796184240',0,0);
insert into rfid values('58902290626',0,0);
insert into rfid values('606252409214',0,0);
insert into rfid values('1021258867022',0,0);
insert into rfid values('252585843365',0,0);

update rfid set use =0;

alter table stock modify(b_num varchar2(35) unique);
select *from stock where b_num='8801121190197';
delete calculate
delete sales
select *from rfid;
select *from sales;
select *from calculate;
select *from stock;
select *from PLACE
select to_char(Sdate,'YYYY-MM-DD'),people,sum from sales;
delete from stock where count=100;
desc stock;

commit