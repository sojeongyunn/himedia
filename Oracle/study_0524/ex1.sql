--1. 2000�� ���� �Ի��� ����� �����ȣ,�����,�Ի���(0000-00-00)���
select empno,ename,to_char(hiredate,'yyyy-mm-dd') from emp where to_char(hiredate,'yyyy')>2000;
--2. SMITH�� �μ����� ���
select dname from dept where deptno = 
    (select deptno from emp where ename='SMITH');

select (select dname from dept where deptno=emp.deptno) --deptno �� emp.deptno�϶�
    from emp where ename=upper('smith'); --emp.deptno�� smith�� deptno
select (select dname from dept where deptno=emp.deptno) from emp where ename=upper('james');
    
--3. ��ü ��� �����ȣ,����� �μ����� ���
select empno,ename,(select dname from dept where deptno=emp.deptno) as dname from emp;

--4. SMITH�� ���� �μ� ������� ��� ,rownum :smith�� ���������ϰ�� ������ ���⶧���� ������������ ���1���� �������� ����
select *from emp where deptno =
    (select deptno from emp where ename='SMITH' and rownum=1); 

--5. SMITH�� ���� �ִ� �μ��� ��� �޿��� ���
select round(avg(sal),2) as smith_avg from emp where deptno = 
    (select deptno from emp where ename=upper('smith'));

--6. SMITH���� �޿��� ���� �޴� �������� ���
select empno,ename,sal,deptno from emp where sal >=
    (select sal from emp where ename=upper('smith')and rownum=1)order by sal desc;

--7. ��ü ��� �޿����� ���� �޴� �������� ���
select empno,ename,sal,deptno,(select round(avg(sal))from emp) as avg from emp where sal >=
    (select avg(sal) from emp) order by sal desc;
    
select empno,ename,sal,deptno,avg(sal) over() as avg from emp where sal >=
    (select avg(sal) from emp) order by sal desc;    
--8.�޿��� ���帹�� �޴� ����� ����(�����ȣ,�����,�޿�)�� ���
select empno,ename,sal,deptno from emp where sal =
    (select max(sal) from emp where job!=upper('president')); --���� ����