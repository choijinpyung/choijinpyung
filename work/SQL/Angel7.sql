create table memo(num number(3) primary key,
writer varchar2(20),
story varchar2(100),
avata varchar2(50),
writeday date);

select * from memo;
drop table memo;
delete from memo where num=132;
commit;

insert into memo values(seq1.nextval,'오태식','꼭 그렇게 다 가져가야만 속이후련했냐!!!!','../image/다운로드/h1.png',sysdate);
insert into memo values(seq1.nextval,'김병진','고맙다 태식아...','../image/다운로드/h2.png',sysdate);
insert into memo values(seq1.nextval,'김양기','해바라기 아줌마 얘기는 들었다 ㅋㅋ','../image/다운로드/h3.png',sysdate);
insert into memo values(seq1.nextval,'이창무','어어...태식아 오랜만이다야...!!','../image/다운로드/h4.png',sysdate);
insert into memo values(seq1.nextval,'양덕자','아~~해 태식아~~ㅋ','../image/다운로드/h5.png',sysdate);