--�����ȣ,�õ�,����,������,��,��,�ǹ���
create table post1(
a1 varchar2(6) ,
a2 varchar2(50),
a3 varchar2(50),
a4 varchar2(50),
a5 varchar2(50),
a6 varchar2(50),
a7 varchar2(50)
);
--�ߺ����� distinct , ���Կ� like, ���Ῥ����||
alter table post1 modify a7 varchar2(100);
truncate table post1; --�����ͻ���
select count(*)from post1; --(1)
select count(*)from post1 where a2 like'%����%'; --(2)
select post1.*from post1 where a2 like'%����%' and rownum<=20; --(3)
select *from post1 where a2 like '%����%' and a3= '���ʱ�'; --(4)
select *from post1 where a4 like '%����%'; --(5)
select distinct(a3) from post1 where a4 like '%����%'; --(6)
select *from post1 where a7 like '%�޼���û%'; --(7)
select distinct(a3) from post1 where a2 like '%�뱸%'; --(8)
select '['||a1||']'||' '||a2||' '||a3||' '||a4||' '||a7 as ����ּ� from post1 
    where a1 like '306762'; --(9)
------(10)------
select *from post1 where a2 like '%����%';
--create talble ���̺�� as select ... : select ������ ��� ���̺� ����
create table post_seoul as select *from post1 where a2 like '%����%';
select count(*)from post_seoul ;

commit;
desc post1;