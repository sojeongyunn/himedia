--1.emp --�������
--2.dept --�μ�����
--3.salgrade --�޿�����

--[�ǽ�]
--1. ������ȣ,�����̸� ���
select empno,ename,job from emp;
--2. ������ȣ,�����̸� rownum����
select rownum,empno, ename, job from emp;
--3. ���� ���
desc emp;
--4. �μ���,�μ��̸� ���
select rownum,deptno,dname from dept;
--5. ������ȣ �����̸� rownum ���� ���
select rownum,empno,ename,job from emp where rownum<6;  --5�� ���
select rownum,empno,ename,job from emp where rownum>=6; --��¾ȵ� (�������� ����)
--6. ������ȣ �����̸� rownum 1���Ͱ� �ƴ� ������� 
select a.*from(select rownum as rn,empno,ename,job from emp) a;-- a: ������ ���̺� ��Ī as�� rn �÷��̸�����
select a.*from(select rownum as rn,empno,ename,job from emp) a where rn>=6;
select a.*from(select rownum as rn,empno,ename,job from emp)a where rn>=3 and rn<=7;
select a.*from(select rownum as rn,empno,ename,job from emp)a where rn>=6 and rn<=10;
--7. ������ȣ,�����̸� rownum 11���� 14���� ������ rownum ����
select rownum,a.*from(select rownum as rn,empno,ename,job from emp)a where rn>=11 and rn<=15;

--8. order by �÷���(asc �Ǵ� desc �� ��������)
select empno,ename,job from emp order by empno asc;
select rownum,empno,ename,job from emp order by empno asc; --order by�� �� ����������
-- ������ �����Ϳ� rownum����
select rownum,a.*from(select empno,ename,job from emp order by empno asc)a; --
--9.������ �����Ϳ� rownum������ rownum ���
select b.*from
(select rownum as rn,a.*from
(select empno,ename,job from emp order by empno asc) a) b; --rownum�� �÷Ÿ����� ����Ҽ� ��� as rn ���� ����

--10.�޿��������� ���� 1��~5��
select b.*from(
select rownum as rn,a.*from 
(select empno,ename,job,sal from emp order by sal desc)a)b where rn>=1 and rn<=5;
--�޿��������� ���� 6~10
select b.*from(
select rownum as rn,a.*from
(select empno,ename,job,sal from emp order by sal desc)a)b where rn>=6 and rn<=10;
--11. between ���
select b.*from(
select rownum as rn,a.*from
(select empno,ename,job,sal from emp order by sal desc)a)b where rn between 6 and 10; --��Ʈ������ ��ȣ�� �� �ӵ��� �����ٴ� ���� ����
--12. IN �Լ�(OR �����ڿ� �����ѱ��)
--(1) �μ���ȣ 10��, 20�� �μ� ������ ���
select empno,ename,deptno from emp where deptno= 10 or deptno=20;   --�ӵ��� �������� ���α׷��������� ����ϱ� �����
select empno,ename,deptno from emp where deptno in(10,20);
select empno,ename,deptno,job from emp 
        where job in(upper('clerk'),upper('analyst'),upper('president'));