--1.���̺� : bookinfo
--(1)�÷�1 : code ���ڿ�(20byte)
--(2)�÷�2 : title ���ڿ� (50byte)
--(3)�÷�2 : country ���ڿ�(30byte)


--  �ڵ� ����� �� �ּ� ���� �� �����ؾ���

create table bookinfo ( --(å���� ���̺�) ���̺���� ���� ��ȣȭó����Ŵ
code varchar2(20),      --å�ڵ�
title varchar2(50),     --å����
country varchar2(30));  --å ���Ǳ���

 --���̺� ���� Ȯ��
desc bookinfo;

select * from bookinfo;
--���̺� �÷� �����̶� �� ������ �����ؾ���;
insert into bookinfo(code,title,country) values('j02','jsp','');
insert into bookinfo(code,title) values ('j03','oracle');
insert into bookinfo(code,title,country) values('j04','mysql','usa');
insert into bookinfo(code) values  ('j05');
insert into bookinfo values ('j06','linux','korea');

--count() �Լ�
select count(*) from bookinfo;
select count(code) from bookinfo;
select count(title) from bookinfo;
select count(country) from bookinfo;

--(null) ->�÷� �ʱ�ȭ�� �ȵȻ���(������(������)�� ���� ����)

--Ǯ���  --oracle���� ����� null�� ���Ͻ�;
select * from bookinfo where title='linux';
select * from bookinfo where country is null;
select country from bookinfo;
update bookinfo set code='jo2' where country = korea;
