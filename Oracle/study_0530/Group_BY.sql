--select (10�� �μ� �޿����)  select avg(sal) from emp where deptno='10'
--       ,(20�� �μ� �޿����) select avg(sal) from emp where deptno='20'
--       ,(30�� �μ� �޿����) select avg(sal) from emp where deptno='30'
--       ,(40�� �μ� �޿����) select avg(sal) from emp where deptno='40'
--from 
    --dual;
--Group By
select   (select round(avg(sal),2) from emp where deptno='10') as "10_avg"
       , (select round(avg(sal),2) from emp where deptno='20') as "20_avg"
       , (select round(avg(sal),2) from emp where deptno='30') as "30_avg"
       , (select round(avg(sal),2) from emp where deptno='40') as "40_avg"
from 
    dual;

--(1) �μ��� �޿��� �� ���
select round(avg(sal),2) from emp
        group by deptno
                order by deptno asc;

--(2)���(emp) ���̺��� �μ���ȣ,�ְ�޿�,�����޿��� �μ��� ���
select deptno,max(sal),min(sal) from emp group by deptno;

--(3)emp ���̺��� �μ���ȣ, �ְ�޿�, �����޿��� �μ��� ��� ���� �����޿��� 1000�̻�
select deptno,max(sal),min(sal) from emp group by deptno
                        having min(sal) >=1000;

--(4) ������(job) ��� �޿� ��� -> job,svg(sal)
select job,to_char(round(avg(sal)),'999,999') as avg
        from emp group by job;
        
--(5) ������(job) �ְ� �޿� ���
select job,max(sal) from emp  group by job;

--(6) �μ��� �μ���ȣ�� ��ձ޿�(����: ��ձ޿��� 2000�̻��� �μ�)
select deptno,round(avg(sal),2) from emp 
                group by deptno 
                    having avg(sal) >=2000;

--(7) ������̺��� �� �μ��� ��� ������ ���ϰ� �� �߿��� ��� ������
-- ���� ���� �μ��� ��տ������� ���� �޴� �������� ������ȣ,�޿� ���
select empno,ename,sal from emp
    where sal < (select min(round(avg(sal))) salAvg from emp group by deptno);
    
--[Ǯ���1] �μ��� ����� ��ȸ --count(*)�� �ӵ��� ����
select deptno,count(empno) from emp group by deptno order by deptno desc;

--[Ǯ���2] �Ʒ�ó�� ���
select deptno,count(empno) as conut ,
        to_char(round(avg(sal)),'999,999,999') as salAvg,
        to_char(sum(sal),'999,999,999') as salSum from emp
                group by deptno order by deptno desc;
 
--[Ǯ���3] ������� 5���� �Ѵ� �μ��� ����� ��ȸ
select d.dname,count(e.empno) as count from emp e,dept d
                where e.deptno=d.deptno 
                    group by d.dname
                having count(e.empno)>=5;