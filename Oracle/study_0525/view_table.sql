--cmdȯ�濡�� �����ڸ�� ���� (���Ѻο�)
--c:\sqlplus sys/1234 as sysdba
--sql>grant create view to c##java;
--sql>exit

--view���̺�
--�������̺� (������ ���� �������� ����)
--��ȸ������ (������ ����/���� �Ұ�)
--���������� ����� ���̺���

--�� ���̺� ����(�����̺��� ���� v_�� �տ� ����) creat view �����̺� �� as (������)select��
create view v_emp_copy as select *from emp;
select *from v_emp_copy;

create view v_emp_sal_desc as
select b.*from(
    select rownum rn,a.*from(
        select empno,ename,job,sal from emp order by sal desc) a )b;

select *from v_emp_sal_desc where rn>= 6 and rn<=10;

--view ���̺��� ������Ʈ �� �� ����
update v_emp_sal_desc 
        set sal = 6000 
            where ename=upper('king');

update emp set sal = 6000 where ename=upper('king');

--Ǯ���(2)
create view v_research as 
        select 
            d.deptno,d.dname,e.empno,e.ename 
        from 
            dept d, emp e 
        where 
            e.deptno =d.deptno 
        and 
            d.dname=upper('research');