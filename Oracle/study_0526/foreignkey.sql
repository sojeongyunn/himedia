create table student11(
    userid varchar2(20) not null primary key
    ,name varchar2(50)
    );

--�ڹ� ��� (�ڽķ���)
create table jumsu11(
    userid varchar2(20) not null,
    kor number,
    eng number,
    constraint jumsu_fk foreign key(userid) 
        references student11(userid)
    );

insert into student11 values('a1','ȫ�浿');
insert into student11 values('a2','��û��');
insert into student11 values('a3','�����');
insert into jumsu11 values('a1',100,90);
insert into jumsu11 values('a2',90,70);
insert into jumsu11 values('a5',88,68);--error fk ����

delete from student11 where userid = 'a1'; --error �ڽ� �߰� --�ܷ�Ű

alter table jumsu11 drop constraint jumsu_fk; --fk����
delete from student11 where userid = 'a1';--��������

create table jumsu12(
    userid varchar2(20) not null,
    kor number,
    eng number,
    constraint jumsu_fk foreign key(userid) 
        references student11(userid)
                    on delete cascade
    );

insert into jumsu12 values('a2',90,70);
delete from student11 where userid='a2';