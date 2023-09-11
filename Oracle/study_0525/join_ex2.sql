create table h_member1(
userid varchar2(20),
pass varchar2(100),
name varchar2(20),
birthday date,
phone varchar2(20));

alter table h_member1 modify userid varchar2(20) not null primary key;
alter table h_member1 modify pass varchar2(100) not null;
alter table h_member1 modify name varchar2(20) not null;

desc h_member1;
select *from h_member1;

insert into h_member1(userid,pass,name,birthday,phone) 
    values('hong','1234','ȫ�浿','2010-04-23','');
insert into h_member1(userid,pass,name,birthday,phone)
    values('tiger','1111','ȣ����','2010-11-11','010-5555-7777');
insert into h_member1(userid,pass,name,birthday,phone)
    values('linux','qwer','�����','2010-08-17','010-2222-1234');
insert into h_member1(userid,pass,name,birthday,phone)
    values('java','1212','����','2010-01-02','010-1111-7777');
    
create table h_sore1(
userid varchar(20),
eng number,
kor number);

alter table h_score1 modify userid varchar(20) not null primary key;
alter table h_score1 modify eng number default '0';
alter table h_score1 modify kor number default '0';

insert into h_score1(userid,eng,kor)
    values('hong',90,80);
insert into h_score1(userid,eng,kor)
    values('tiger',68,54);
insert into h_score1(userid,eng,kor)
    values('linux',98,62);

select *from h_score1;

create table h_grade1(
grade varchar(1),
loscore number,
hiscore number);

insert into h_grade1(grade,loscore,hiscore)
    values('A',90,100);
insert into h_grade1(grade,loscore,hiscore)
    values('B',80,89);
insert into h_grade1(grade,loscore,hiscore)
    values('C',70,79);
insert into h_grade1(grade,loscore,hiscore)
    values('D',60,69);
insert into h_grade1(grade,loscore,hiscore)
    values('F',0,59);
    
select *from h_grade1;

--1.���̵�,�̸�,��������,��������    (�����)
select m.userid,m.name,s.eng,s.kor from h_member1 m,h_score1 s 
    where m.userid=s.userid;    --��� userid�� ���ھ� userid�� ����(��Ī)

--2.���̵�,�̸�,��������,�������� --���ε��� ���� ������ ��� (outer ����)
select m.userid,m.name,s.eng,s.kor from h_member1 m,h_score1 s 
    where m.userid = s.userid (+);  --���ھ� userid���� �����ϹǷ� (+)ó��-->java�� ������ �Ⱥ� 

--3.���̵�,�̸�,����,��� --(����+����),(����+����)/2   
select m.userid,
       m.name,
       (s.eng+kor) as sum,
       (s.eng+s.kor)/2 as avg
        from h_member1 m,h_score1 s --as ��������
        where m.userid = s.userid;  --userid ����

--4.���̵�,��������(����)
select s.userid,s.eng||'('||g.grade||')' eng 
        from h_score1 s,h_grade1 g
    where s.eng between g.loscore and g.hiscore;    --s.eng�� grade ������ ����(��Ī)

--5.���̵�,�̸�,��������(����)
select m.userid,m.name,s.kor||'('||g.grade||')' kor
    from 
        h_member1 m,h_score1 s,h_grade1 g
    where m.userid = s.userid --userid ����
            and 
          s.kor between g.loscore and g.hiscore; -- s.kor��     
--5.1 ���� ������ ���
select 
        m.userid,
        (select name from h_member1 where userid=s.userid) name,
        s.kor||'('||g.grade||')' kor
    from h_member1 m,h_score1 s,h_grade1 g
    where m.userid = s.userid and s.kor between g.loscore and g.hiscore;

--6.���̵�,�̸�,��������(����),��������(����)
select 
        m.userid,
        m.name,
        s.eng||'('||g2.grade||')' as eng,
        s.kor||'('||g1.grade||')' as kor 
    from
         h_member1 m, 
         h_score1 s, 
         h_grade1 g1, 
         h_grade1 g2
    where 
          m.userid = s.userid
          and
          s.eng between g1.loscore and  g1.hiscore 
          and
          s.kor between g2.loscore and  g2.hiscore;

--7.���̵�,�̸�,����
select userid,
       name,
       to_char(sysdate,'yyyy')-to_char(birthday,'yyyy') age 
        from h_member1;

--8.�����հ� 1���� ������ ����Ѵ� --�õ��� ������ ���
-- rownum�� �̿����� ���ϹǷ� ���� �������� desc������ ���� 
-- �ٱ� ���������� rownum = 1 �� ������(�ٱ��������� where�� rownum=1�� ������)
select a.*from a (
select   m.userid,
         m.name,
         s.eng+s.kor as sum,
         (s.eng+s.kor)/2 avg
        from h_member1 m,h_score1 s 
        where 
            m.userid =s.userid
        order by sum desc) a
      where rownum=1
      ;
--8.1 �õ� ���� ���
-- rownum�� �̿����� ���ϹǷ� ���� �������� asc������ ���� 
-- �ٱ� ���������� rownum = 1 �� ������
select a.* from ( 
select m.userid,
         m.name,
         s.eng+s.kor as sum,
         (s.eng+s.kor)/2 avg
    from h_member1 m,h_score1 s 
    where 
      m.userid =s.userid
      order by sum asc) a
      where rownum =1
      ;

--8.2 �������� ������ ��� order by (s.eng+s.kor) desc
select a.* from ( 
select m.*
    from h_member1 m,h_score1 s 
    where 
      m.userid =s.userid
      order by (s.eng+s.kor) desc) a
      where rownum =1
      ;
--9.��ȭ��ȣ�� ���� ������ ����Ѵ�
select *from h_member1 where phone is null;
select *from h_member1 where phone is not null;
--10.ȸ���̸� �� "ȫ"������ �˻��Ѵ�
select *from h_member1 where name like 'ȫ%';
select *from h_member1 where name not like 'ȫ%';