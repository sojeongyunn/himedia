--decode
--decode(Ŀ����,�񱳰�1,ġȯ��1,�񱳰�2,ġȯ��2,....) -- �񱳰��� ������ else�� ���

select      deptno
            ,dname
            ,decode(deptno,10,'ȸ��',20,'����',30,'����',40,'��ȹ') dname2
       from dept;
       
select deptno
       ,dname
       ,decode(deptno,10,'ȸ��',20,'����',30,'����',40,'��ȹ','����') dname3
     from dept;
     
select ename
       ,sal
       ,deptno
       ,decode(deptno,10,sal*1.1,sal) �λ�޿�
    from emp;     

--Ǯ���1
select ename
       ,deptno
       ,sal
       ,decode(deptno,10,sal*1.1,20,sal*1.2,sal*1.3) �λ�޿� 
       from emp;

--Ǯ���2
select empno
      ,ename
      ,job
      ,decode (job,'ANALYST','�м���'
                ,'CLERK','����'
                ,'MANAGER','������'
                ,'SALESMAN','�������'
                ,'PRESIDENT','�����') jobkor
    from emp;

--Ǯ���3
select e.empno
      ,e.ename
      ,e.sal
      ,decode(s.grade,4,'��',5,'��','��') �޿�����
    from emp e,salgrade s
    where
        e.sal between s.losal and s.hisal
    order by �޿����� asc ;

select empno
       ,ename
       ,sal
       ,case when sal>2000 then '��'
       else '��' end �޿�����
    from emp;
--Ǯ���4
select empno
      ,ename
      ,job
      ,sal
      ,decode(job,'ANALYST',sal*1.10
                 ,'CLERK',sal*1.15
                 ,'MANAGER',sal*1.20,sal) �λ�޿�
      from emp;
--Ǯ���5
select count(*)from(
select 
       ename
       ,hiredate
       ,decode(to_char(hiredate,'mm'),01,'�Ի�'
              ,02,'�Ի�'
              ,03,'�Ի�'
              ,04,'�Ի�'
              ,05,'�Ի�'
              ,06,'�Ի�' 
                ) hire
    from emp)
    where hire is not null;

select count(*)from(
    select  ename
        ,hiredate
        ,case when to_char(hiredate,'mm')<=6 then '�Ի�' 
        else '' end hire
        from emp )
        where hire is not null;
