create table myfood(num number(3) primary key,
foodname varchar2(20),foodphoto varchar2(50),
price number(5),cnt number(5));

insert into myfood values(seq_food.nextval,'에그샌드위치','../image/food/1.jpg',8800,2);
insert into myfood values(seq_food.nextval,'꼬치구이','../image/food/2.jpg',12000,3);
insert into myfood values(seq_food.nextval,'망고빙수','../image/food/11.jpg',18000,4);
insert into myfood values(seq_food.nextval,'우엉조림','../image/food/9.jpg',4000,3);
insert into myfood values(seq_food.nextval,'리조또','../image/food/5.jpg',11000,1);

commit;
select * from myfood;

create table shop(num number(3) primary key,
sangpum varchar2(30),
color varchar2(20),
price number(5),imgname varchar(50));

insert into shop values (seq1.nextval,'원피스','white',58000,'../image/쇼핑몰사진/2.jpg');
insert into shop values (seq1.nextval,'슬랙스','blue',77000,'../image/쇼핑몰사진/24.jpg');
insert into shop values (seq1.nextval,'롱원피스','beige',99000,'../image/쇼핑몰사진/28.jpg');
insert into shop values (seq1.nextval,'헤어밴드','purple',25000,'../image/쇼핑몰사진/30.jpg');

commit;

create table myfriend(num number(3) primary key,
fname varchar2(30),fhp varchar2(30),faddr varchar2(50),
gaipday varchar2(30));

insert into myfriend values (seq1.nextval,'김선범','010-2443-2170','경기도 부천시','2010-02-02');
insert into myfriend values (seq1.nextval,'진현규','010-4773-3530','부산시 사상구','2016-04-22');
insert into myfriend values (seq1.nextval,'장순영','010-2743-2650','수원시 권선동','2014-02-08');
insert into myfriend values (seq1.nextval,'오바마','010-5733-8880','경기도 성남시','2011-08-14');
insert into myfriend values (seq1.nextval,'만수르','010-1483-0470','제주시 애월읍','2018-04-31');