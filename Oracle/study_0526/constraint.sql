--[��������]
--'constraint ��Ī unique'

create table memberTest(
    unq number(9) not null
    ,id varchar2(30) not null
    ,pwd varchar2(100) not null
    ,name varchar2(30) --null ���� ����
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --����� �ú��� ..date
    ,constraint mm_gender_ck check(gender in('M','F'))  --check :'M'�ƴϸ� 'F'�� �;���
    ,constraint mm_unq_pk primary key(unq) --primary ket :������ ����,�˻�(index)���̺� �ø�
    ,constraint mm_id_un unique(id) ); --unique:������ ����
    
--���̺� �ڸ�Ʈ
comment on table memberTest is 'ȸ�����̺�';
--�÷� �ڸ�Ʈ
comment on column memberTest.unq is '������ȣ';
comment on column memberTest.id is '���̵�';

    
create sequence memberTest_seq
    increment by 1 
    start with 1
    maxvalue 9999999;
    
insert into memberTest(unq,id,pwd,name,gender,rdate)
    values(memberTest_seq.nextval,'test1','1111','ȫ�浿','M',sysdate);
insert into memberTest(unq,id,pwd,name,gender,rdate)
    values(memberTest_seq.nextval,'test2','1212','�۸���','F',sysdate);
insert into memberTest(unq,id,pwd,name,gender,rdate)
    values(memberTest_seq.nextval,'test2','2222','������','M',sysdate);
    
create table memberTest2(
    unq number(9) not null primary key
    ,id varchar2(30) not null unique
    ,pwd varchar2(100) not null
    ,name varchar2(30) --null ���� ����
    ,gender char(1) check(gender in('M','F'))    --'M','F'
    ,rdate timestamp   --����� �ú��� ..date
    );

create table memberTest101(
    unq number(9) primary key
    ,id varchar2(30) unique
    ,pwd varchar2(100) not null 
    ,name varchar2(30) unique--null ���� ����
    ,gender char(1) default 'M'check(gender in('M','F'))    --'M','F'
    ,rdate timestamp   --����� �ú��� ..date
    );

--primary key �ߺ� �Ұ�
create table memberTest102(
    unq number(9) primary key
    ,id varchar2(30) primary key --primary key �ߺ� �Ұ�
    ,pwd varchar2(100) not null 
    ,name varchar2(30) unique--null ���� ����
    ,gender char(1) default 'M'check(gender in('M','F'))    --'M','F'
    ,rdate timestamp   --����� �ú��� ..date
    );

--constraint ��Ī primarykey ��ȣ �ȿ��� �ΰ��� primary key ����
create table memberTest103(
    unq number(9) not null
    ,id varchar2(30) not null
    ,pwd varchar2(100) not null
    ,name varchar2(30) not null --null ���� ����
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --����� �ú��� ..date
    ,constraint mm_gender_ck1 check(gender in('M','F'))  --check :'M'�ƴϸ� 'F'�� �;���
    ,constraint mm_unq_pk1 primary key(id,name) --primary ket :������ ����,�˻�(index)���̺� �ø�
);
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(1,'a1','1234','ȣ����','M',sysdate);
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(2,'a2','1234','ȣ����','F',sysdate);
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(3,'a3','1234','ȣ����','F',sysdate);
--���̵�,�̸����� �Ȱ������ primary key�� �ɸ�
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(2,'a2','1234','ȣ����','F',sysdate);
    
insert into memberTest103 (unq,id,pwd,name,gender,rdate)
    values(2,'a2','1234','ȣ����','M',sysdate);

--id, name �� �� ��� �Ȱ������ primary key�� �ɸ� (and�� �����ϸ� ��)
select *from memberTest103;

--primary key �ΰ��� ���°� ���� ����
create table memberTest103(
    unq number(9) not null
    ,id varchar2(30) not null
    ,pwd varchar2(100) not null
    ,name varchar2(30) not null --null ���� ����
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --����� �ú��� ..date
    ,constraint mm_gender_ck1 check(gender in('M','F'))  --check :'M'�ƴϸ� 'F'�� �;���
    ,constraint mm_unq_pk11 primary key(id) --primary ket :������ ����,�˻�(index)���̺� �ø�
    ,constraint mm_unq_pk12 primary key(name)
);

-- constraint ���� primary key �� �� ����� �Ұ�
create table memberTest104(
    id varchar2(30) primary key(id,name)
    ,pwd varchar2(100) not null
    ,name varchar2(30) not null --null ���� ����
    ,gender char(1)    --'M','F'
    ,rdate timestamp   --����� �ú��� ..date
 );
select *from memberTest;