CREATE TABLE  DEPT
(
  DEPTNO  NUMBER(2),     -- �μ���ȣ
  DNAME   VARCHAR2(14),  -- �μ��̸�
  LOC     VARCHAR2(13)    -- �μ���ġ
);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  

CREATE TABLE  EMP
(
  EMPNO     NUMBER(4),      -- �����ȣ
  ENAME     VARCHAR2(10),   -- ����̸� 
  JOB       VARCHAR2(9),     -- ���� 
  MGR       NUMBER(4),      -- �Ŵ���
  HIREDATE  DATE,           -- �Ի���
  SAL       NUMBER(7,2),     -- �޿�
  COMM      NUMBER(7,2),    -- �߰��޿�
  DEPTNO    NUMBER(2)      -- �μ���ȣ
);

insert into emp values( 7839, 'KING', 'PRESIDENT', null, to_date('1996-11-17','yyyy-mm-dd'), 5000, null, 10);
insert into emp values( 7698, 'BLAKE', 'MANAGER', 7839, to_date('1991-1-05','yyyy-mm-dd'), 2850, null, 30);
insert into emp values( 7782, 'CLARK', 'MANAGER', 7839, to_date('1999-9-06','yyyy-mm-dd'), 2450, null, 10);
insert into emp values( 7566, 'JONES', 'MANAGER', 7839, to_date('2001-02-04','yyyy-mm-dd'), 2975, null, 20);
insert into emp values( 7788, 'SCOTT', 'ANALYST', 7566, to_date('2003-06-17','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7902, 'FORD', 'ANALYST', 7566, to_date('1981-03-12','yyyy-mm-dd'), 3000, null, 20);
insert into emp values( 7369, 'SMITH', 'CLERK', 7902, to_date('2007-12-1','yyyy-mm-dd'), 800, null, 20);
insert into emp values( 7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','mm-dd-yyyy'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-87', 'dd-mm-yy') - 51, 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','mm-dd-yyyy'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, to_date('2003-1-23','yyyy-mm-dd'), 1300, null, 10);
  
CREATE TABLE salgrade (
grade number,    -- ���
losal number,     -- �����޿�
hisal number );   -- �ְ�޿�

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

--(1)
desc DEPT;
desc emp;
desc salgrade;
--(2)
select *from dept;
select* from emp;
select*from salgrade;

select *from emp where deptno='10'; --(3)
select*from emp where sal>=1500; --(4)
select '1500�� '||grade||'����Դϴ�' as str  --(5)
from salgrade where losal<=1500 and hisal>=1500; --�ο���� ���̻��� ������
select *from emp where mgr is null and job!='PRESIDENT'; --(6)
SELECT *FROM emp WHERE job = upper('president'); --���ڿ��� ��ҹ��ڱ���: upper�� �̿��Ͽ� �빮�ڷ� �Է�
select substr(ename,1,2)||'***' from emp;   --(7)  substr(���ڿ�,���۹�ȣ,��°���)
select rpad(substr(ename,1,2),length(ename),'*') as name from emp; --rpad (���ڿ�,��±���,��¹���)
--rownum(��� ���̺� ���ȣ�� �ٿ� ���)
select rownum,empno,ename from emp; --������̺��� ����Ҽ� �ִ� ���� �÷�(���ȣ�� �ڞ����� ����)
select *from emp where rownum<=5;    --5���� ���
select rownum,emp.* from emp where rownum<=10 ; 

--[���־��̴� �Լ� ����]--
--(1) �ְ�/���� �޿� ����ϱ�
select max(sal) from emp;
select min(sal) from emp;
--(2)�޿��հ�/�޿���� ���
select sum(sal)from emp;
select avg(sal) from emp;
--(3)�ݿø����� ��� -�޿����
select round(avg(sal)) from emp; --����ǥ��
select round(avg(sal),2) from emp; --�Ҽ���2�ڸ����� ǥ��(�������� �ݿø�)
--(4)�ø��Լ�/�����Լ� �����Ͽ� ���
select ceil(avg(sal)) from emp;
select floor(avg(sal)) from emp;
--(5)Ŀ�̼� ���� �����͵��� �̿��Ͽ� �հ�� ����� ���
select sum(comm) from emp; --null���� ������ �հ�
select 1400+500+300 from dual;
select avg(comm)from emp; --ull���� ������ ���
select (1400+500+300)/4 from dual;
--(6)��ü ����� ����ϱ�
select count(*) from emp;
--(7)�������� ����ϱ�
select distinct(job) from emp;

--[Ǯ���]--
select max(sal) from emp where deptno='10'; --(1)
-- 10�� �μ����� �ٹ��ϴ� ����� �� �ְ� �޿����� �̸��� �޿��� ���;
select ename,sal from emp where deptno='10' 
    and sal=(select max(sal) from emp where deptno='10');

select *from emp where sal<=2000 and sal>=1000; --(2)
select *from emp where deptno=10 or deptno=20; --(3)
select count(*)from emp where mgr=7566;--(4)
select count(*)from emp where job=upper('ANALYST');--(5)

select ename,hiredate from emp;--(6)
select ename,to_char(hiredate,'yyyy-mm-dd')as hiredate from emp;

select ename,hiredate from emp where to_char(hiredate,'yyyy')>=2000--(7)
    and to_char(hiredate,'yyyy')<=to_char(sysdate,'yyyy');--�ƴ��� �̷����� ��
--[���� ������]--
select ename||','||job as ��������� from emp;
select ename||','||job as ��������� from emp where rownum<10;
--[IN�Լ�]--
select ename,deptno from emp where deptno=10 or deptno=20;
select ename,deptno from emp where deptno in(10,20);
select ename,sal,deptno from emp where ename in(upper('adams'),upper('ford'));
--[between]--
select deptno,ename from emp where deptno>=10 and deptno<=20;
select deptno,ename from emp where deptno between 10 and 20;
select ename,sal,deptno from emp where sal between 1000 and 1500;

commit;