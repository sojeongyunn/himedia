--��¥ ���� ���  --from dual : �������̺� (������ ���� ���̺�) ����
-- �ּ�: --
select sysdate from dual;   --��/��/�� (�� �� �� ����������)
select systimestamp from dual;  --��/��/�� ��:��:��
--���� ���� : to_char (�ð�,����(����:----/--/-- --:--:--))
-- to_char : �ð��� ���ڿ��� �ٲپ��ִ� �Լ�
        --yyyy:�⵵4�ڸ� mm:��2�ڸ� dd:�� 2�ڸ�   hh24:24�ð�2�ڸ� mi:�� ss:�� 
select to_char(sysdate,'YYYY/MM/DD HH24:mi:ss')from dual; --����ð�

-- ��¥/���� ����
-- �� (��¥)���� ������ ���Ҵ� +,-�����ȣ�� ����Ѵ�.
select sysdate, sysdate+3 from dual;    --��¥���� 3�� ����
select to_char(sysdate-3,'yyyymmdd hh24miss') from dual; --3�� ����
select to_char(sysdate+1,'yyyymmdd hh24miss')from dual; --1����
select to_char(sysdate+(2/24),'yyyymmdd hh24miss') from dual; --2�ð��� ->1���� 24�� ����
select systimestamp, sysdate-1 from dual;
--add_month() : ������ ����/���� -*��¥�� �����ϰ� �����ؾ� ����Ÿ���� ����� ����
select add_months(sysdate,2)from dual;
--months_between() : �������� ���� ��ȯ month_between(ū��,������)
select months_between('2021-09-02','2021-08-02')from dual;
select round(months_between('2021-09-02','2021-08-03'),2) from dual;
--last_day: �ش� ���� ������ ��¥ ��ȯ
select last_day(sysdate) from dual;
select last_day ('2021-02-01') from dual;

--to_char()�Լ�
--(1)����� �ú���
select to_char (sysdate,'yyyy-mm-dd am hh:mi:ss') from dual;
--(2)������ ����
select to_char(sysdate,'yyyy')from dual;
select to_char(sysdate,'yy')from dual;
--(3)������ ��¥�� ���� ���
select to_char(sysdate,'yyyy-mm-dd day') from dual;
select to_char(sysdate,'d') from dual;
select to_char(sysdate,'dy') from dual;
select to_char(sysdate,'day') from dual;

--to_date()�Լ� : ���ڿ� Ÿ���� ��¥���� ��¥Ÿ������ ��ȯ
--(4) select to_date ( ���ڿ�, ����)
select to_date('20230522 15:22:30','yyyy-mm-dd hh24:mi:ss') from dual;
    --23/05/22
--select to_char('20230522 15:22:30','yyyy-mm-dd hh24:mi:ss') from dual;
    --error
select to_char(sysdate,'yyyy-mm-dd') from dual;
--(5) �� ���� ������ ���� : ��³�¥�� 5��22���̸� 5�� 1��
select to_date('1998','yyyy') as mydate from dual;

--to_char() �Լ��� �ٸ���� 
--����(����)�� 3�ڸ����� �޸�(,)��� 9:���� �ǹ� (fm: �־��� ���ں��� ������ �ȵ�)
-- as name : �÷����� name ������ ����
select to_char(123456,'fm999,999') as num1 from dual;
select to_char(1234567890,'fml999,999,999,999') from dual;
select to_char(1234567,'fm$999,999') from dual; --error #####���ζ� ->1234567���� fm-999,999�� ����

--to_number()�Լ� :����Ÿ���� ���ڵ鵵 ������ �����ϳ� 
--              �������������� �����÷�('')���� ���ڵ��� ������ �ȵ� �� ���� �� �� ���;
select '50'+'30' as sum from dual;

