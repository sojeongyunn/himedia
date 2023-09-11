-- variable : �ܺκ��� ���� , declare : ���κ��� ���� ,":=":���� , 
--begin: ���α׷� ����, end: ���α׷� ���� ,"/": ��ü����

--(1) ��� : ������ �̿��� ���
variable sal number; 
declare  
     v_sal number :=3000; 
begin           
    :sal := v_sal/12;
    end;  
/  
print sal;  

--(2)��� : dbms�Լ��� �̿��� ���
set serveroutput on;
declare 
    v_sal number(8) :=3000;
    month_sal number(8);
begin
    month_sal:= v_sal/12;
    dbms_output.put_line('�� �޿���'||month_sal);
end;
/
--(3) ���̺�Ÿ�� ����ȭ
--dbms_output.put_line�� �÷����� �������� ��� �Ұ� ���� 
--into�� ���� ���� �Ѱ���
declare
    v_deptno dept.deptno%type;
    v_dname dept.dname%type;
begin   
    select deptno,dname into v_deptno,v_dname
        from dept
            where loc ='BOSTON';
        dbms_output.put_line(v_deptno||'->'||v_dname);
end;
/
--(4) ������ �Է�
declare 
    v_deptno dept.deptno%type :=90;
    v_dname dept.dname%type :='�ѹ���';
    v_loc dept.loc%type :='�λ�';
begin
    insert into dept values(v_deptno,v_dname,v_loc);
end;
/
--[Ǯ���1] :emp ���̺��� �μ���ȣ 10�� �����͵��� ��� �޿��� ���϶�
--into�� round(avg(sal)) �� ���� v_avg�� �Ѱ���
declare 
    v_avg number :=0;
begin
    select round(avg(sal)) into v_avg
        from emp
            where deptno= 10;
    dbms_output.put_line('10�� �μ��� ��� �޿� :'||v_avg||'�Դϴ�.');
end;
/
--[Ǯ���2]:emp ���̺��� �μ���ȣ 10�� ��� comm�ʵ忡 400 ���ϱ� (��, null�� 0���� ó���Ͽ� ����)
savepoint sp1;
declare
    v_comm emp.comm%type :=400;
begin
    update emp
        set comm = nvl(comm,0)+v_comm
        where deptno=10;
end;
/
--(5)�ܺε����� �Է�  "&":�Ű����� , :=&dept_no : dept_no �Ű������� �Է�(�ڹٿ��� Scanner)
declare 
    v_deptno dept.deptno%type :=&dept_no;
    v_dname dept.dname%type;
begin
    select dname into v_dname
    from dept
    where deptno = v_deptno;
    dbms_output.put_line('�μ��� : '|| v_dname);
end;
/
--if�� ���� ���� count�Լ��� ������ 0 �̸� ����,
declare 
    v_deptno number(8) :=&deptno;
    v_dname dept.dname%type;
    v_cnt number :=0;
begin
    select count(*) into v_cnt from dept
    where deptno = v_deptno;
    if v_cnt = 0 then
        dbms_output.put_line('���� �μ���ȣ �Դϴ�.');
    else
        select dname into v_dname
        from dept
        where  deptno=v_deptno;
        dbms_output.put_line('�μ��� : '|| v_dname);
    end if;
end;
/