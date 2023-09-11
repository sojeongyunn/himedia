--[�Լ�]--
----------[����1]----------�Ű������� �հ踦 ���Ѵ�
--��Ǹ�(�Ű������� in Ÿ��)
--return number -> ����Ÿ���� �ѹ��� ����
-- is  ����� ������ ����  begin ���α׷� �ڵ�
create or replace function fn_mysum
    (v_num1 in number,v_num2 in number)
return number
is 
    v_sum number;
begin
    v_sum:=v_num1+v_num2;
    return v_sum;
end;
/
select fn_mysum(50,70) from dual;

----------[����2]----------
--�μ���ȣ�� �Է� �޾� �ش� �μ��� �޿� �հ踦 ���ϴ� �Լ�
create function fn_dept_sal_sum 
        (v_deptno in dept.deptno%type) 
return number
is  
    v_sum number;
begin
    select sum(sal) into v_sum from emp
    where deptno= v_deptno;
    return v_sum;
end;
/
select fn_dept_sal_sum(10) from dual;
----------[Ǯ���1]-----------
--�Է��� v_empno�� empno �϶� select �ڿ� �ִ� 
--emp ���̺�ȿ��ִ� sal+comm ���� ������ v_sal ������ ����
--v_sal�� return���� ���� ���

create function fn_emp_sal
            (v_empno in emp.empno%type)
return number
is 
    v_sal number:=0;
begin
    select nvl(sal,0)+nvl(comm,0) into v_sal from emp
    where empno = v_empno;
    return v_sal;
end;
/
select fn_emp_sal(7788) from dual;
----------[Ǯ���2]-----------
--�������� �Է¹޾� �μ����� �˻��ϴ� �Լ��� �ۼ�
-- ù��° select������ deptno���� ������ : 
--�Է��� v_ename�� ���� emp �ȿ��ִ� deptno ���� v_deptno�� ����
-- �ι�° select������ dname�� ���� : 
--���� v_deptno�� ���� dept���̺� �ȿ��ִ� dname �� ���ͼ� v_dname�� ������ v_dname ���
create function fn_dept_name
        (v_ename emp.ename%type)
return varchar2
is
    v_deptno number;
    v_dname dept.dname%type;
begin
    select deptno into v_deptno from emp
        where ename=v_ename;
    select dname into v_dname from dept
    where deptno =v_deptno;
    return v_dname;
end;
/
select fn_dept_name('SCOTT') from dual; 
---[Ǯ���2] join��---
--�Է��� v_ename �� ename���� �ް� emp,dept���̺� �ִ� dname(join������ �޾ƿ�)�� v_dname�� ����
-- v_dname return
create function fn_dept_name_join
        (v_ename emp.ename%type)
return varchar2
is
    v_deptno number;
    v_dname dept.dname%type;
begin
    select 
        d.dname into v_dname from emp e, dept d
    where 
        e.deptno =d.deptno
        and e.ename = v_ename;
    return v_dname;
end;
/
select fn_dept_name_join('SCOTT') from dual;
-----------[����3]-------------
--�������� �Է¹޾� �μ���ȣ,�μ���,��ġ ������ �����ϴ� �Լ��� �ۼ�
create function fn_dept_info
        (v_ename emp.ename%type)
        return varchar2
is
    v_deptno number;
    v_dname varchar2(50);
    v_loc dept.loc%type;
    str varchar2(100);
begin 
    select deptno into v_deptno from emp where ename = upper(v_ename);
    select dname,loc into v_dname,v_loc from dept where deptno=v_deptno;
    str := '�μ���ȣ : '||v_deptno||' �μ��̸� : '||v_dname||' ��ġ���� : '||v_loc;
    return str;
end;
/
select fn_dept_info('scott') from dual;
-----------[����4]-------------
--emp ���̺��� ��ü ������ ������ �� ������ ������ �����Ѵ�.
-- �Խ��� -> ��ȭ�鿡 5���� ��� (ex:16��/4page ->17,3)
--unit ����� ���� ���� , tcnt: ��Ż����,tpage:��Ż������
--ù��° select�� emp���̺����� ��Ż ������ ������ �̾ƿ�
--�ι�° select�� �� ������ ������ �Է��� unit ������ ����(�ø��Լ�) ->��Ż�������� ������(into)
create function fn_empPageCnt (unit number)
    return varchar2 
is
    tcnt number;
    tpage number;
    str varchar2(100);
begin 
    select count(1) into tcnt from emp;
    select ceil(tcnt/unit) into tpage from dual;
    str := tcnt||','||tpage;
    return str;
end;
/
select fn_emppagecnt(5) from dual;

-----------[Count(1)]---------
--(1) ������ ĭ �ϳ��� �� *���� ��¦ ����
select count(1) from emp; --16
--(2) *: ��� �÷��� ���� (�ະ�� ��) ���� ���� �÷�(max return)�� ������   --�ӵ��� ����
select count(*) from emp;   --16
--(3)
select count(comm) from emp; --null�� ����
--(4) ��ü�� ä��� �ִ� �÷� ����  -- ��ü�� ä����ִ� �÷� �ϳ��� �� �ӵ��� ���� ����
select count(empno) from emp; -- 16
----------[Ǯ���3]-----------
--�����ȣ�� �Է� �޾� �Ի������ ��´�.
--select fn_periodYear(7788) from emp;
create or replace function fn_emp_periodYear
                    (v_empno in number)
return number
is
    v_year number;
begin
    select to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy') 
        into v_year
        from emp
        where empno = v_empno;
    return v_year;
end;
/
select fn_emp_periodYear(7900) from dual;
----------[Ǯ���4]-----------
--ù��° select �Է��� v_empno�� empno�� �޾Ƽ� mgr(�Ŵ�����ȣ)������ v_mgr ����
--�ι�° select ù��° select���� ������ v_mgr(mgr�ѹ�)�� empno�� �޾Ƽ� ename�� ��������
-- v_ename�� ���� �� ����
create or replace function fn_emp_mgrname
            (v_empno in number)
return varchar2
is
    v_ename varchar2(50);
    v_mgr number;
begin
    select mgr  into v_mgr from emp
        where empno =v_empno;
    select  ename into v_ename from emp
        where empno = v_mgr;
    return v_ename;
end;
/
select fn_emp_mgrname(7900) from dual;

----------[Ǯ���4.1]-----------
-- 7788 -> �Ŵ��� �̸� ���
--(1)sub select
select (select ename from emp where empno=e.mgr) as mgrname
    from emp e
        where empno='7788';
        
--(2)��������
-- e1.ename�� ���� ����� mgr ���� e2.empno�� �Ѿ�� e2.ename ����
--e1.ename = '7788' -> 7788�� mgr =7566 (e1)-> 7566�� empno =7566(e2) ->empno 7566�� ename(e2)
select  e2.ename
    from emp e1, emp e2
where e1.mgr = e2.empno
    and e1.empno ='7788';

--------e1(���������)------e2(�Ŵ���������)---
mgr,empno,ename .. =  empno,ename,mgr ..
7566,7788,SCOTT    =  7566  JONES 7839
7788,7876,ADAMS    =  7788  SCOTT 7566
7839,7566,JONES    =  7839  KING  null
7902,7369,SMITH    =  7902  FORD  7566
7788,8010,ABC      =  7788  SCOTT 7566