--������ sequence(�ڵ� ��������,�Ϲ������� ������ȣ ������ ���)
create sequence h_member1_unq_seq
increment by 1  --������ġ
start with 1    --���ۼ�ġ
maxvalue 99999; --������ġ

create table h_member2(
unq number not null primary key,
userid varchar2(20) not null,
pass varchar2(100) not null,
name varchar2(20) not null,
birthday date,    --timestamp
phone varchar2(20));

--nextval ���� �� �߰�
insert into h_member2(unq,userid,pass,name,birthday,phone) 
    values(h_member1_unq_seq.nextval,'hong','1234','ȫ�浿','2010-04-23','');
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'tiger','1111','ȣ����','2010-11-11','010-5555-7777');
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'linux','qwer','�����','2010-08-17','010-2222-1234');
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'java','1212','����','2010-01-02','010-1111-7777');

create table a100(
unq number not null primary key,
title varchar2(20));

insert into a100 (unq,title)values (h_member1_unq_seq.nextval,'aaa');
insert into a100 (unq,title)values (h_member1_unq_seq.nextval,'bbb');

-- a100 ���̺� ������ �߰��� h_member2 ���̺� �������߰�
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'ggg','1212','ŷ��','2010-01-02','010-1111-7777');
--����
delete from h_member2 where unq='2';
--���ο� ������
insert into h_member2(unq,userid,pass,name,birthday,phone)
    values(h_member1_unq_seq.nextval,'cccc','1212','ȣ��','2010-01-02','010-1111-7777');
    
--currval ������� �Էµ� ������ ��
select h_member1_unq_seq.currval from dual;