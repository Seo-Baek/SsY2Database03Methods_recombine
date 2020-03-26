-- 3) 문자열을 x부터 y의 길이만큼 추출해 주는 함수 : substr('문자열', x, y)

-- x  값이 음수이면 오른쪽 끝에서부터 시작된다.

select substr('ABCDEFG', 3, 2) from dual;    -- CD

select substr('ABCDEFG', -3, 2) from dual;  -- EF

-- [문제] 여러분의 주민등록번호 중에서 생년월일을 추출하여 화면에 보여주세요.

select substr('881211-1234567', 1, 6) from dual;


-- 4) 자릿수를 늘려주는 함수

-- 왼쪽 자릿수를 늘려주는 함수 : lpad()

-- 오른쪽 자릿수를 늘려주는 함수 : rpad()

-- 주의) 한글은 2바이트씩 계산해서 처리가 됨.

select lpad('ABCDEFG', 15, '*') from dual;

select rpad('ABCDEFG', 15, '*') from dual;

-- 5) 문자를 지워주는 함수

-- 왼쪽 문자를 지워주는 함수 : ltrim()

-- 오른쪽 문자를 지워주는 함수 : rtrim()

select ltrim('goodbye', 'g') from dual;

select rtrim('goodbye', 'e') from dual;


-- 6) 문자열을 교체해 주는 함수 : replace()

-- replace('원본문자열', '교체될문자열', '교체문자열')

select replace('Java Program', 'Java', 'JSP') from dual;

--[문제1] emp 테이블에서 담당업무에 'A' 라는 글자를
-- '$' 로 바꾸어 화면에 출력해 보세요.
select replace(job, 'A', '$') from emp;

--[문제2] member 테이블에서 직업이 '학생' 인 정보를
-- '대학생' 으로 바꾸어 화면에 보여주세요.
select replace(job, '학생', '대학생') from member;

--[문제3] member 테이블에서 주소에 '서울시' 를
-- '서울특별시' 로 바꾸어 화면에 출력해 보세요.
select replace(addr, '서울시', '서울특별시') from member;

-- [문제4] 실제로 member 테이블에서 직업이 '학생' 인 회원의
-- 정보를 '대학생' 으로 변경하여 DB에 저장해 보자.
update member set job = replace(job, '학생', '대학생');


-- 숫자와 관련된 함수들

-- 1) 절대값을 구하는 함수 : abs()
select abs(23) from dual;     -- 23
select abs(-23) from dual;    -- 23

-- 2) 양수(1), 음수(-1), 0을 반환해 주는 함수 : sign()
select sign(23) from dual;     -- 1
select sign(23), sign(-23), sign(0) from dual;   -- 1, -1, 0

-- 3) 반올림을 해 주는 함수 : round()
select round(0.123) from dual;   -- 0
select round(0.524) from dual;  -- 1

--     반올림 자릿수를 지정.
select round(0.1234567, 6) from dual;   -- 0.123457
select round(2.3423455, 4) from dual;  -- 2.3423

-- 4) 소숫점 이하 자릿수를 잘라내는 함수 :  trunc()
select trunc(1234.1234567, 0) from dual;    -- 1234
select trunc(1234.1234567, 4) from dual;    -- 1234.1234
select trunc(1234.1234567, -3) from dual;   -- 1000

-- 5) 무조건 올림을 해 주는 함수 : ceil()
select ceil(22.8) from dual;    -- 23
select ceil(22.1) from dual;     -- 23

-- 6) 제곱을 구하는 함수 : power()
select power(4, 3) from dual;  -- 64

-- 7) 나머지를 구하는 함수 : mod()
select mod(7, 4) from dual;  -- 3

-- 8) 제곱근을 구하는 함수 : sqrt()
select sqrt(3) from dual;
select sqrt(16) from dual;


-- 서브 쿼리

-- 쿼리문 안에 또 다른 쿼리문이 존재하는 쿼리문.

-- 방법 : 우선은 안쪽 쿼리문을 실행 후, 그 결과값을 가지고 바깥쪽 쿼리문을 실행.

-- emp 테이블에서 이름이 'SCOTT' 인 사원의 급여보다 더 많은
-- 급여를 받는 사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal
from emp
where sal > (select sal from emp where ename = 'SCOTT');


-- [문제1] emp 테이블에서 평균급여보다 적게 받는 사원의
-- 사번, 이름, 담당업무, 급여, 부서번호를 화면에 보여주세요.
select empno, ename, job, sal, deptno
from emp
where sal < (select avg(sal) from emp);

-- [문제2] emp 테이블에서 사번이 7521인 사원과 담당업무가 같고,
-- 급여가 7934인 사원보다 많은 사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal
from emp
where job = (select job from emp where empno = 7521)
and
sal > (select sal from emp where empno = 7934);


-- [문제3] emp 테이블에서 담당업무가 'MANAGER'인 사원의 최소급여보다 적으면서,
-- 담당업무가 'CLERK'은 아닌 사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal
from emp
where sal < (select min(sal) from emp where job = 'MANAGER')
and
job <> 'CLERK';


-- [문제4] 부서위치가 'DALLAS'인 사원의 사번, 이름, 부서번호, 담당업무를 화면에 보여주세요.
select empno, ename, deptno, job
from emp
where deptno = (select deptno from dept where loc='DALLAS');


-- [문제5] member 테이블에 있는 고객의 정보 중 마일리지가 가장 높은 고객의
-- 모든 정보를 화면에 보여주세요.
select *
from member
where mileage = (select max(mileage) from member);


-- [문제6] emp 테이블에서 'SMITH'인 사원보다 더 많은 급여를 받는 사원의
-- 이름과 급여를 화면에 보여주세요.
select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');

-- [문제7] emp 테이블에서 10번 부서 급여의 평균급여보다 적은 급여를 받는
-- 사원들의 이름, 급여, 부서번호를 화면에 보여주세요.
select ename, sal, deptno
from emp
where sal < (select avg(sal) from emp where deptno = 10);

-- [문제8] emp 테이블에서 'BLAKE'와 같은 부서에 있는 사원들의 
-- 이름과 입사일을 화면에 보여주되, 'BLAKE'는 제외하고 화면에 보여주세요.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE')
and ename != 'BLAKE';

-- [문제9] emp 테이블에서 평균급여보다 더 많이 받는 사원들의 사번,
-- 이름, 급여를 화면에 보여주되, 급여가 높은데서 낮은 순으로 화면에 보여주세요.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;


-- [문제10] emp 테이블에서 이름에 'T" 를 포함하고 있는 사원들과 같은 부서에
-- 근무하고 있는 사원의 사번과 이름을 화면에 보여주세요.
select empno, ename, deptno
from emp
where deptno in (select deptno from emp where ename like '%T%');


-- [문제11] 'SALES' 부서에서 근무하고 있는 사원들의 부서번호, 이름, 담당업무를 화면에 보여주세요.
select deptno, ename, job
from emp
where deptno = (select deptno from dept where dname = 'SALES');

-- [문제12] emp 테이블에서 'KING'에게 보고하는 모든 사원의 
-- 이름과 급여, 관리자를 화면에 보여주세요.
select ename, sal, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');

-- [문제13] emp 테이블에서 자신의 급여가 평균급여보다 많고, 이름에 'S'자가
-- 들어가는 사원과 동일한 부서에서 근무하는 모든 사원의 사번, 이름, 급여를 화면에 보여주세요.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
and
deptno in (select deptno from emp where ename like '%S%');


---- [문제14] emp 테이블에서 보너스를 받는 사원과 부서번호, 급여가 같은 사원의
---- 이름, 급여, 부서번호를 화면에 보여주세요.
select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm > 0)
and sal in
(select sal from emp where comm > 0);


-- [문제15] products 테이블에서 상품의 판매가격이 판매가격의 평균보다 
-- 큰 상품의 목록을 화면에 보여주세요.
select *
from products
where output_price > (select avg(output_price) from products);


-- [문제16] products 테이블에 있는 판매 가격에서 평균 가격 이상의 상품목록을 구하되,
-- 평균을 구할 때 가격이 가장 큰 금액인 상품을 제외하고 평균을 구하여 화면에 보여주세요.
select *
from products
where output_price >= (select avg(output_price) from products
where output_price != (select max(output_price) from products));


-- [문제17] products 테이블에서 카테고리의 이름에 '에어컨' 라는 단어가 포함된
-- 카테고리에 속하는 상품목록을 화면에 보여주세요.
select *
from products
where category_fk = (select category_code from category where category_name = '에어컨');

-- [문제18] member 테이블에 있는 고객 정보 중 마일리지가 가장 높은 금액을 가지는
-- 고객에게 보너스 마일리지 5000점을 더 주어 고객명, 마일리지, 마일리지+5000점을
-- 화면에 보여주세요.
select memname, mileage, mileage+5000
from member
where mileage = (select max(mileage) from member);



-- group by 절
-- 특정 컬럼이나 값을 기준으로 해당 레코드를 묶어서 자료를 관리할 때 사용.
-- 보통은 특정 컬럼을 기준으로 집계를 구하는데 많이 사용됨.
-- 그룹함수와 함께 사용하면 효과적으로 활용이 가능함.

select deptno from emp;

select deptno from emp
group by deptno;

-- emp 테이블에서 부서별로 부서의 인원을 확인하고 싶은 경우
select deptno, count(*)
from emp
group by deptno;

-- emp 테이블에서 부서별로 급여의 합계를 화면에 출력해 주세요.
select deptno, sum(sal)
from emp
group by deptno;

-- [문제] emp 테이블에서 부서별로 그룹을 지어서 부서의 급여 합계와
-- 부서별 인원 수, 부서별 평균 급여, 부서별 최대급여, 부서별 최소 급여를 
-- 구하여 화면에 보여주세요.
-- 단, 급여 합계를 기준으로 내림차순으로 정렬하여 화면에 보여줄 것.
select deptno, sum(sal), count(*), avg(sal), max(sal), min(sal)
from emp
group by deptno
order by sum(sal) desc;


-- having 절
-- group by 절 다음에 오는 조건절로
-- group by 절의 결과에 조건을 주어 제한할 때 사용함.

-- products 테이블에서 카테고리 별로 상품 갯수를
-- 화면에 보여주세요.
select category_fk, count(*)
from products
group by category_fk
having count(*) >= 2;

-- [문제1] member 테이블에서 직업의 종류와 해당 직업에 속한
-- 최소 마일리지를 보여주되, 마일리지가 0인 경우는 제외하고
-- 화면에 보여주세요.
select job, min(mileage)
from member
group by job
having min(mileage) <> 0;

--[문제2] member 테이블에서 직업의 종류와 직업에 속한 회원 수를 보여주되,
-- 회원 수가 두 명 이상인 직업군의 정보를 화면에 보여주세요.
select job, count(*)
from member
group by job
having count(*) > 1;

--[문제3] emp 테이블에서 부서번호와 그 부서에 속한 인원을 화면에 보여주되,
-- 해당 부서에 속한 인원이 4명 이상인 부서를 화면에 보여주세요.
select deptno, count(*)
from emp
group by deptno
having count(*) >= 4;


--[문제4] emp 테이블에서 담당업무별 급여총액을 화면에 보여주는데
-- 급여 총액이 5000 이상인 담당업무만 화면에 보여주세요.
-- 조건1) 담당업무가 'SALESMAN' 은 제외하고 급여총액을 화면에 보여 줄 것.
-- 조건2) 급여총액은 내림차순으로 정렬하여 보여줄 것. 
select job, sum(sal)
from emp
where job != 'SALESMAN'
group by job
having sum(sal) >= 5000
order by sum(sal) desc;







