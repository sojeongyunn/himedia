create table nboard(
    unq number not null primary key,
    title varchar2(100) not null,
    name varchar2(20) 
    );

create sequence nboard_seq
    increment by 1
    start with 1
    maxvalue 99999;
    
1. ���� ������ �� ��� nboard_seq.currval
2. ���� ������ �� ��� nboard_seq.nextval

select nboard_seq.nextval from dual; --�ϳ� ����ؾ� currval �۵�
select nboard_seq.currval from dual;

insert into nboard 
        values(nboard_seq.nextval,'aaa','bbb');

select *from nboard;