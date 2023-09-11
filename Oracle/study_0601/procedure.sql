--[���ν���]
--(1)�����ȣ�� �Է¹޾� �޿��� ����ϴ� ���ν���
-- set serveroutput on; -> sql developer���� dbms ����Ҷ� ���� ������Ѽ� on �������
--���ν����� return�� ���� ->���α׷��� ���������� �����ϴ� ����(ex:������Ʈ,����)
--�Լ��� ���ϰ��� �־���ϱ� ������ ������Ʈ �� ���� �� ��ɼ����� �ϱⰡ ������ ��� ��¹��� ����
--create or replace ->�����ϰ� ���Ŀ� ���α׷��� ���� ���� ����
--���� ���ν��� â���� ���� �� �Ű����� �Է°��� ���� �ְ� ���� -> �ڵ� Ŀ��
--exec ->���ν��� ���
set serveroutput on;
create or replace procedure procTest1
        (v_empno in number)
is 
    v_sal number;
begin
    select sal into v_sal from emp where empno=v_empno;
    dbms_output.put_line(v_empno||'�� �޿��� '||v_sal);
end;
/
exec procTest1(7900);

--(2)�����ȣ�� �Է¹޾� �޿��� 5000���� update ó��
create or replace procedure proc_up_sal
                (v_empno in emp.empno%type)
is
begin
    update emp set sal=5000
                where empno=v_empno;
end;
/
exec proc_up_sal(7839);
--(2.1)�����ȣ�� �޿��� �Է¹޾� update ó��
create or replace procedure proc_up_sal1
                (v_empno in emp.empno%type,
                    v_sal in emp.sal%type)
is
begin
    update emp set sal=v_sal
        where empno=v_empno;
end;
/

exec proc_up_sal1(7839,6500);
select * from emp;
rollback;
--(3)�����ȣ�� �Է¹޾� �� ����� �̸��� �޿��� ����ϴ� ���ν���
create or replace procedure proc_emp_sal
        (v_empno emp.empno%type)
is
    v_sal emp.sal%type;
    v_ename emp.ename%type;
begin
    select ename,sal into v_ename,v_sal from emp
            where empno=v_empno;
    dbms_output.put_line(v_ename||'�� �޿��� '||v_sal||'�Դϴ�');
end;
/

exec proc_emp_sal(7900);

--------------------[Q1]------------------
--�����ȣ�� �Է¹޾� ���� ó���ϴ� ���ν��� ����
create or replace procedure proc_emp_del
                        (v_empno in emp.empno%type)
is
    v_cnt number :=0;
begin
    select count(*) into v_cnt from emp 
                where empno=v_empno;
    if v_cnt = 0 then
        dbms_output.put_line(v_empno||'�� �������� �ʴ� ��ȣ�Դϴ�.');
    else
        delete from emp where empno=v_empno;
        dbms_output.put_line(v_empno||': �����Ϸ�');
    end if;
end;
/
exec proc_emp_del(8011);
select *from emp;
--------------------[Q2]------------------
--�μ� �޿� ������Ʈ - �μ���ȣ�� �Է� �޾� �Ʒ��� �������� updateó��
--deptno 10 ->�޿��� 20% ,deptno 20 ->�޿��� 30%,deptno ->�޿��� 10% ,������ 0%
create or replace procedure proc_up_salQ2
                    (v_deptno in emp.deptno%type)
is
begin
    if
        v_deptno=10 then
        update emp set sal = round(sal*1.2)
        where deptno = v_deptno;
    elsif
        v_deptno=20 then
        update emp set sal = round(sal*1.3)
        where deptno = v_deptno;
    elsif
        v_deptno=30 then
        update emp set sal= round(sal*1.1)
        where deptno = v_deptno;
    end if;
    dbms_output.put_line(v_deptno||'�� �޿� ����Ϸ�');
end;
/
exec proc_up_salQ2(10);
select *from emp;
rollback;
--------------------[Q3]------------------
--�μ����̺� �μ� �߰� �Է� ó��
--����:���� deptno�� �ִ��� üũ - ���� �μ���ȣ�� �����մϴ� ��� �޼���
create or replace procedure proc_dept_inser
    (v_deptno in dept.deptno%type,
     v_dname in dept.dname%type,
     v_loc in dept.loc%type)
is
    v_cnt number;
begin
    select count(*) into v_cnt from dept
            where deptno = v_deptno;
    if v_cnt =0 then
        insert into dept(deptno,dname,loc)
            values (v_deptno,v_dname,v_loc);
        dbms_output.put_line(v_deptno||'�� ���� ó�� �Ǿ����ϴ�.');
    else
        dbms_output.put.line('�̹� ������� �μ���ȣ�Դϴ�.');
    end if;
end;
/