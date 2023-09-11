-- char : character �� ���ڷ� Ȯ������ ���ڿ� �ǹ�
-- userid -> [abc123]   varchar2 -> 7����Ʈ�� ��ȯ 
--username -> [abc1234] char ->[abc1234   ] 10����Ʈ : ������ ���� (3����Ʈ) ����

create table student(
    userid varchar2(20) not null,   --varchar2 :ũ�� ����,�˻��ӵ��� char���� ����   
    username char(10) not null,     --char :ũ�� ���� ,�˻��ӵ��� varchar2���� ����  
    age number,
    gender char(1),
    grade char(1)
    );
--insert into student (userid,username) valuse('a1','n1');(o)
--insert into student (userid,age) values('a2',20);(x) --�Ұ� username null

insert into student (userid,username,age,gender,grade) 
    values('st101','Tom',15, 'M',2);
insert into student (userid,username,age,gender,grade)
    values('st102','jane',16,'F',3);
insert into student (userid,username,age,gender,grade)
    values('st103','Yakima',14,'M',1);
insert into student (userid,username,age,gender,grade)
    values('st104','yong',14,'',1);
insert into student (userid,username,age,gender,grade)
    values('st105','minyo',0,'F','');
insert into student (userid,username,age,gender,grade)
    values('st106','kang',15,'',2);
insert into student (userid,username,age,gender,grade)
    values('st107','kim',0,'M','');
insert into student (userid,username,age,gender,grade)
    values('st108','miranda',15,'F',2);

select *from student;

--����Լ�
select count(*) from student where gender is not null and grade is not null;
select sum(age) from student;
select avg(age) from student;
select min(age) from student;
select max(age) from student;

--alias(��� Ÿ��Ʋ(�÷���) ����)
select username as �̸�, userid as ���̵� from student;

--order by(��������/ ��������)
--�������� (ascending)
select *from student order by age asc;
--�������� (descending)
select *from student order by age desc;

--Distinct(������ �ߺ� ����)
select age from student;
select distinct(age) from student; 

--Q1
select username from student where grade='1';
select username,age from student where age>=15;
select userid from student where gender is null;
--Q2
select username,age,grade from student where userid='st101' or userid='st102';
select *from student where age>=15 and gender='F';
select userid,username from student where grade='2'and  gender='M';
select avg(age) from student where gender='M' and age is not null;
select *from student where gender='M' order by age asc ; 

--Q3 
savepoint sp0;
select *from student;
update student set age='14' where userid='st105';
update student set age='15' where userid='st107';
update student set grade = '1' where age='14';
update student set grade = '2' where age='15';
update student set grade = '3' where age='16';
update student set gender ='M' where gender is null;

select *from student;
rollback to sp0;
rollback;