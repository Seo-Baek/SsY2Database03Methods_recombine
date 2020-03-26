-- 3) ���ڿ��� x���� y�� ���̸�ŭ ������ �ִ� �Լ� : substr('���ڿ�', x, y)

-- x  ���� �����̸� ������ ���������� ���۵ȴ�.

select substr('ABCDEFG', 3, 2) from dual;    -- CD

select substr('ABCDEFG', -3, 2) from dual;  -- EF

-- [����] �������� �ֹε�Ϲ�ȣ �߿��� ��������� �����Ͽ� ȭ�鿡 �����ּ���.

select substr('881211-1234567', 1, 6) from dual;


-- 4) �ڸ����� �÷��ִ� �Լ�

-- ���� �ڸ����� �÷��ִ� �Լ� : lpad()

-- ������ �ڸ����� �÷��ִ� �Լ� : rpad()

-- ����) �ѱ��� 2����Ʈ�� ����ؼ� ó���� ��.

select lpad('ABCDEFG', 15, '*') from dual;

select rpad('ABCDEFG', 15, '*') from dual;

-- 5) ���ڸ� �����ִ� �Լ�

-- ���� ���ڸ� �����ִ� �Լ� : ltrim()

-- ������ ���ڸ� �����ִ� �Լ� : rtrim()

select ltrim('goodbye', 'g') from dual;

select rtrim('goodbye', 'e') from dual;


-- 6) ���ڿ��� ��ü�� �ִ� �Լ� : replace()

-- replace('�������ڿ�', '��ü�ɹ��ڿ�', '��ü���ڿ�')

select replace('Java Program', 'Java', 'JSP') from dual;

--[����1] emp ���̺��� �������� 'A' ��� ���ڸ�
-- '$' �� �ٲپ� ȭ�鿡 ����� ������.
select replace(job, 'A', '$') from emp;

--[����2] member ���̺��� ������ '�л�' �� ������
-- '���л�' ���� �ٲپ� ȭ�鿡 �����ּ���.
select replace(job, '�л�', '���л�') from member;

--[����3] member ���̺��� �ּҿ� '�����' ��
-- '����Ư����' �� �ٲپ� ȭ�鿡 ����� ������.
select replace(addr, '�����', '����Ư����') from member;

-- [����4] ������ member ���̺��� ������ '�л�' �� ȸ����
-- ������ '���л�' ���� �����Ͽ� DB�� ������ ����.
update member set job = replace(job, '�л�', '���л�');


-- ���ڿ� ���õ� �Լ���

-- 1) ���밪�� ���ϴ� �Լ� : abs()
select abs(23) from dual;     -- 23
select abs(-23) from dual;    -- 23

-- 2) ���(1), ����(-1), 0�� ��ȯ�� �ִ� �Լ� : sign()
select sign(23) from dual;     -- 1
select sign(23), sign(-23), sign(0) from dual;   -- 1, -1, 0

-- 3) �ݿø��� �� �ִ� �Լ� : round()
select round(0.123) from dual;   -- 0
select round(0.524) from dual;  -- 1

--     �ݿø� �ڸ����� ����.
select round(0.1234567, 6) from dual;   -- 0.123457
select round(2.3423455, 4) from dual;  -- 2.3423

-- 4) �Ҽ��� ���� �ڸ����� �߶󳻴� �Լ� :  trunc()
select trunc(1234.1234567, 0) from dual;    -- 1234
select trunc(1234.1234567, 4) from dual;    -- 1234.1234
select trunc(1234.1234567, -3) from dual;   -- 1000

-- 5) ������ �ø��� �� �ִ� �Լ� : ceil()
select ceil(22.8) from dual;    -- 23
select ceil(22.1) from dual;     -- 23

-- 6) ������ ���ϴ� �Լ� : power()
select power(4, 3) from dual;  -- 64

-- 7) �������� ���ϴ� �Լ� : mod()
select mod(7, 4) from dual;  -- 3

-- 8) �������� ���ϴ� �Լ� : sqrt()
select sqrt(3) from dual;
select sqrt(16) from dual;


-- ���� ����

-- ������ �ȿ� �� �ٸ� �������� �����ϴ� ������.

-- ��� : �켱�� ���� �������� ���� ��, �� ������� ������ �ٱ��� �������� ����.

-- emp ���̺��� �̸��� 'SCOTT' �� ����� �޿����� �� ����
-- �޿��� �޴� ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal > (select sal from emp where ename = 'SCOTT');


-- [����1] emp ���̺��� ��ձ޿����� ���� �޴� �����
-- ���, �̸�, ������, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select empno, ename, job, sal, deptno
from emp
where sal < (select avg(sal) from emp);

-- [����2] emp ���̺��� ����� 7521�� ����� �������� ����,
-- �޿��� 7934�� ������� ���� ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where job = (select job from emp where empno = 7521)
and
sal > (select sal from emp where empno = 7934);


-- [����3] emp ���̺��� �������� 'MANAGER'�� ����� �ּұ޿����� �����鼭,
-- �������� 'CLERK'�� �ƴ� ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where sal < (select min(sal) from emp where job = 'MANAGER')
and
job <> 'CLERK';


-- [����4] �μ���ġ�� 'DALLAS'�� ����� ���, �̸�, �μ���ȣ, �������� ȭ�鿡 �����ּ���.
select empno, ename, deptno, job
from emp
where deptno = (select deptno from dept where loc='DALLAS');


-- [����5] member ���̺� �ִ� ���� ���� �� ���ϸ����� ���� ���� ����
-- ��� ������ ȭ�鿡 �����ּ���.
select *
from member
where mileage = (select max(mileage) from member);


-- [����6] emp ���̺��� 'SMITH'�� ������� �� ���� �޿��� �޴� �����
-- �̸��� �޿��� ȭ�鿡 �����ּ���.
select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');

-- [����7] emp ���̺��� 10�� �μ� �޿��� ��ձ޿����� ���� �޿��� �޴�
-- ������� �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, deptno
from emp
where sal < (select avg(sal) from emp where deptno = 10);

-- [����8] emp ���̺��� 'BLAKE'�� ���� �μ��� �ִ� ������� 
-- �̸��� �Ի����� ȭ�鿡 �����ֵ�, 'BLAKE'�� �����ϰ� ȭ�鿡 �����ּ���.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE')
and ename != 'BLAKE';

-- [����9] emp ���̺��� ��ձ޿����� �� ���� �޴� ������� ���,
-- �̸�, �޿��� ȭ�鿡 �����ֵ�, �޿��� �������� ���� ������ ȭ�鿡 �����ּ���.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;


-- [����10] emp ���̺��� �̸��� 'T" �� �����ϰ� �ִ� ������ ���� �μ���
-- �ٹ��ϰ� �ִ� ����� ����� �̸��� ȭ�鿡 �����ּ���.
select empno, ename, deptno
from emp
where deptno in (select deptno from emp where ename like '%T%');


-- [����11] 'SALES' �μ����� �ٹ��ϰ� �ִ� ������� �μ���ȣ, �̸�, �������� ȭ�鿡 �����ּ���.
select deptno, ename, job
from emp
where deptno = (select deptno from dept where dname = 'SALES');

-- [����12] emp ���̺��� 'KING'���� �����ϴ� ��� ����� 
-- �̸��� �޿�, �����ڸ� ȭ�鿡 �����ּ���.
select ename, sal, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');

-- [����13] emp ���̺��� �ڽ��� �޿��� ��ձ޿����� ����, �̸��� 'S'�ڰ�
-- ���� ����� ������ �μ����� �ٹ��ϴ� ��� ����� ���, �̸�, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
and
deptno in (select deptno from emp where ename like '%S%');


---- [����14] emp ���̺��� ���ʽ��� �޴� ����� �μ���ȣ, �޿��� ���� �����
---- �̸�, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm > 0)
and sal in
(select sal from emp where comm > 0);


-- [����15] products ���̺��� ��ǰ�� �ǸŰ����� �ǸŰ����� ��պ��� 
-- ū ��ǰ�� ����� ȭ�鿡 �����ּ���.
select *
from products
where output_price > (select avg(output_price) from products);


-- [����16] products ���̺� �ִ� �Ǹ� ���ݿ��� ��� ���� �̻��� ��ǰ����� ���ϵ�,
-- ����� ���� �� ������ ���� ū �ݾ��� ��ǰ�� �����ϰ� ����� ���Ͽ� ȭ�鿡 �����ּ���.
select *
from products
where output_price >= (select avg(output_price) from products
where output_price != (select max(output_price) from products));


-- [����17] products ���̺��� ī�װ��� �̸��� '������' ��� �ܾ ���Ե�
-- ī�װ��� ���ϴ� ��ǰ����� ȭ�鿡 �����ּ���.
select *
from products
where category_fk = (select category_code from category where category_name = '������');

-- [����18] member ���̺� �ִ� �� ���� �� ���ϸ����� ���� ���� �ݾ��� ������
-- ������ ���ʽ� ���ϸ��� 5000���� �� �־� ����, ���ϸ���, ���ϸ���+5000����
-- ȭ�鿡 �����ּ���.
select memname, mileage, mileage+5000
from member
where mileage = (select max(mileage) from member);



-- group by ��
-- Ư�� �÷��̳� ���� �������� �ش� ���ڵ带 ��� �ڷḦ ������ �� ���.
-- ������ Ư�� �÷��� �������� ���踦 ���ϴµ� ���� ����.
-- �׷��Լ��� �Բ� ����ϸ� ȿ�������� Ȱ���� ������.

select deptno from emp;

select deptno from emp
group by deptno;

-- emp ���̺��� �μ����� �μ��� �ο��� Ȯ���ϰ� ���� ���
select deptno, count(*)
from emp
group by deptno;

-- emp ���̺��� �μ����� �޿��� �հ踦 ȭ�鿡 ����� �ּ���.
select deptno, sum(sal)
from emp
group by deptno;

-- [����] emp ���̺��� �μ����� �׷��� ��� �μ��� �޿� �հ��
-- �μ��� �ο� ��, �μ��� ��� �޿�, �μ��� �ִ�޿�, �μ��� �ּ� �޿��� 
-- ���Ͽ� ȭ�鿡 �����ּ���.
-- ��, �޿� �հ踦 �������� ������������ �����Ͽ� ȭ�鿡 ������ ��.
select deptno, sum(sal), count(*), avg(sal), max(sal), min(sal)
from emp
group by deptno
order by sum(sal) desc;


-- having ��
-- group by �� ������ ���� ��������
-- group by ���� ����� ������ �־� ������ �� �����.

-- products ���̺��� ī�װ� ���� ��ǰ ������
-- ȭ�鿡 �����ּ���.
select category_fk, count(*)
from products
group by category_fk
having count(*) >= 2;

-- [����1] member ���̺��� ������ ������ �ش� ������ ����
-- �ּ� ���ϸ����� �����ֵ�, ���ϸ����� 0�� ���� �����ϰ�
-- ȭ�鿡 �����ּ���.
select job, min(mileage)
from member
group by job
having min(mileage) <> 0;

--[����2] member ���̺��� ������ ������ ������ ���� ȸ�� ���� �����ֵ�,
-- ȸ�� ���� �� �� �̻��� �������� ������ ȭ�鿡 �����ּ���.
select job, count(*)
from member
group by job
having count(*) > 1;

--[����3] emp ���̺��� �μ���ȣ�� �� �μ��� ���� �ο��� ȭ�鿡 �����ֵ�,
-- �ش� �μ��� ���� �ο��� 4�� �̻��� �μ��� ȭ�鿡 �����ּ���.
select deptno, count(*)
from emp
group by deptno
having count(*) >= 4;


--[����4] emp ���̺��� �������� �޿��Ѿ��� ȭ�鿡 �����ִµ�
-- �޿� �Ѿ��� 5000 �̻��� �������� ȭ�鿡 �����ּ���.
-- ����1) �������� 'SALESMAN' �� �����ϰ� �޿��Ѿ��� ȭ�鿡 ���� �� ��.
-- ����2) �޿��Ѿ��� ������������ �����Ͽ� ������ ��. 
select job, sum(sal)
from emp
where job != 'SALESMAN'
group by job
having sum(sal) >= 5000
order by sum(sal) desc;







