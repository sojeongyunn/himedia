--[Ʈ�����](transaction)--
-- �۾��׷�
-- ������ �߻� ����
-- Ŀ�԰� Ŀ�� ���̸� ����
-- commit/ rollback/ savepoint
-- (�۾�����)/(�۾����)/(�۾���ġ)
-- insert/ update/ delete
-- create(x)���þ���

create table subject (
title varchar2(100),
price number);

--cmd ȭ�� �α���
-- sqlplus c##java/1234
--desc subject;
--select *from subject;
--���õ� ���ڵ尡 �����ϴ�
--Ŀ�� ��
--select * from subject;

insert into subject values('java',10000);
select *from subject;
commit;
insert into subject values('jsp','30000');
insert into subject values('html','15000');
select *from subject;
rollback;

--Ŀ�� �ϵ��� ����
commit;
rollback;
--Ŀ�� ���Ĵ� �ѹ� �Ұ�

delete from subject where title = 'jsp';
select *from subject;
rollback;

--create�� Ŀ�Ծ��� �ٷ� ����
create table abc(userid varchar2(100) );
rollback;
desc abc;

--save point �׽�Ʈ--
select *from subject;
insert into subject values('a1',1000);
savepoint sp1;
---------�Ʒ����� ����--------
select *from subject;
insert into subject values('a2',2000);
savepoint sp2;
select *from subject;
rollback to sp1;