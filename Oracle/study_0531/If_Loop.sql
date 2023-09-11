--[loop ��]  -- set serveroutput on; -> dbms ����� �Ϸ��� �־���� ����
set serveroutput on;
declare
    cnt number:=1;
begin
    loop
        dbms_output.put_line(cnt);
        cnt:=cnt +1;
        exit when cnt>10;
    end loop;
end;
/
-----------[�ڹ�]-----------
 do {
    System.out.println(cnt)
    cnt=cnt+1;
 }  while (cnt>10);
----------[for ��]----------
--for i in ���۰�..������ , �������δ� (10..1)�� ���� ���� ,������ for i in reverse
declare
begin
    for i in 1..10
    loop
        dbms_output.put_line(i);
    end loop;
end;
/
------------[���������]------------
--&n -> �Ű����� �Է�
declare
    v_cnt number:=&n;
begin
    for i in 1..9
    loop
        dbms_output.put_line(v_cnt||'*'||i||'='||v_cnt*i);
    end loop;
end;
/
----------[��ü ������ ���]---------
declare
begin
    for i in 2..9 loop
        for j in 1..9 loop
            dbms_output.put_line(i||'*'||j||'='||i*j);
            dbms_output.put_line('');
        end loop;
        dbms_output.put_line('');
    end loop;
end;
/
-------------[while��]-------------
declare 
    v_cnt number:=1;
begin
    while v_cnt<=10 loop
    dbms_output.put_line(v_cnt);
    v_cnt:=v_cnt+1;
    end loop;
end;
/

---------[Ǯ���1]-------
--������� ��� PL/SQL
--(����) �ܺε����ͷ� �����ȣ�� �޾� emp ���̺��� �Ʒ� ���� ���
--(���) �����ȣ :7788 ����� : TOM �޿� 780
declare
    v_empno number:=&empno;
    v_ename varchar2(100);
    v_sal number;
begin
    select ename,sal into v_ename,v_sal
        from emp
        where empno=v_empno;
    dbms_output.put_line('�����ȣ : '||v_empno||
                        ' ����� : '||v_ename||
                        ' �޿� : '||v_sal);
end;
/
---------[Ǯ���2]-------
--�μ����� �Է� PL/SQL
--(����) dept ���̺� ������ �Է��ϱ�(�μ���ȣ/�μ���/�μ���ġ�� �ܺε����� �ޱ�)
--(����) �μ���ȣ�� �μ����� �ߺ�����
--����Ÿ�Կ� ''�� �־����
savepoint sp1;

declare
    v_deptno dept.deptno%type := &p_deptno;
    v_dname dept.dname%type :='&p_dname';
    v_loc dept.loc%type :='&p_loc';
    v_cnt number:=0;
begin
    select count(1) into v_cnt from dept
        where deptno = v_deptno or dname = v_dname;
    if v_cnt = 0 then
        insert into dept values(v_deptno,v_dname,v_loc);
        dbms_output.put_line('�Է¼���');
    else
        dbms_output.put_line('�̹� �ִ� �μ���ȣ �Դϴ�.');
    end if;
end;
/
---------[Ǯ���3]-------
--�μ����� ���� PL/SQL
--(����)dept ���̺� ������ �����ϱ� (�μ���ȣ/�μ���/�μ���ġ�� �ܺε����Ϳ��� �ޱ�)
--(����)�μ���ȣ ���� ����/�μ����� �ߺ� ����
declare
    v_deptno dept.deptno%type := &p_deptno;
    v_dname dept.dname%type :='&p_dname';
    v_loc dept.loc%type :='&p_loc';
    v_cnt number:=0;
begin
    select count(1) into v_cnt from dept
        where deptno = v_deptno;
    if v_cnt=0 then
        dbms_output.put_line('���� ��ȣ�Դϴ�.');
    else
        update dept set dname=v_dname,
                        loc=v_loc
                    where deptno = v_deptno;
        dbms_output.put_line('���� ���� ����!');
    end if;
end;
/
select *from dept;
---------[Ǯ���4]-------
--dept ���̺��� �μ� ����
--(����)emp (���)���̺� ���� �μ��� ������ �����ϸ� �����Ұ�
--(ó��) 1. �ܺο��� ������ �μ���ȣ ����
--2.dept ���̺� �μ���ȣ�� ���� ���� üũ
--3.emp ���̺� �Ҽ������� �������� üũ
--4. ����ó��
declare
    v_deptno dept.deptno%type := &p_deptno;
    v_cnt number :=0;
begin
    select count(1) into v_cnt from dept
        where deptno = v_deptno;
    if v_cnt=0 then
        dbms_output.put_line('���� �μ���ȣ�Դϴ�.');
    else
        select count(1) into v_cnt from emp
        where deptno =v_deptno;
        if  v_cnt>0 then
                dbms_output.put_line('�Ҽ� ������ �����մϴ�');
        else 
            delete from dept where deptno=v_deptno;
            dbms_output.put_line('�μ��� �����Ǿ����ϴ�');
        end if;
    end if;
end;
/
select *from dept;

---------[Ǯ���5]-------
--���̺��� code��� �÷��� 1�� �������Ѽ� ���� �ֱ�
--���̺� ����
create table test80 (code varchar2(5));

declare
    v_cnt number := 1;
    v_code varchar2(5);
begin
    loop
        v_code :='a'||cnt;
        insert into test80(code) values (v_code);
        v_cnt:=v_cnt+1;
        exit when v_cnt>10;
    end loop;
end;
/
select *from test80;
---------[Ǯ���6]-------
--1���� 100������ ���� �հ�
declare 
    v_hap number :=0;
begin
    for i in 1..100
        loop   v_hap:= v_hap+i;
        end loop;
        dbms_output.put_line('�� : '||v_hap);
end;
/
---------[Ǯ���7]-------
--�޿��λ� (�Ű������� �����ȣ �Է�) ���α׷� �����
--(����) �޿� 0~1000 +100
--  1001~2000�� +110
--  2001~3000�� +120
--  �� �̻� �λ� ����

--p_empno�� �Ű������� �޴¿뵵�θ� ����(���� �ҷ��ͼ� ���Ұ�)
--else �κ� �����ȣ �����Ѵٸ� else ����; 
declare 
    v_empno emp.empno%type:=&p_empno;
    v_cnt number;
    v_sal1 emp.sal%type:=0;
    v_sal2 emp.sal%type:=0;
begin
    select count(1) into v_cnt from emp
    where empno =v_empno;
        
    if v_cnt =0 then
        dbms_output.put_line(v_empno||'�� ���� ��ȣ�Դϴ�.');
    else
        select sal into v_sal1 from emp where empno=v_empno;
            if v_sal1 <1000 then
                v_sal2:=v_sal1+100;
            elsif v_sal1 <= 2000 then
                v_sal2:=v_sal1+110;
            elsif v_sal1 <=3000 then
                v_sal2:=v_sal1+120;
            else
                v_sal2:=v_sal1;
            end if;
            update emp set sal=v_sal2
            where empno = v_empno;
    end if;
end;
/
rollback;
select *from emp;

--��� �߰�
insert into emp(empno,ename,job)
values ((select max(empno)+1 from emp),'HTML1','HTML');