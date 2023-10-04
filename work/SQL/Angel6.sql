create table intro(intro_num number(3) primary key,
intro_name varchar2(20),
intro_blood varchar2(20),
intro_hp varchar2(20),
intro_city varchar2(40),
gaipday date);

commit;

select * from intro;

drop table intro;