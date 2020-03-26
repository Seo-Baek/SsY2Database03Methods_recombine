-- View

-- 물리적인 테이블에 근거한 논리적인 가상의 테이블을 말함.
-- View는 실질적으로 데이터를 저장하고 있지 않음.
-- View를 만들면 데이터베이스에 질의 시 실제 테이블에 접근하여
-- 데이터를 불러오게 됨.   (가져와서 보여준다)
-- 간단하게 말한다면 필요한 내용만 추출해서 사용하는 것.
-- 주로 데이터를 조회하는데 가장 많이 사용이 됨.
-- View는 테이블과 유사하며, 테이블처럼 사용이 가능함.
-- View는 데이터를 저장하기 위한 물리적인 공간이 필요가 없음.
-- 테이블과 마찬가지로 select, insert, update, delete 명령이 가능함.

-- View 사용 이유
-- 1) 보안 관리를 위해 사용함.  : 중요함!
--    => 보안 등급에 맞추어 컬럼의 범위를 정하여 조회가 가능하도록 할 수 있음
-- 2) 사용자의 편의성을 위해 사용함.
--    => 검색 조건을 단순화하여 사용할 수 있도록 함.

-- 형식) create view 뷰이름
--             as
--               서브쿼리


CREATE VIEW emp_view
AS
SELECT * FROM emp;

CREATE VIEW emp_view01
AS
SELECT ename, job FROM emp;

SELECT * FROM emp_view01;

-- emp_view라는 view에 데이터를 추가해 보자.
INSERT INTO emp_view VALUES(9000, 'ANGEL', 'SALESMAN', 7698, sysdate, 1250, 0, 30);
SELECT * FROM emp;





