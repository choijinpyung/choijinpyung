create sequence no;


create table mymall(num number(5) primary key,
sangpum varchar2(30),
photo varchar2(50),
price number(5),
ipgoday varchar2(20),
writeday date);

commit;

select * from mymall;