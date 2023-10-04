create table sawon_info(num number(30) primary key,
sawon_name varchar2(50),
sawon_birth varchar2(50),
sawon_gender varchar2(50),
sawon_addr varchar2(100),
sawon_hp varchar2(50),
sawon_position varchar2(50),
sawon_ipsaday varchar2(30));

select * from sawon_info;

insert into sawon_info values(seq1.nextval,'비비','1995-12-12','female','제주','010-4343-1238','사원','2021-06-12');
delete from sawon_info where num=184;
commit;
