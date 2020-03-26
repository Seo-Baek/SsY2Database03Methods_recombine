-- not : 부정
-- 쿼리문 작성 시 일단 부정이 아닌 긍정의 쿼리문 작성 후
-- 부정의 의미인 not을 붙여주면 된다.

-- emp 테이블에서 담당업무가 MANAGER, CLERK, ANALYST가
-- 아닌 사원의 아번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal
from emp
where job not in ('MANAGER', 'CLERK', 'ANALYST');

-- [문제1] emp 테이블에서 이름에 'S'자가 들어가지 않는
--        사원의 이름을 화면에 보여주세요.
select ename
from emp
where ename not like '%S%';

-- [문제2] emp 테이블에서 부서번호가 10번 부서가 아닌 사원의
--        이름, 담당업무, 부서번호를 화면에 보여주세요.
select ename, job, deptno
from emp
where deptno != 10
order by deptno;

-- [문제3] member 테이블에서 주소가 '서울'이 아닌
--        회원의 모든 정보를 화면에 보여주세요.
select *
from member
where addr not like '서울%';

-- [문제4] products 테이블에서 출고가가 100만원 미만이 아닌
--        제품의 상품명, 출고가를 화면에 보여주세요.
select products_name, output_price
from products
where output_price >= 1000000;


-- 그룹함수
-- 여러 행 또는 테이블 전체에 대하여 함수가 적용되어 
-- 하나의 결과값을 가져오는 함수.
-- 1) avg()     : 평균값을 구하는 함수.
-- 2) count()   : 행의 갯수를 구하는 함수.
--                count() 함수는 null을 무시함.
-- 3) max()     : 최대값을 구하는 함수.
-- 4) min()     : 최소값을 구하는 함수.
-- 5) sum()     : 총합을 구하는 함수.

-- emp 테이블에서 사번을 가지고 있는
-- 모든 사원의 수를 화면에 보여주세요.
select count(empno)
from emp;

-- [문제1] emp 테이블에서 관리자의 수를
--        화면에 보여주세요.
select count(distinct mgr)
from emp;

-- [문제2] emp 테이블에서 보너스를 가진 사원의
--        수를 화면에 보여주세요.
select count(comm)
from emp
where comm != 0;

-- [문제3] emp 테이블에서 모든 SALESMAN의
--        급여 평균과 급여 최고액, 급여 최저액, 급여 합계액을
--        화면에 보여주세요.
select avg(sal) average, max(sal) maxsal, 
       min(sal) minsal, sum(sal) totsal
from emp
where job = 'SALESMAN';

-- [문제4] emp 테이블에서 등록되어 있는 사원 총 수,
--        보너스가 null이 아닌 인원 수, 보너스의 평균, 등록되어 있는
--        부서의 수를 화면에 보여주세요.
select count(empno) "사원수", count(comm) "보너스가있는인원수", 
       avg(comm) "보너스평균", count(distinct deptno) "부서수"
from emp;

select *
from emp;

-- join-on 키워드
-- 테이블과 테이블을 연결하여 특정한 데이터를 얻고자 할 때 사용함.
-- 관계형 데이터베이스는 두 개 이상의 테이블에 정보가 나뉘어져 있음.
-- 중복해서 데이터가 저장되는 것을 방지하기 위함.
-- 사원 테이블에 부서의 상세번호까지 저장한다면
-- 10번부서에 소속된 사원이 3명이므로 부서명과 지역명이 3번 중복하여 저장되게 됨.
-- 이렇게 중복되어 저장된 데이터는 추후 삽입, 수정, 삭제 시 이상 현상이 발생할 수 있음.

-- 이러한 이상 현상이 발생하지 않게 하려면 즉, 데이터가 중복되지 않게 하려면
-- 관계형 데이터베이스에서 두 개 이상의 테이블에 정보를 나누어 저장해두면 된다.
-- 하지만 이렇게 하면 데이터는 중복이 되지 않지만 원하는 정보를 얻으려면
-- 여러 번 질의해야 하는 불편함이 발생함.

-- 예를 들어 SCOTT 사원이 소속되어 있는ㄹ 부서의 이름이 무엇인지 알아보려면
-- 먼저 사원 테이블에서 SCOTT이 소속된 부서번호를 알아낸 후,
-- 부서 테이블에서 해당 부서번호에 대한 부서명을 얻어와야 함.

-- 특정 사원이 소속된 부서명을 알아내기 위해 사원 테이블과 부서 테이블을 넘나드는
-- 것은 무척 번거로운 일이 됨. 
-- 다행히도 SQL에서는 두 개의 테이블을 결합해서 원하는 결과를 얻을 수 있게 하는
-- 조인 이라는 기능을 제공한다.

-- 조인의 종류
--  1) Cross Join
--  2) EQui Join
--  3) Self Join
--  4) Outer Join

--  1) Cross Join
--      두 개 이상의 테이블이 조인될 때 조건이 없이 테이블의 결합이 이루어지는 조인.
--      그렇기 때문에 테이블 전체 행의 전체 컬럼이 조인이 됨.
select *
from emp, dept;

--  2) Equi Join
--      가장 많이 사용하는 조인 방법.
--      조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이
--      일치되는 행을 연결하여 결과를 생성하는 방법
--      두 테이블을 조인하려면 일치되는 공통 컬럼을 사용해야 함.
--      컬럼의 이름이 같으면 혼동이 오기 때문에 컬럼 이름 앞에 테이블 이름을 기술.

-- 사원의 사번, 이름, 담당업무, 부서번호, 부서명, 근무위치를 화면에 보여주세요.
select empno, ename, job, d.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno;

-- emp 테이블에서 이름이 'SCOTT'인 사람의
-- 부서명을 알고 싶은 경우
select ename, dname
from emp e join dept d
on e.deptno = d.deptno
-- where ename = 'SCOTT';
and ename = 'SCOTT'; -- 두 개의 조건이 같은 경우 출력되는 것!

-- [문제1] 부서명이 'RESEARCH'인 사원의 
--        사번, 이름, 급여, 부서명, 근무위치를 화면에 보여주세요.
select empno, ename, sal, dname, loc
from emp e join dept d
on e.deptno = d.deptno
and dname = 'RESEARCH';

-- [문제2] emp 테이블에서 뉴욕에서 근무하는 사원의
--        이름과 급여, 부서번호를 화면에 보여주세요.
select ename, sal, e.deptno
from emp e join dept d
on e.deptno = d.deptno
and loc = 'NEW YORK';

-- [문제3] emp 테이블에서 ACCOUNTING 부서 소속 사원의
--        이름과 담당업무, 입사일, 그리고 부서번호, 부서명을 화면에 보여주세요.
select ename, job, hiredate, d.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
and dname = 'ACCOUNTING';

-- [문제4] emp 테이블에서 담당업무가 'MANAGER'인 사원의 이름과 부서명을 화면에 출력
select ename, dname
from emp e join dept d
on e.deptno = d.deptno
and job = 'MANAGER';

--  3) Self Join
--      하나의 테이블 내에서 조인을 해야 자료를 언들 수 있는데
--      말 그대로 자기 자신과 조인을 맞는 것을 말함.
--      from 절 다음에 테이블 이름을 나란히 두 번 기술을 할 수 없음.
--      따라서 같은 테이블이 하나 더 존재하는 것처럼 생각할 수 있도록
--      테이블에 별칭을 붙여서 사용해야 함.

-- emp테이블의 각 사원별 관리자의 이름을 화면에 출력.
select e1.ename || '의 매니저의 이름은 ' || e2.ename || '입니다.'
from emp e1, emp e2
where e1.mgr = e2.empno;

-- [문제] emp 테이블에서 매니저가 'KING' 인 사원들의
--       이름과 담당업무를 화면에 보여주세요.
select e1.ename, e1.job
from emp e1, emp e2
where e1.mgr = e2.empno
and e2.ename = 'KING';

--  4) Outer Join
--      2개 이상의 테이블이 조인될 때 어느 한 쪽 테이블에는
--      해당하는 데이터가 존재하는데 다른 쪽 테이블에는 데이터가 존재하지 않는 경우
--      그 데이터가 출력되지 않는 문제점을 해결하기 위해 사용되는 조인 기법.
--      정보가 부족한 컬럼의 뒤에 '(+)' 기호를 붙여 사용하면 됨.

select e1.ename || '의 매니저 이름은 ' || e2.ename || '입니다.'
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- [문제] dept 테이블의 40번 부서와 조인할 emp 테이블의
--       부서번호가 없는데 40번 부서 이름도 화면에 출력되도록 해보세요.
--       이름, 부서번호, 부서명을 화면에 보여주도록 하세요.
select e.ename, d.deptno, dname
from emp e , dept d
where e.deptno(+) = d.deptno
order by deptno;

select * from student;

-- 데이터 수정
-- 특정한 레코드의 데이터를 수정하고자 할 때 사용.
--  형식) update 테이블명 set 수정할컬럼 1 = 수정할 내용, 수정할 컬럼2 = 수정할 내용
--        where 기본키컬럼 = '바꿀 투플에 해당하는 키값';
-- primary key가 없으면 중복이 되지 않는 값을 찾으면 된다.
-- 중복이 되는 값을 조건절에 두면 update가 실행될 수 없다.(sql이 찾지 못 함)
update student set saddress = '전라남도 신안군' where shakbun = '20200002';
update student set smajor = '성악과' where shakbun = '20200003';

update student set sphone = '010-9527-7592' where shakbun = '20200005';
update student set sdate =sysdate where shakbun = 20200004;

-- 데이터 삭제
-- 테이블의 특정한 레코드를 삭제할 때 사용.
--  형식) delete from 테입르이름 where 기본키컬럼 = '해당데이터';
delete from student where shakbun = 20200002;

-- dual 테이블
-- 오라클 자체에서 제공해주는 테이블
-- 간단하게 함수를 이용해서 계산, 결과값을 확인할 때 사용하는 테이블
-- 오직 한 행, 한 컬럼만을 담고 있는 테이블
-- 사용 용도 : 특정 테이블을 생성할 필요 없이 함수 또는 계산을 하고 싶은 경우에 사용.

-- 오라클에서 제공해 주는 함수들

--  1) 현재 시스템의 날짜를 구해오는 함수 : sysdate
select sysdate from dual;

--  2) 현재 날짜에서 개월 수를 더해 주는 함수 : add_months(현재날짜)
select add_months(sysdate, 3) from dual;

--  3) 다가올 날짜(요일)을 구해 주는 함수 : next_day()
select next_day(sysdate, '목요일') from dual;

-- 4) 해당 달의 마지막 일 수를 알려주는 함수 : last_day()
select last_day(sysdate) from dual;

-- [문제] 특정한 달의 마지막 일 수를 확인하여 화면에 보여주세요.
select last_day(add_months(sysdate,5)) from dual;

-- 5) 형식에 맞게 문자열로 날짜를 출력하는 함수 : to_char()
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'mm/dd/yyyy') from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;

-- 문자와 관련된 함수들
--  1) 문자열을 연결하는 함수 : concat('문자열1','문자열2')
--                           컬럼명도 가능하나 문자열 두 개까지만 연결 가능
--                           인자로 함수가 들어갈 수 있다.
--     문자열을 연결하는 연산자 : ||
select concat('Hello',' World') from dual;
select concat('안녕','하세요?') from dual;
select '방가'||'방가' from dual;

-- [문제1] emp 테이블에서 결과가 아래와 같이 나타나도록 화면에 보여주세요.
--        결과 : "SCOTT의 담당업무는 ANALYST 입니다."
--select ename || '의 담당업무는 ' || job || '입니다.'
select concat(concat(ename,'의 담당업무는 '),concat(job,'입니다.'))
from emp
where ename = 'SCOTT';

-- [문제2] emp 테이블에서 결과가 아래와 같이 나타나도록 화면에 보여주세요.
--        결과 : "SCOTT의 연봉은 36000 입니다."
select ename || '의 연봉은 ' || sal*12 || '입니다.'
from emp
where ename = 'SCOTT';


-- [문제3] member 테이블에서 결과가 아래와 같이 나타나도록 화면에 보여주세요.
--        결과 : "홍길동 회원의 직업은 학생입니다."
select distinct memname || ' 회원의 직업은 ' || job || '입니다.'
from member
where memname = '홍길동' and job = '학생';

-- 2) 소문자를 대문자로 바꾸어 주는 함수 : upper()
--    대문자를 소문자로 바꾸어 주는 함수 : lower()
select upper('happy day') from dual;
select lower(upper('happy day')) from dual;

-- [문제] emp 테이블에서 사번, 이름, 담당업무를 화면에 보여주세요.
--       단, 담당업무를 소문자로 변경하여 화면에 보여주세요.
select empno, ename, lower(job) from emp;8i

