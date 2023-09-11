--���̺� ī��  as �ڿ� ������ -> Ư�� ���̺� �ִ� ������� ī�� 
--         �������� where �� -> �����Ͱ��� �����ʾ� �����ʹ� ī�ǵ��� ���� ,�����Ͱ��� ������ ������ ���� ī��
create table emp101 
            as select empno,ename,job from emp where 1=2;

create table emp102 
            as select empno,ename,job from emp;
create table goods (code varchar2(20),name varchar2(20) );
    
-----------------[Ǯ���]-----------------
--1. �����ȣ 1001,1002,1003 -> insert �� max ���
--�߰��� ������ �ҽǽ� ����� ���̺��� �����Ͱ� �������� ���� ���� ->���� ���� �ڵ�
insert into emp101 (empno,ename,job) 
        values((select nvl(max(empno),1000)+1 from emp101),'a1','aa');

select * from emp101;

--2. �����ȣ 1001,1002,1003 -> insert �� ������ (������) ���
--������ : �߰� �����͸� �ҽ��ص� ä���� �ʱ⶧���� ����ũ�� ���� ���� 
--      -> ���̺��� ����Ǿ����� �߰����� �ҽǵǵ� ���� Ȯ���� ���� 
create sequence emp102_seq
increment by 1 
start with 1001
maxvalue 999999;
insert into emp102 (empno,ename,job)
    values(emp102_seq.nextval,'b1','bb');
    
select * from emp102;

--3. �����ȣ sm1001,sm1002,sm1003 -> insert �� ������Լ�(������) ���
--ù��° select: max���� ������ �� nvl->�����Ͱ� null�϶� sm1000�� ������
--�ι�° select: ��� substr�� v_code1�� 1000�� �ҷ��ͼ� +1
create or replace function fn_goods_code1
return varchar2
is
    v_code1 varchar2(20);
    v_code2 varchar2(20);
begin
    select nvl(max(code),'sm1000') into v_code1 from goods; 
    select substr(v_code1,3)+1 into v_code1 from dual;
    v_code2 := 'sm'||v_code1;
    return v_code2;
end;
/
insert into goods values (fn_goods_code1(),'a2');
select *from goods;

--4.�����ȣ sm0001,sm0002 ->insert �� ������Լ�(������) ���
--ù��° select�� sm0000�̳� max (sm0000)�� v_code1�� ����
--�ι�° select '1'||0000�� ����ؼ� 10000�� ������ v_code2�� 1���� sm�� ����.
create table goods2 (code varchar2(20),name varchar2(20) );

create or replace function fn_goods_code2
return varchar2
is
    v_code1 varchar2(20);
    v_code2 varchar2(20);
begin
    select nvl(max(code),'sm0000') into v_code1 from goods2; 
    v_code1 :=substr(v_code1,3);
    select ('1'||v_code1)+1 into v_code1 from dual;
    v_code2 := 'sm'||substr(v_code1,2);
    return v_code2;
end;
/
insert into goods2 values (fn_goods_code2(),'a2');

select *from goods2;

------------------
select 10003 +1 from dual; 
select '0003' +1 from dual; 
select 'sm10003' +1 from dual;
select '0003' + 1 from dual;
select ('1'||'0003') +1 from dual;
select 'sm'||substr('10004',2) from dual;