create sequence seq_1;

create table info(num number(5) primary key,
name varchar2(20),hp varchar2(20),
age number(3),photo varchar2(100));

insert into info values(seq_1.nextval,'홍구','010-7723-2445',20,'../image/jquery_img/c5.png');

commit;

--team

create table team (num number(5) primary key,
name varchar2(20),addr varchar2(50),writeday date);

insert into team values(seq_1.nextval,'뿡뿡이','서울시 구로구',sysdate);

commit;

select * from team;