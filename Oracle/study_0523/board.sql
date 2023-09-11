
--[�ϹݰԽ���]   -board1
--������ȣ :unq         ����
--����    :title       ���ڿ� (100byte)
--��ȣ    :pass        ���ڿ�  (100byte)
--�۾���   :name        ���ڿ� (30byte)
--����    :content     ���ڿ�   (4000byte)
--�����   :rdate       ��¥     (������ �ú���)
--��ȸ��   :hit         ����

--primary key :�ߺ��� �� ���� x(�����Ѱ�) -���̺� �� �� �ε��� �ǿ��� Ȯ�ΰ���
create table board1 (
unq number not null primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(30),
content varchar2 (4000),
rdate timestamp,
hit number
);

insert into board1(unq,title,pass,name,content,rdate)
    values(1,'oracle����','1234','ȫ�浿','�ù�11',sysdate);
insert into board1(unq,title,pass,name,content,rdate)
    values(2,'java����','1111','���̺�','�ù�11',sysdate);
insert into board1(unq,title,pass,name,content,rdate)
    values(3,'html����','22225','���׳�','�ù�11',sysdate);

select *from board1;
update board1 set content ='�ù�123' where unq='3';

--1. unq 1���� ����,�̸�,������ ���
select title,name,content from board1 where unq='1';

--2. �̸��� "���׳�"�� �Ǿ� �ִ� �����͸� ���
select *from board1 where name='���׳�';

--3. ��ȣ,����,�̸��� �Ʒ��� �������� ��� ���  --|| :���Ῥ���� , as : �÷��� ������� 
select unq||':'||title||':'||name as title from board1 ;

--4. ����� ������ ���̸� ��� ���;
--oracle����(4) length(content) :content ���� ���
select title||'('||length(content)||')' as title from board1;

savepoint sp0;
--5. ��ȸ���� ��� 1000���� ����
update board1 set hit=1000;
select *from board1;

--6. 2���� ��ȸ���� 1500,3���� ��ȸ���� 2000���� ���� ����
update board1 set hit =1500 where unq='2';
update board1 set hit =2000 where unq='3';
select *from board1;
commit;
--7. �ֽű� ������ ��� rdate ���� ������ȣ�� �����ϴ°� �� �� ��Ȯ��
select *from board1 order by unq desc;

--8. ��ȸ�� ���� ������ ���
select * from board1 order by hit desc;

rollback to sp0;
select * from board1;
--9. ���񿡼� "java"��� �ܾ ����ִ� ������ ��� 
--like :���� ���ڿ� ���� %: �ƹ� ���ڿ͵� �������
--java%: java��� �ܾ�� �����ϴ� ���ڿ� java�ڿ� �ƹ� ���ڳ� �͵� �������
-- '.' :���� �Ѱ�
--'.body%' : body��� �ܾ� �տ� ���� �Ѱ��� �ݵ�� �־���ϰ� �ڿ� �ƹ����ڳ� �͵� �������
select *from board1 where title like '%java%';

--10. unq 3���� ��ȸ���� +100
update board1 set hit =100 where unq='3'; --(x)
update board1 set hit=hit+100 where unq='3'; --(o)