-- not : ����
-- ������ �ۼ� �� �ϴ� ������ �ƴ� ������ ������ �ۼ� ��
-- ������ �ǹ��� not�� �ٿ��ָ� �ȴ�.

-- emp ���̺��� �������� MANAGER, CLERK, ANALYST��
-- �ƴ� ����� �ƹ�, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal
from emp
where job not in ('MANAGER', 'CLERK', 'ANALYST');

-- [����1] emp ���̺��� �̸��� 'S'�ڰ� ���� �ʴ�
--        ����� �̸��� ȭ�鿡 �����ּ���.
select ename
from emp
where ename not like '%S%';

-- [����2] emp ���̺��� �μ���ȣ�� 10�� �μ��� �ƴ� �����
--        �̸�, ������, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, job, deptno
from emp
where deptno != 10
order by deptno;

-- [����3] member ���̺��� �ּҰ� '����'�� �ƴ�
--        ȸ���� ��� ������ ȭ�鿡 �����ּ���.
select *
from member
where addr not like '����%';

-- [����4] products ���̺��� ����� 100���� �̸��� �ƴ�
--        ��ǰ�� ��ǰ��, ����� ȭ�鿡 �����ּ���.
select products_name, output_price
from products
where output_price >= 1000000;


-- �׷��Լ�
-- ���� �� �Ǵ� ���̺� ��ü�� ���Ͽ� �Լ��� ����Ǿ� 
-- �ϳ��� ������� �������� �Լ�.
-- 1) avg()     : ��հ��� ���ϴ� �Լ�.
-- 2) count()   : ���� ������ ���ϴ� �Լ�.
--                count() �Լ��� null�� ������.
-- 3) max()     : �ִ밪�� ���ϴ� �Լ�.
-- 4) min()     : �ּҰ��� ���ϴ� �Լ�.
-- 5) sum()     : ������ ���ϴ� �Լ�.

-- emp ���̺��� ����� ������ �ִ�
-- ��� ����� ���� ȭ�鿡 �����ּ���.
select count(empno)
from emp;

-- [����1] emp ���̺��� �������� ����
--        ȭ�鿡 �����ּ���.
select count(distinct mgr)
from emp;

-- [����2] emp ���̺��� ���ʽ��� ���� �����
--        ���� ȭ�鿡 �����ּ���.
select count(comm)
from emp
where comm != 0;

-- [����3] emp ���̺��� ��� SALESMAN��
--        �޿� ��հ� �޿� �ְ��, �޿� ������, �޿� �հ����
--        ȭ�鿡 �����ּ���.
select avg(sal) average, max(sal) maxsal, 
       min(sal) minsal, sum(sal) totsal
from emp
where job = 'SALESMAN';

-- [����4] emp ���̺��� ��ϵǾ� �ִ� ��� �� ��,
--        ���ʽ��� null�� �ƴ� �ο� ��, ���ʽ��� ���, ��ϵǾ� �ִ�
--        �μ��� ���� ȭ�鿡 �����ּ���.
select count(empno) "�����", count(comm) "���ʽ����ִ��ο���", 
       avg(comm) "���ʽ����", count(distinct deptno) "�μ���"
from emp;

select *
from emp;

-- join-on Ű����
-- ���̺�� ���̺��� �����Ͽ� Ư���� �����͸� ����� �� �� �����.
-- ������ �����ͺ��̽��� �� �� �̻��� ���̺� ������ �������� ����.
-- �ߺ��ؼ� �����Ͱ� ����Ǵ� ���� �����ϱ� ����.
-- ��� ���̺� �μ��� �󼼹�ȣ���� �����Ѵٸ�
-- 10���μ��� �Ҽӵ� ����� 3���̹Ƿ� �μ���� �������� 3�� �ߺ��Ͽ� ����ǰ� ��.
-- �̷��� �ߺ��Ǿ� ����� �����ʹ� ���� ����, ����, ���� �� �̻� ������ �߻��� �� ����.

-- �̷��� �̻� ������ �߻����� �ʰ� �Ϸ��� ��, �����Ͱ� �ߺ����� �ʰ� �Ϸ���
-- ������ �����ͺ��̽����� �� �� �̻��� ���̺� ������ ������ �����صθ� �ȴ�.
-- ������ �̷��� �ϸ� �����ʹ� �ߺ��� ���� ������ ���ϴ� ������ ��������
-- ���� �� �����ؾ� �ϴ� �������� �߻���.

-- ���� ��� SCOTT ����� �ҼӵǾ� �ִ¤� �μ��� �̸��� �������� �˾ƺ�����
-- ���� ��� ���̺��� SCOTT�� �Ҽӵ� �μ���ȣ�� �˾Ƴ� ��,
-- �μ� ���̺��� �ش� �μ���ȣ�� ���� �μ����� ���;� ��.

-- Ư�� ����� �Ҽӵ� �μ����� �˾Ƴ��� ���� ��� ���̺�� �μ� ���̺��� �ѳ����
-- ���� ��ô ���ŷο� ���� ��. 
-- �������� SQL������ �� ���� ���̺��� �����ؼ� ���ϴ� ����� ���� �� �ְ� �ϴ�
-- ���� �̶�� ����� �����Ѵ�.

-- ������ ����
--  1) Cross Join
--  2) EQui Join
--  3) Self Join
--  4) Outer Join

--  1) Cross Join
--      �� �� �̻��� ���̺��� ���ε� �� ������ ���� ���̺��� ������ �̷������ ����.
--      �׷��� ������ ���̺� ��ü ���� ��ü �÷��� ������ ��.
select *
from emp, dept;

--  2) Equi Join
--      ���� ���� ����ϴ� ���� ���.
--      ���� ����� �Ǵ� �� ���̺��� ���������� �����ϴ� �÷��� ����
--      ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ���
--      �� ���̺��� �����Ϸ��� ��ġ�Ǵ� ���� �÷��� ����ؾ� ��.
--      �÷��� �̸��� ������ ȥ���� ���� ������ �÷� �̸� �տ� ���̺� �̸��� ���.

-- ����� ���, �̸�, ������, �μ���ȣ, �μ���, �ٹ���ġ�� ȭ�鿡 �����ּ���.
select empno, ename, job, d.deptno, dname, loc
from emp e join dept d
on e.deptno = d.deptno;

-- emp ���̺��� �̸��� 'SCOTT'�� �����
-- �μ����� �˰� ���� ���
select ename, dname
from emp e join dept d
on e.deptno = d.deptno
-- where ename = 'SCOTT';
and ename = 'SCOTT'; -- �� ���� ������ ���� ��� ��µǴ� ��!

-- [����1] �μ����� 'RESEARCH'�� ����� 
--        ���, �̸�, �޿�, �μ���, �ٹ���ġ�� ȭ�鿡 �����ּ���.
select empno, ename, sal, dname, loc
from emp e join dept d
on e.deptno = d.deptno
and dname = 'RESEARCH';

-- [����2] emp ���̺��� ���忡�� �ٹ��ϴ� �����
--        �̸��� �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, sal, e.deptno
from emp e join dept d
on e.deptno = d.deptno
and loc = 'NEW YORK';

-- [����3] emp ���̺��� ACCOUNTING �μ� �Ҽ� �����
--        �̸��� ������, �Ի���, �׸��� �μ���ȣ, �μ����� ȭ�鿡 �����ּ���.
select ename, job, hiredate, d.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
and dname = 'ACCOUNTING';

-- [����4] emp ���̺��� �������� 'MANAGER'�� ����� �̸��� �μ����� ȭ�鿡 ���
select ename, dname
from emp e join dept d
on e.deptno = d.deptno
and job = 'MANAGER';

--  3) Self Join
--      �ϳ��� ���̺� ������ ������ �ؾ� �ڷḦ ��� �� �ִµ�
--      �� �״�� �ڱ� �ڽŰ� ������ �´� ���� ����.
--      from �� ������ ���̺� �̸��� ������ �� �� ����� �� �� ����.
--      ���� ���� ���̺��� �ϳ� �� �����ϴ� ��ó�� ������ �� �ֵ���
--      ���̺� ��Ī�� �ٿ��� ����ؾ� ��.

-- emp���̺��� �� ����� �������� �̸��� ȭ�鿡 ���.
select e1.ename || '�� �Ŵ����� �̸��� ' || e2.ename || '�Դϴ�.'
from emp e1, emp e2
where e1.mgr = e2.empno;

-- [����] emp ���̺��� �Ŵ����� 'KING' �� �������
--       �̸��� �������� ȭ�鿡 �����ּ���.
select e1.ename, e1.job
from emp e1, emp e2
where e1.mgr = e2.empno
and e2.ename = 'KING';

--  4) Outer Join
--      2�� �̻��� ���̺��� ���ε� �� ��� �� �� ���̺���
--      �ش��ϴ� �����Ͱ� �����ϴµ� �ٸ� �� ���̺��� �����Ͱ� �������� �ʴ� ���
--      �� �����Ͱ� ��µ��� �ʴ� �������� �ذ��ϱ� ���� ���Ǵ� ���� ���.
--      ������ ������ �÷��� �ڿ� '(+)' ��ȣ�� �ٿ� ����ϸ� ��.

select e1.ename || '�� �Ŵ��� �̸��� ' || e2.ename || '�Դϴ�.'
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- [����] dept ���̺��� 40�� �μ��� ������ emp ���̺���
--       �μ���ȣ�� ���µ� 40�� �μ� �̸��� ȭ�鿡 ��µǵ��� �غ�����.
--       �̸�, �μ���ȣ, �μ����� ȭ�鿡 �����ֵ��� �ϼ���.
select e.ename, d.deptno, dname
from emp e , dept d
where e.deptno(+) = d.deptno
order by deptno;

select * from student;

-- ������ ����
-- Ư���� ���ڵ��� �����͸� �����ϰ��� �� �� ���.
--  ����) update ���̺�� set �������÷� 1 = ������ ����, ������ �÷�2 = ������ ����
--        where �⺻Ű�÷� = '�ٲ� ���ÿ� �ش��ϴ� Ű��';
-- primary key�� ������ �ߺ��� ���� �ʴ� ���� ã���� �ȴ�.
-- �ߺ��� �Ǵ� ���� �������� �θ� update�� ����� �� ����.(sql�� ã�� �� ��)
update student set saddress = '���󳲵� �žȱ�' where shakbun = '20200002';
update student set smajor = '���ǰ�' where shakbun = '20200003';

update student set sphone = '010-9527-7592' where shakbun = '20200005';
update student set sdate =sysdate where shakbun = 20200004;

-- ������ ����
-- ���̺��� Ư���� ���ڵ带 ������ �� ���.
--  ����) delete from ���Ը��̸� where �⺻Ű�÷� = '�ش絥����';
delete from student where shakbun = 20200002;

-- dual ���̺�
-- ����Ŭ ��ü���� �������ִ� ���̺�
-- �����ϰ� �Լ��� �̿��ؼ� ���, ������� Ȯ���� �� ����ϴ� ���̺�
-- ���� �� ��, �� �÷����� ��� �ִ� ���̺�
-- ��� �뵵 : Ư�� ���̺��� ������ �ʿ� ���� �Լ� �Ǵ� ����� �ϰ� ���� ��쿡 ���.

-- ����Ŭ���� ������ �ִ� �Լ���

--  1) ���� �ý����� ��¥�� ���ؿ��� �Լ� : sysdate
select sysdate from dual;

--  2) ���� ��¥���� ���� ���� ���� �ִ� �Լ� : add_months(���糯¥)
select add_months(sysdate, 3) from dual;

--  3) �ٰ��� ��¥(����)�� ���� �ִ� �Լ� : next_day()
select next_day(sysdate, '�����') from dual;

-- 4) �ش� ���� ������ �� ���� �˷��ִ� �Լ� : last_day()
select last_day(sysdate) from dual;

-- [����] Ư���� ���� ������ �� ���� Ȯ���Ͽ� ȭ�鿡 �����ּ���.
select last_day(add_months(sysdate,5)) from dual;

-- 5) ���Ŀ� �°� ���ڿ��� ��¥�� ����ϴ� �Լ� : to_char()
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'mm/dd/yyyy') from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;

-- ���ڿ� ���õ� �Լ���
--  1) ���ڿ��� �����ϴ� �Լ� : concat('���ڿ�1','���ڿ�2')
--                           �÷��� �����ϳ� ���ڿ� �� �������� ���� ����
--                           ���ڷ� �Լ��� �� �� �ִ�.
--     ���ڿ��� �����ϴ� ������ : ||
select concat('Hello',' World') from dual;
select concat('�ȳ�','�ϼ���?') from dual;
select '�氡'||'�氡' from dual;

-- [����1] emp ���̺��� ����� �Ʒ��� ���� ��Ÿ������ ȭ�鿡 �����ּ���.
--        ��� : "SCOTT�� �������� ANALYST �Դϴ�."
--select ename || '�� �������� ' || job || '�Դϴ�.'
select concat(concat(ename,'�� �������� '),concat(job,'�Դϴ�.'))
from emp
where ename = 'SCOTT';

-- [����2] emp ���̺��� ����� �Ʒ��� ���� ��Ÿ������ ȭ�鿡 �����ּ���.
--        ��� : "SCOTT�� ������ 36000 �Դϴ�."
select ename || '�� ������ ' || sal*12 || '�Դϴ�.'
from emp
where ename = 'SCOTT';


-- [����3] member ���̺��� ����� �Ʒ��� ���� ��Ÿ������ ȭ�鿡 �����ּ���.
--        ��� : "ȫ�浿 ȸ���� ������ �л��Դϴ�."
select distinct memname || ' ȸ���� ������ ' || job || '�Դϴ�.'
from member
where memname = 'ȫ�浿' and job = '�л�';

-- 2) �ҹ��ڸ� �빮�ڷ� �ٲپ� �ִ� �Լ� : upper()
--    �빮�ڸ� �ҹ��ڷ� �ٲپ� �ִ� �Լ� : lower()
select upper('happy day') from dual;
select lower(upper('happy day')) from dual;

-- [����] emp ���̺��� ���, �̸�, �������� ȭ�鿡 �����ּ���.
--       ��, �������� �ҹ��ڷ� �����Ͽ� ȭ�鿡 �����ּ���.
select empno, ename, lower(job) from emp;8i

