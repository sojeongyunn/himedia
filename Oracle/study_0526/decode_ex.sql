--[Ǯ���1]
--�μ��� �ٸ� �λ�޿� ���
--�μ���ȣ 10�� ����� �޿����� 1.1, 20�� ����� 1.2 �ٸ��μ��� 1.3�� �λ��Ͽ� ���
--�����ȣ,�޿�,�λ�޿�
select 
    empno
    ,ename
    ,sal
    ,decode(deptno,10,sal*1.1
                 ,20,sal*1.2
                 ,sal*1.3) as sal2
    from emp; 
--[Ǯ���2]
--emp ���̺��� �Ʒ��� ���� �����Ͽ� ���
--job => ANALYST:�м���, CLERK:����, MANAGER:������, SALESMAN:�������,PRESIDENT:�����)
select empno
      ,ename
      ,job
      ,decode(job,'ANALYST','�м���'
                 ,'CLERK','����'
                 ,'MANAGER','������'
                 ,'SALESMAN','�������'
                 ,'PRESIDENT','����','��') job2
    from emp;
--[Ǯ���3]
--(decode) ����޿��� 2000���� ������ ��, �׷��� ������ ��
--decode�Լ� �� �տ� �÷��� �Ӹ��ƴ϶� �Լ� �� ���ĵ� �� �� ����
select empno
       ,ename
       ,sal
       ,decode(sign(sal-2000),1,'��'
                             ,-1,'��') sal2
    from emp;

--sign :������� ���(1),����(-1)
select sign(1000) from dual;    --  1
select sign(-199) from dual;    -- -1
       
--[Ǯ���4]
--(decode) ������ �λ�޿�
--job:'ANALYST:sal*1.10,'CLERK':sal*1.15,'ANAGER':sal*1.20
select empno
       ,ename
       ,sal
       ,decode(job,'ANALYST',sal*1.1
                  ,'CLERK',sal*1.15
                  ,'MANAGER',sal*1.2
                  ,'SALESMAN',sal*1.3
                  ,'PRESIDENT',sal*1.4,sal) job2
        from emp;

--[Ǯ���5]
--(decode) 1��~6������ �⵵�� ������� �ش� ���� �Ի��� ��� ���� ����Ͻÿ�.
select count(1) from emp
            where to_char(hiredate,'mm') ='01';
-------------------------------------------------------
select 
    count(decode(to_char(hiredate,'mm'),'01',1)) "1��"
    ,count(decode(to_char(hiredate,'mm'),'02',1)) "2��"
    ,count(decode(to_char(hiredate,'mm'),'03',1)) "3��"
    ,count(decode(to_char(hiredate,'mm'),'04',1)) "4��"
    ,count(decode(to_char(hiredate,'mm'),'05',1)) "5��"
    ,count(decode(to_char(hiredate,'mm'),'06',1)) "6��"
    from emp;
    
select count(*)
      ,count(ename)
      ,count(empno)
    from emp;
    

