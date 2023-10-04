--emp테이블에서 ename만 조회하시오
select ename from emp;
--emp테이블에서 이름과 직업만 조회하시오
select ename,job from emp;
--emp 테이블 전체조회
select * from emp;
--student테이블 전체조회
select * from student;
--표현식
select name,'지금실습중' from student;
--컬럼 별칭 allias출력
select name "이름",grade as "학년" ,birthday 생일 from student;
--emp에서 사원명, 직업, 입사일자를 조회하시오
select ename "사원명",job as "직업", hiredate 입사일자 from emp;
--DISTINCT:중복된 값을 제거하고 출력하기
--emp에서 직업군을 중복하지 말고 출력하세요
select DISTINCT job "직업군" from emp;
--emp에서 부서번호를 중복없이 출력하세요
select DISTINCT DEPTNO "부서번호" from emp;
--합성연산자: 컬럼을 붙혀서 출력
select name||grade 학년별학생명 from student;
--professor조회
select * from professor;
--하나의 컬럼으로 출력_조인형 님은 정교수 입니다
select name || '님은' || position || '입니다' "교수별 직급" from professor;

--smith님의 job은 clerk 입니다
select ename || '님의' || 'job은' || job || '입니다' "직업" from emp;
--student에서 서진수님의 키는 180cm, 몸무게는 72kg입니다
select name || '님의 ' || '키는' || height || 'cm, 몸무게는 ' || weight || 'kg 입니다.' from student;
--emp에서 내 직업은 salesman 이고 연봉은 ***입니다
select '내 직업은 '|| job || ' 이고 연봉은 ' || sal || '입니다' from emp; 
--정렬
--student에서 학생명 학년 생일을 학생명의 오름차순으로 조회하시오
select name 학생명, grade 학년, birthday 생일 from student order by name asc;--asc는 생략
select name 학생명, grade 학년, birthday 생일 from student order by birthday desc;

--emp에서 사원명,직업,급여를 급여가 낮은사람 순으로 조회하세요
select ename 사원명, job 직업, sal 급여 from emp order by 3 desc;--컬럼번호로도 정렬가능
--emp에서 직업군을 중복없이 출력하고 직업군의 오름차순으로 출력하세요
select distinct job 직업군 from emp order by job;

--산술연산자
--emp에서 sal에 특별보너스 100을 더하여 출력하시오
select ename 사원명,sal 기본급,sal+100 특별보너스 from emp;
--where절 : 조건
--emp에서 10번부서에 근무하는 사람의 사원명, 급여와 부서번호를 출력하세요
select ename 사원명,sal 급여,deptno 부서번호 from emp where deptno=10;
--emp에서 이름이 KING인 사람의 사원명,직업을 조회하시오
select ename 사원명,job 직업 from emp where ename='KING';
--emp에서 급여가 3000이상인 사람의 사원명 급여를 조회하시오
select ename 사원명,sal 급여 from emp where sal>=3000;
--학생테이블에서 키가 180cm이상인 학생명 과 키를 출력하시오
select name 학생명, height 키 from student where height>=180;
--학생테이블 키가 160~180사이인 학생명과 키 출력
select name 학생명, height 키 from student where height between 160 and 180 order by height;
--in(a,b) : a,b만 조회
--emp에서 deptno가 20,30인 사람들의 사원명과 부서번호를 조회
select ename 사원명, deptno 부서번호 from emp where deptno in(20,30);
--null값만 출력
--emp에서 comm이 null인 사람의 이름과 보너스를 출력하시오
select ename 사원명, comm 보너스 from emp where comm is null;
--emp에서 comm이 null이 아닌 사람의 이름과 보너스를 출력하시오
select ename 사원명, comm 보너스 from emp where comm is not null;

--NVL : null값을 0으로 바꾸기_연산이 목적
select ename 사원명 ,nvl(comm,0)보너스 from emp;
--Like 연산자
--학생테이블에서 김씨만 조회하여 모든열을 출력하시오
select * from student where name like '김%';
--학생테이블 총 몇명? 
select count(*) cnt from student;
--emp에서 job이 salesman,manager인 사원명,직업군만 출력하세요(or 와 in 연산자로 출력)
select ename 사원명, job 직업군 from emp where job in('SALESMAN','MANAGER');
select ename 사원명, job 직업군 from emp where job='SALESMAN' or job='MANAGER';

--emp에서 급여가 2000~3000인 사원명,직업군,급여를 출력(and between 연산자)
select ename 사원명, job 직업군, sal 급여 from emp where sal>=2000 and sal<=3000;
select ename 사원명, job 직업군, sal 급여 from emp where sal between 2000 and 3000;

--Q.student 테이블에서 1학년 학생의 학생명,키를 출력하시오(단 키가 작은순..)
select name 학생명, height 키 from student where grade=1 order by height;
--Q.student에서 2학년학생의 학생명 생일 키 몸무게를 출력하시오(단 생일이 빠른사람 순서)
select name 학생명, birthday 생일, height 키, weight 몸무게 from student where grade=2 order by birthday;
--Q.professor에서 교수들의 이름중 조 씨성을 가진 교수의 교수명 직위 입사일자를 출력하시오
select name 교수명, position 직위, hiredate 입사일자 from professor where name like '조%';
--Q.emp에서 사원명,급여,급여*12,보너스,급여총계를 구하시오
select ename 사원명, sal 급여, sal*12,NVL(comm,0) 보너스, sal+NVL(comm,0) 급여총계 from emp;
--Q.emp에서 입사일자가 1982/01/01 이후에 들어온사람의 사원명과 입사일자를 조회하시오(입사일자 순)
select ename 사원명, hiredate 입사일자 from emp where hiredate>='82/01/01' order by hiredate;

--Like % , _언더바 이용해서 특정순번에 있는 글을 출력
--emp에서 사원명이 두번째글자가 a인사람의 사원명 출력
select ename 사원명 from emp where ename like '_A%';

----emp에서 사원명이 2번째글자가 S인사람 또는 3번째글자가 S인 사람 사원명 출력
select ename 사원명 from emp where ename like '_A%' or ename like '__A%';

--날짜 리터럴 ' '반드시 사용
--emp에서 직급이 clerk이고 입사일이 87/05/23 인 사람의 사원명 입사일 구하기
select ename 사원명, hiredate 입사일 from emp where job='CLERK' and hiredate='87/05/23';

--emp에서 매니저이거나 82년 이후 입사자의 사원명, 직업군, 입사일 출력
select ename 사원명, job 직업군, hiredate 입사일 from emp where job='MANAGER' OR hiredate>='82/01/01';

--다중정렬
--student에서 학생의 이름과 키와 몸무게 출력(키는 작은사람부터, 몸무게는 많은사람부터)
select name 학생명,height 키,weight 몸무게 from student where grade=1 order by height asc,weight desc;
--emp에서 급여내림차순 후 다시 이름으로 오름차순_사원번호 사원명 급여
select ename 사원명,empno 사원번호, sal 급여 from emp order by sal desc, ename;

select * from student;
--union 양옆둘중 하나 충족시 출력(중복 제외)
--unionAll 양옆 둘중 하나 충족시 출력
--intersect 양옆 두가지 조건 모두 충족하는 것만 출력

select name,deptno1,deptno2 from student where deptno1=101 union
select name,deptno1,deptno2 from student where deptno2=201;

--Q.gogak point가 30만~50만 고객명과 포인트를 출력하세요(포인트 많은순)
select gname 고객명,point 포인트 from gogak where point between 300000 and 500000 order by point asc;

--Q.emp의 comm의 널을 0으로 바꾸어서 직업이 manager인 사람만 이름과 보너스 출력하시오
select ename 이름,NVL(comm,0) 보너스,job 직업 from emp where job='MANAGER';

--Q.professor 103번 학과 교수들의 이름과 급여,보너스,연봉을 출력하시오
select name 교수명,pay 급여,NVL(bonus,0) 보너스,pay*12+NVL(bonus,0) 연봉 from professor where deptno=103;

--SQL 그룹함수(count,sum,avg)
--count(*) null값 포함,count (컬럼):null값 제외
select count(*),count(hpage) from professor;

select count(bonus),sum(bonus),avg(bonus) from professor;

--max,min
select max(sal),min(sal) from emp;
select max(hiredate),min(hiredate) from emp;

--소수점
--emp 에서 sal 평균
select round(avg(sal),1) from emp;--소수점 1자리
select round(avg(sal),2) from emp;
select round(avg(sal),0) from emp;--반올림
select round(avg(sal),-1) from emp;--10단위
select round(avg(sal),-2) from emp;--100단위

--콘솔에 출력
--현재 날짜를 콘솔에 출력
select sysdate from dual;

--내일 날짜를 콘솔에 출력
select sysdate+1 from dual;

--to_char : 날짜 및 수치데이터를 문자로 변환하기위한 함수
--날짜에서 년도만 추출
select to_char(sysdate,'year')from dual;--영어로 나옴
select to_char(sysdate,'yyyy')from dual;--2023

select to_char(sysdate,'month')from dual;
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')from dual;

--to_char 숫자에도 적용가능하다
select to_char(245692317,'999,999,999')from dual;

--emp
select empno 사원번호,ename 사원명,to_char(hiredate,'yyyy') 년도 from emp;
--emp에서 사원번호,사원명,급여 출력(급여는 천단위 구분기호)
select empno 사원번호,ename 사원명,to_char(sal,'999,999l') 급여 from emp;

--서브쿼리
--쿼리안에 또다른 쿼리담김(KING보다 급여를 많이 받는 사람은?)_2가지 질문..
--서브쿼리가 먼저 수행되어 그 결과를 메인쿼리에 전해주고 그 값을 받아 메인 쿼리가 실행
--서브쿼리 안에는 order by절 못옴 

--emp에서 KING보다 급여많이 받는 사람의 사원명 급여를 구해보자
select ename 사원명, sal 급여 from emp where sal>(select sal from emp where ename='SCOTT');

--emp에서 평균급여보다 많이받는 사람의 사원번호,사원명,급여를 나타내시오
select empno 사원번호,ename 사원명,sal 급여 from emp where sal>(select avg(sal) from emp);

--emp에서 이름이 WARD 인사람의 MGR과 같은값을 가진사람의 목록 출력
select ename 이름,MGR from emp where MGR=(select MGR from emp where ename='WARD');

--emp에서 평균급여보다 많이받는 사람수?
select count(*) from emp where sal>(select avg(sal) from emp);

--서브쿼리 문제
--Q1. emp에서 ADAMS와 같은 직업군을 가진 사람의 이름 연봉 직업군 출력
select ename 이름,sal*12+NVL(comm,0) 연봉, job 직업군 from emp where job=(select job from emp where ename='ADAMS');
--Q2. emp에서 SCOTT와 같은 연봉을 받는 사람의 이름과 연봉출력
select ename 이름,sal*12+NVL(comm,0) 연봉 from emp where sal*12+NVL(comm,0)=(select sal*12+NVL(comm,0) from emp where ename='SCOTT');
--Q3. student에서 제1전공이 일지매 학생과 동일한 학생들의 학생명 제1전공 출력
select name 학생명,deptno1 제1전공 from student where deptno1=(select deptno1 from student where name='일지매');
--Q4. student에서 제1전공이 101인 학과의 평균몸무게보다 몸무게가 많은 학생들의 이름과 몸무게 출력
select name 학생명,weight 몸무게 from student where weight>(select avg(weight) from student where deptno1=101);
--Q5. professor에서 입사일이 김영조 교수보다 나중에 입사한 사람의 이름과 입사일 학과번호를 출력하시오
select name 이름, hiredate 입사일, deptno 학과번호 from professor where hiredate>(select hiredate from professor where name='김영조');

--복습문제
--Q1. emp에서 job종류별로 직업군을 한번씩만 출력해보세요
select distinct job 직업군 from emp;
--Q2.emp테이블에서 사원명이 A나 S로 시작하는 사람만 출력해보세요(사원번호 사원명)
select empno 사원번호,ename 사원명 from emp where ename like 'A%' or ename like 'S%';
--Q3.emp에서 deptno가 10인부서만 출력하시오(사원명 부서번호)
select ename 사원명,empno 사원번호 from emp where deptno=10;
--Q4.emp에서 급여(sal)가 평균보다 더 높은사람만 사원명 급여를 출력하시오
select ename 사원명,sal 급여 from emp where sal>(select avg(sal) from emp);
--Q5.scott의 급여와 동일하거나 더 많이 받는사람의 사원명과 급여를 출력하시오
select ename 사원명,sal 급여 from emp where sal>=(select sal from emp where ename='SCOTT');
--Q6.emp에서 hiredate에서 월이 5인 사람만 사원명 입사일자 출력하시오(to_char)
select ename 사원명,hiredate 입사일자 from emp where to_char(hiredate,'mm')='05';

--7/7
--1.테이블 생성
--primary key는 기본키를 의미 not null+unique를 의미한다

--test테이블 
create table test(num number(5) primary key,
name varchar2(20),score number(6,2),birth date);

desc test;--구조보기
select * from test;

--test에 전체데이터 insert
insert into test values(1,'손석구',67.2,'1997-11-11');
--test에 일부데이터 insert
insert into test (num,name) values (2,'강호동');

--insert 에러
--무결성 제약 조건(TIGER.SYS_C008353)에 위배
insert into test values(4,'이영애',68.78,'1989-11-12');

--sysdate 현재날짜 의미
insert into test values(5,'이효리',88.96,sysdate);

--alter
--나이를 저장할 컬럼 추가,무조건 null로 추가
--ALTER TABLE 테이블명 ADD 추가할컬럼명 데이터타입;

alter table test add age number(5);

--주소를 저장할 컬럼을 추가하는데 초기값을 강남구 라고 지정
alter table test add addr varchar2(30) default '강남구';

----SQL 오류: ORA-12899: "TIGER"."TEST"."ADDR" 열에 대한 값이 너무 큼(실제: 185, 최대값: 30)
--insert into test values(4,'이영애',68.78,'1989-11-12',22,'대한민국 가나다라마바사아차타파하 아아아아아아아아아아아아앙아아아아아앙아아아아아아아앙아앙아아아아아아아아아아아앙아아아아);
--주소 저장컬럼 30=>50
--ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입;
alter table test modify addr varchar2(50);

--age 타입을 문자열(10)으로 변경하고 초기값을 20으로 설정하기
--기존 null은 그대로 있고 새로 insert하는것 부터 초기값 들어감
alter table test modify age varchar2(10) default '20';

insert into test (num,name) values (10,'강호동');

--num의 오름차순 출력
select * from test order by num;

--이름의 내림차순 검색
select * from test order by name desc;

--drop
--ALTER TABLE 테이블 DROP COLUMN 삭제할컬럼명
--age라는 컬럼을 삭제
alter table test drop column age;
--addr삭제
alter table test drop column addr;


--컬럼명 변경
--ALTER TABLE 테이블명 RENAME COLUMN OLD컬럼명 TO NEW컬럼명;
--score==>jumsu
alter table test rename column score to jumsu;
--birth==>birthday
alter table test rename column birth to birthday;

--테이블 삭제 test
drop table test;



--시퀀스 생성
--시퀀스 기본으로 생성,1부터 1씩 증가하는 시퀀스 생성됨
create sequence seq1;

--전체시퀀스 확인
select * from seq;

--다음 시퀀스값을 발생 콘솔에 출력
select seq1.nextval from dual;

--현재 마지막 발생한 시퀀스값
select seq1.currval from dual;

--seq1삭제
drop sequence seq1;

--10부터 5씩 증가하는 시퀀스생성-cache값 없애기
create sequence seq2 start with 10 increment by 5 nocache;

--시퀀스 발생
select seq2.nextval from dual;

--시퀀스2 삭제
drop sequence seq2;

--seq1 : 시작값:5 증가값:2 끝값 :30 캐시:no , cycle:y
create sequence seql start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2 시작값은 1 증가값 1 cache:n
create sequence seq2 nocache;
--seq3 시작값은 1 증가값 2 cache:n
create sequence seq3 start with 1 increment by 2 nocache;

--출력
select seq1.nextval,seq2.nextval,seq3.nextval from dual;

--전체삭제
drop sequence seq1;
drop sequence seq2;
drop sequence seq3;

---------------------------------시퀀스 1개생성,테이블 생성
create sequence seq_start nocache;

create table personinfo (num number(5) primary key,
name varchar2(20),
job varchar2(30),
gender varchar2(20),
age number(5),
hp varchar2(20),
birthday date);



--birthday==>ipsaday
alter table personinfo rename column birthday to ipsaday;

--insert
insert into personinfo values (seq_start.nextval,'박병주','엔지니어','남자',22,'010-1234-5678','2023-02-11');
insert into personinfo values (seq_start.nextval,'홍길동','축구선수','남자',31,'010-3456-7890','1984-12-23');
insert into personinfo values (seq_start.nextval,'고릴라','회사원','여자',27,'010-1111-5555','1990-07-21');
insert into personinfo values (seq_start.nextval,'호랑이','간호사','남자',42,'010-2222-4444','2000-04-30');
insert into personinfo values (seq_start.nextval,'다람쥐','축구선수','남자',22,'010-3333-3333','1995-09-27');
insert into personinfo values (seq_start.nextval,'이효리','엔지니어','여자',20,'010-5555-7777','1994-05-22');
insert into personinfo values (seq_start.nextval,'이상순','회사원','남자',37,'010-4444-2222','2000-08-09');
insert into personinfo values (seq_start.nextval,'김선아','간호사','여자',27,'010-3232-4343','1992-06-17');
insert into personinfo values (seq_start.nextval,'유재석','축구선수','남자',32,'010-1212-3434','1989-01-01');
insert into personinfo values (seq_start.nextval,'강호동','회사원','남자',29,'010-8989-7272','1997-09-28');
commit;

--최종인원확인
select count(*) from personinfo;
--조회연습
select * from personinfo order by name asc;
select * from personinfo order by age desc;
select * from personinfo order by 5 asc; --컬럼 번호도가능

select * from personinfo order by gender,age;
select * from personinfo order by gender,name;

select job from personinfo;
select distinct job from personinfo;

--성이 강씨만
select * from personinfo where name like '강%';
--이름이 두번째글자가 효 인사람 
select * from personinfo where name like '_효%';

--핸드폰 마지막 자리가 3333인사람
select * from personinfo where hp like '%3333';

--입사일자가 4월인사람을 출력
select * from personinfo where to_char(IPSADAY,'mm')='04';

--입사년도가 1997년인 사람을 출력
select * from personinfo where to_char(IPSADAY,'yyyy')='1997';

--나이가 20~30사이 출력
select * from personinfo where age between 20 and 30;

--직업이 간호사이거나 축구선수 인사람
select * from personinfo where job in('간호사','축구선수');
select * from personinfo where job='간호사' or job='축구선수';
--직업이 간호사이거나 축구선수가 아닌사람
select * from personinfo where job not in('간호사','축구선수');

--평균나이,소수점 한자리로 구하기
select round(avg(age),1) from personinfo;

--내용수정(update)
--UPDATE 테이블명 SET 컬럼1='변경할데이터' WHERE 컬럼2='데이터값2';
--3번 직업 나이 수정하기, 조건이 없으면 모든 데이터가 수정된다 조건 필수
update personinfo set job='경찰', age=35;
--잘못 수정한 데이터 원래대로 돌리기
rollback;

--3번만
update personinfo set job='경찰', age=35 where num=3;

--고씨이면서 경찰인사람의 젠더를 남자로 수정하기
update personinfo set gender='남자' where name like '고%' and job='경찰';

--num이 8번인 사람의 직업을 교사로 입사일을 2000-12-25 로 수정하시오
update personinfo set ipsaday='2000-12-25', job='교사' where num=8;

commit;

--삭제
--DELETE FROM 테이블명;
-- 5번만 삭제
delete from personinfo where num=5;

--여자중에서 나이가 25세이상만 모두 삭제
delete from personinfo where gender='여자' and age>=25;

--핸드폰을 ***-***-****수정
update personinfo set hp='***-***-****';

rollback;



desc personinfo;

select * from personinfo;

--테이블삭제
--시퀀스 삭제
drop table personinfo;
drop sequence seq_start;

--dept에서 30번 부서를 시애틀로 변경해주세요
update dept set LOC='시애틀' where deptno=30;
--emp테이블 TotalSal열을 하나 추가하시오
alter table emp add TotalSal number(10);
--emp테이블 Totsal sal과 comm을 더한 가격을 수정하시오
update emp set TotalSal=sal+nvl(comm,0);

--cmp에서 WARD 삭제하시오
delete from emp where ename='WARD';
--product 테이블에서 100번을 초코파이로 수정해주세요
update product set p_name='초코파이' where p_code=100;



--Groub by
--professor에서 학과별로 교수들의 평균급여를 출력하시오
select deptno,avg(pay) "평균 급여"
from professor
group by deptno;

--select절에 사용된 그룹함수 이외의 컬럼이나 표현식은 반드시 group by에 사용되어야함
--professor에서 직급별 평균보너스 
select position 직급,avg(NVL(bonus,0)) "평균 보너스"
from professor
group by position;

--student에서 학년별 최고키와 최고몸무게 출력
select grade,max(height) "최고 신장",max(weight) "최고 몸무게"
from student
group by grade;

--교수의 직급별 총 급여와 최고 보너스를 구하시오
select position,sum(pay) "총급여",max(nvl(bonus,0)) "최고 보너스"
from professor
group by position;

--emp에서 동일한 직업끼리의 사원수
select job 직무,count(*) "사원수"
from emp
group by job;

--Having절_조건주고 검색하기_반드시 group by 뒤에...
--emp에서 평균 급여가 2000이상인 부서의 부서번호와 평균급여를 구하시오
--where절은 그룹함수의 비교조건으로 쓸수없다
select deptno, avg(sal) 
from emp
group by deptno
having avg(sal)>2000;

--professor에서 평균급여가 300이상인 학과의 학과번호와 평균급여를 구하시오
select deptno 학과번호, avg(pay) "평균급여"
from professor
where deptno not in(101) 
group by deptno
having avg(pay)>=300
order by deptno desc;

--emp에서 job별로 sal의 평균급여를 구하시오
select distinct job 직업, avg(sal)
from emp
group by job;

--professor에서 직급별 총급여를 구하시오
select position 직급, sum(pay)
from professor
group by position;

--emp에서 직업별 인원수 최대급여 최소급여 출력하세요(job의 오름차순)
select job 직업,count(job),max(sal) "최대급여", min(sal) "최소급여"
from emp
group by job
order by job;

--입사년도 그룹별로 출력(입시년도,인원수,급여평균(소수점 1자리))
select to_char(hiredate,'yyyy')입사년도,count(*) 인원수,round(avg(sal),1) 평균급여
from emp
group by to_char(hiredate,'yyyy')
order by to_char(hiredate,'yyyy');

--Rollup함수
--자동으로 소계/합계 구해주는 함수
--group by절에 주어진 조건으로 소계값을 구해준다
select deptno 학과번호, position 직위, sum(pay) 총급여
from professor
group by position,rollup(deptno);

select deptno 학과번호, position 직위, sum(pay) 총급여
from professor
group by deptno,rollup(position);

--count
select position,count(*),sum(pay)
from professor
group by rollup(position);

--cube함수
--rollup처럼 각소계에 전체 총계까지 구해준다
select deptno,position,count(*),sum(pay)
from professor
group by cube(deptno,position);

--오늘의 총복습
--Q1. emp에서 평균연봉이 2000이상인 부서의 부서번호와 평균급여를 구하시오
select deptno,avg(sal) 
from emp 
group by deptno
having avg(sal)>=2000;
--Q2. emp에서 deptno별 인원수는?
select deptno, count(*) 
from emp
group by deptno;
--Q3.emp에서 job별 인원수를 구하시오(단 인원이 2명이상인곳만 구할것)
select job 직군, count(*) 인원수 
from emp
group by job
having count(*)>=2;

--Q4.emp에서 job별로 급여합계를 구하는데 (president는 제오히ㅏㄹ것) 급여합계가 5000이상만 구하시고 급여합계가 높은것부터 출력하시오
--job 급여총계
select job 직군,sum(sal) 총급여
from emp
where job not in('PRESIDENT') -- PRESIDENT 제외
group by job --job 그룹별로
having sum(sal)>=5000 --급여합계가 5000 이상
order by sum(sal) desc;

--제약조건
--테이블생성
create table sawon(num number(5) CONSTRAINT sawon_pk_num primary key,
name varchar2(20),
gender varchar2(10),
buseo varchar2(20) CONSTRAINT sawon_ck_buseo check(buseo in('홍보부','인사부','교육부')),
pay number(10) default 2000000);

select * from sawon;

--시퀀스생성
create sequence seq_sawon nocache;

--데이터 10정도 insert
--체크 제약조건(TIGER.SAWON_CK_BUSEO)이 위배되었습니다
--insert into sawon values(seq_sawon.nextval,'이영미','여자','게임개발부',3500000);
insert into sawon values(seq_sawon.nextval,'이영미','여자','교육부',3500000);
insert into sawon values(seq_sawon.nextval,'김영철','남자','인사부',3700000);
insert into sawon values(seq_sawon.nextval,'이건희','남자','홍보부',3200000);
insert into sawon values(seq_sawon.nextval,'윤영철','남자','인사부',3700000);
insert into sawon values(seq_sawon.nextval,'전소미','여자','교육부',3500000);
insert into sawon values(seq_sawon.nextval,'신영미','여자','인사부',3700000);
insert into sawon values(seq_sawon.nextval,'윤건영','여자','홍보부',3500000);
insert into sawon values(seq_sawon.nextval,'김남희','남자','홍보부',3700000);
insert into sawon values(seq_sawon.nextval,'이수연','여자','교육부',3500000);
insert into sawon values(seq_sawon.nextval,'홍미나','여자','교육부',3600000);
commit;

--부서별 인원수와 최고급여,최저급여 조회
select distinct buseo 부서,count(*) 인원수,max(pay) 최고급여,min(pay) 최저급여
from sawon
group by buseo;

--위의 쿼리문에서 최고급여,최저급여에 화폐단위 붙히고 3자리 컴마도 나오게 해주세요
select distinct buseo 부서,count(*),to_char(max(pay),'999,999,999') 최고급여,to_char(min(pay),'999,999,999') 최저급여
from sawon
group by buseo;
--성별 인원수와 평균급여를 출력하시오(인원수 뒤에 명 이라고 나오도록 ...)
select gender 성별, count(*)||'명' 인원수 , avg(pay) 평균급여
from sawon
group by gender;
--부서별 인원수와 평균급여를 구하되 인원이 4명 이상인 경우에만 출력하도록 하세요
select buseo 부서, count(*) 인원수 , avg(pay) 평균급여
from sawon
group by buseo
having count(*)>=4;

select * from sawon;


select * from emp;


--7/10
--Q1.emp에서 ename을 empname으로 바꾸세요
alter table emp rename column  ename to empname;
--Q2.gift에서 7번 노트북을 아이패드로 바꾸세요
update gift set gname='아이패드' where gno=7;
--Q3.gift에 10번 아이폰 900001~1000000 한행을 추가하세요
insert into gift values (10,'아이폰',900001,1000000);
--Q4.member에서 1003 서새알 멤버를 삭제하시오
delete from member where no=1003;
--Q5.emp에서 입사일이 82/01/23인 사원의 이름,부서번호,급여를 출력하시오
select empname 이름,deptno 부서번호, sal 급여 from emp where hiredate='82/01/23'; 
--Q6.emp에서 직무별로 최대급여,최소급여,총급여,평균급여를 출력하시오
select job 직무,max(sal) 최대급여,min(sal) 최소급여, sum(sal) 총급여, avg(sal) 평균급여
from emp
group by job;

--Join

--1.emp와 dept 를 조인해서 emp사람들의 부서명을 구해보자
--사원명   부서명

--1
select e.empname,d.dname 
from emp e,dept d
where e.deptno=d.deptno;
--2
select empname,dname --테이블의 고유명일경우 e. d.생략가능
from emp e,dept d
where e.deptno=d.deptno;

--student   와 professor를 조인하여 다음과 같이 출력하시오
--학번    학생명     지도교수명
select studno 학번,s.name 학생명,p.name 지도교수명
from student s,professor p
where s.profno=p.profno;

--학번    학생명     제1전공명
select studno 학번,s.name 학생명,d.dname 제1전공명
from student s,department d
where s.deptno1=d.deptno;

--교수명   직급  학과명
select name 교수명, position 직급, d.dname 학과명
from professor p,department d
where p.deptno=d.deptno;

--사원번호 사원명 근무도시
select empno 사원번호, empname 사원명, d.loc 근무도시
from emp e,dept d
where e.deptno=d.deptno;

--판매테이블
--판매일자  과자명  전체 판매액
select p.p_date 판매일자 ,pd.P_name 과자명, p.p_total 전체판매액
from product pd,panmae p
where pd.p_code=p.p_code;

--primary키와 forign키를 생성한 조인테이블(부모,자식) 만들어보기

--시퀀스
create sequence seq_shop;

--shop테이블(부모)
create table shop(shop_num number(5) primary key,
sangname varchar2(30),color varchar2(20));

--5개의 상품추가
insert into shop values(seq_shop.nextval,'요가매트','pink');
insert into shop values(seq_shop.nextval,'아령','black');
insert into shop values(seq_shop.nextval,'레깅스','beige');
insert into shop values(seq_shop.nextval,'져지','white');
insert into shop values(seq_shop.nextval,'양말','yellow');
commit;

--cart1..상품정보는 shop테이블의 shop_num값을 외부키로 지정
create table cart1(idx number(5) primary key,
shop_num number(5) CONSTRAINT cart_fk_shopnum REFERENCES shop(shop_num),
cnt number(5),guipday date);

--cart2..상품정보는 shop테이블의 shop_num값을 외부키로 지정
--부모테이블의 상품을 지우면 그 상품과 연결된 카트를 자동으로 지워준다
create table cart2(idx number(5) primary key,
shop_num number(5) REFERENCES shop(shop_num) on DELETE CASCADE,
cnt number(5),guipday date);

--cart1에 상품추가_1번
insert into cart1 values(seq_shop.nextval,1,2,sysdate);
insert into cart1 values(seq_shop.nextval,3,4,sysdate);
insert into cart1 values(seq_shop.nextval,2,5,sysdate);
insert into cart1 values(seq_shop.nextval,4,6,sysdate);
insert into cart1 values(seq_shop.nextval,5,1,sysdate);

--cart2에 상품추가
insert into cart2 values(seq_shop.nextval,1,3,sysdate);
insert into cart2 values(seq_shop.nextval,3,4,sysdate);
insert into cart2 values(seq_shop.nextval,2,1,sysdate);

--cart1: 부모 1,2,5 존재  cart2: 부모: 1,2,3

--shop의 1번 상품 삭제?
--무결성 제약조건(TIGER.CART_FK_SHOPNUM)이 위배되었습니다- 자식 레코드가 발견되었습니다
delete from shop where shop_num=1;

--cart2에서 3번데이터 지워보자
--on DELETE CASCADE 때문에 제약없이 삭제가 된다
delete from shop where shop_num=3;

--cart1에 담긴상품을 shop테이블과 join해서 자세히 출력
--방법1
select c1.idx,s.shop_num,s.sangname,s.color,cnt,c1.guipday
from shop s,cart1 c1
where s.shop_num=c1.shop_num;

--방법2
select idx,s.shop_num,sangname,color,cnt,guipday
from shop s,cart1 c1
where s.shop_num=c1.shop_num;

--부모테이블
--menu 테이블명
--m_num: 기본키
--m_name: 음식명
--price: 가격
create sequence seq_menu;

drop sequence seq_menu;
create table menu(m_num number(5) primary key,
m_name varchar2(30),price number(10));

drop table menu;
insert into menu values(seq_menu.nextval,'치킨',20000);
insert into menu values(seq_menu.nextval,'피자',30000);
insert into menu values(seq_menu.nextval,'초밥',15000);
insert into menu values(seq_menu.nextval,'삼겹살',18000);
insert into menu values(seq_menu.nextval,'김밥',3000);

select * from menu;
--자식테이블(자식테이블에 연결된 부모가 있어도 부모를 삭제할수있으며 부모테이블삭제시 자동으로 자식삭제)
--myOrder 테이블
--o_num: 기본키
--m_num: 외부키
--cnt: 숫자
--o_date: 현재날짜
create table myOrder(o_num number(5) primary key,
m_num number(5) REFERENCES menu(m_num) on delete cascade,
cnt number(5),o_date date); 

insert into myOrder values(seq_menu.nextval,1,1,sysdate);
insert into myOrder values(seq_menu.nextval,2,2,sysdate);
insert into myOrder values(seq_menu.nextval,3,5,sysdate);
insert into myOrder values(seq_menu.nextval,4,4,sysdate);
insert into myOrder values(seq_menu.nextval,5,1,sysdate);

--최종출력
--주문번호      음식명     가격    (원)  개수   (개)   주문일자
select s.m_num 주문번호, m_name 음식명, price 가격,cnt 개수,o_date 주문일자
from menu s,myorder o
where s.m_num=o.m_num;



create table board (bno number(3) CONSTRAINT board_pk_bno primary key,
writer varchar2(20),
suject varchar2(100),
writeday date);

--board에 5개 insert
insert into board values(seq_sawon.nextval,'김선범','안녕하세요',sysdate);
insert into board values(seq_sawon.nextval,'효지니','오늘 만나자',sysdate);
insert into board values(seq_sawon.nextval,'준상이','오늘 난 운동가',sysdate);
insert into board values(seq_sawon.nextval,'피곤한 월욜','졸려죽겠어',sysdate);
insert into board values(seq_sawon.nextval,'둘리','비안오냐',sysdate);
commit;

--answer라는 댓글(자식)
--부모글지우면 자식글 자동삭제되게
create table answer (num number(5) CONSTRAINT answer_pk_num primary key,
bno number(3) CONSTRAINT answer_fk_bno REFERENCES board(bno) on delete cascade,
nickname varchar2(20),content varchar2(30),writeday date);

--원하는 글에 댓글추가하기
insert into answer values(seq_sawon.nextval,14,'영지니','효진아 나 오늘 못나가',sysdate);
insert into answer values(seq_sawon.nextval,15,'후니에용','수연 안녕 간만이다',sysdate);
insert into answer values(seq_sawon.nextval,16,'짱구','부리부리',sysdate);
insert into answer values(seq_sawon.nextval,17,'도라에몽','대나무 헬리콥터~!',sysdate);
insert into answer values(seq_sawon.nextval,18,'영준이형','벌크업 어떻게해요?',sysdate);
rollback;

select * from board;
--join으로 출력
--원글번호      작성자     작성자글       댓글단사람      댓글내용      원글날짜       댓글날짜
select b.bno 원글번호, b.writer 작성자,b.suject 작성자글,a.nickname 댓글단사람, a.content 댓글내용, b.writeday 원글날짜, a.writeday 댓글날짜
from board b,answer a
where b.bno=a.bno;

--14번 원글
delete from board where bno=14;

--board 를 먼저 삭제
drop table board; --외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다

--자식
drop table answer;

--shop,cart모두 삭제
--외부키로 연결이 된경우 자식테이블 먼저 삭제후 부모테이블 삭제가능
drop table cart1;
drop table cart2;
drop table shop;

drop sequence seq_food; --시퀀스 삭제
create sequence seq_food;

create table food (fno number(10) CONSTRAINT food_fk_fno primary key,
foodname varchar2(20),price number(20),shopname varchar2(30),loc varchar2(20));

drop table food;
insert into food values(seq_food.nextval,'아구찜',35000,'더마니아구','역삼역');
insert into food values(seq_food.nextval,'닭볶음탕',40000,'꼬끼오','삼성역');
insert into food values(seq_food.nextval,'뿌링클',20000,'BHC','강남역');
insert into food values(seq_food.nextval,'고구마피자',35000,'도미노피자','부천역');
insert into food values(seq_food.nextval,'된장찌개',7000,'김밥천국','신도림역');
insert into food values(seq_food.nextval,'꽃게탕',50000,'꽃게랑','교대역');

create table jumun(num number(10) CONSTRAINT jumun_pk_num primary key,
fno number(10) CONSTRAINT jumun_fk_fno REFERENCES food(fno) on delete cascade,
name varchar2(10),addr varchar2(20));

insert into jumun values(seq_food.nextval,1,'김선범','역삼동');
insert into jumun values(seq_food.nextval,2,'김선호','삼성동');
insert into jumun values(seq_food.nextval,3,'김선수','강남구');
insert into jumun values(seq_food.nextval,4,'김선우','심곡동');
insert into jumun values(seq_food.nextval,5,'김선자','문래');
insert into jumun values(seq_food.nextval,6,'김선원','교대학생회관');

select j.fno 주문번호,j.name 주문자,f.foodname 음식명,to_char(f.price,'L999,999') 가격,f.shopname 상호명,f.loc 가게위치, j.addr 주문자주소
from food f,jumun j
where f.fno=j.fno
order by name asc;

commit;
select * from food;

--숙제
create sequence seq_snsboard;
create table snsboard(num number(10) CONSTRAINT b_num primary key,
nick varchar2(10), subject varchar2(20),content varchar2(30),wday date);

select * from snsboard;
insert into snsboard values(seq_snsboard.nextval,'뿡빵이','이거 뭐냐','이렇게 하는거 맞음?',sysdate);
insert into snsboard values(seq_snsboard.nextval,'오둥이','ㅇㅇ','ㅈㄱㄴ',sysdate);
insert into snsboard values(seq_snsboard.nextval,'짱구','님들 숙제머임','ㅈㄱㄴ',sysdate);
insert into snsboard values(seq_snsboard.nextval,'퉁퉁이','숙제 이거임','sql이랑 자바 ㄱㄱ',sysdate);
insert into snsboard values(seq_snsboard.nextval,'훈이','오 이거네','ㄱㅅ ㅋ',sysdate);

commit;

--시퀀스
create sequence seq1;
--테이블 (myinfo)
create table myinfo (num number(5) primary key,name varchar2(20),addr varchar2(30),sdate date);


--테이블 (myshop)
create table myshop (num number(5) primary key,
sangpum varchar2(20),su number(5),price number(5),ipgo date);

select * from myshop;

--숙제
--시퀀스
create sequence seq_stu;
--테이블 (mystudent)
create table mystudent (num number(5) primary key,
stu_name varchar(20),stu_grade varchar(5),hp varchar2(20),addr varchar2(30),
age number(5),sdate date);

select * from sawon;