--[���̺� ���� ����]--
--alter ��ɾ�
--rollback���� �ǵ����� ���� (�����Ͱ� �ƴϱ⶧����)
create table subject(
title varchar2(100),
price number);
--���� :title�� ũ�⸦ 200byte�� �缳��
alter table subject modify title varchar2(200);
desc subject;
--�߰� : name ���ڿ�(50byte) �߰� 
alter table subject add name varchar2(50);
desc subject;
--���� : name �÷� ����
alter table subject drop column name;
desc subject;
--�÷��� ���� : alter table ���̺�� rename column ���÷��� to �����÷��� 
alter table subject rename column price to price100;
desc subject;

--[truncate]-- ���̺� �ʱ�ȭ (������ ����) commit ���� ��ɾ �ƴϱ⶧���� rollback �Ұ�
truncate table subject; 
select *from subject;

--[drop]-- ���̺� ����
drop table subject;

