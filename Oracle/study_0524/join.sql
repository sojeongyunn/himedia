--ȸ���⺻���� - ���̵�,��ȣ,�̸�,�����,����
--ȸ�������� - ���̵�,�ڵ���,�ּ�,���Ż�ǰ����
--�л�ȸ������ - ���̵�,��������,��������

--1.equal join 
--�����ȣ,����̸�,�μ��̸�
select empno,
       ename,
       dname,
       emp.deptno 
    from emp,dept 
    where 
    emp.deptno=dept.deptno;
--as ��� (�������� ���� ������ ��� as ��������)
select e.empno as empno,
       e.ename ename,
       d.dname dname,
       e.deptno deptno 
    from emp e,dept d 
    where e.deptno = d.deptno;

--2.non-equal join 
--�����ȣ,����̸�,�޿�,���
select e.empno,
       e.ename,
       e.sal,
       s.grade ||'���' grade
    from emp e,salgrade s 
 where e.sal between s.losal and s.hisal;
--3.outer join: ������ �����͸� null������ ����ؼ� ���� ������ �޶�(��Ī�� ���� �ʾƵ�) ��°���
--�����ȣ,����̸�,�μ��̸� (king deptno �����͸� 10-> 70���� ����)
select e.empno empno,
       e.ename ename,
       d.dname dname,
       e.deptno deptno
    from emp e,dept d 
    where e.deptno = d.deptno (+);
--4. self join
--�����ȣ,����̸�,�Ŵ�����ȣ,�Ŵ����̸�
select   a.empno,
         a.ename,
         a.mgr,
         b. ename mgrname
       from emp a,emp b 
       where a.mgr = b.empno;