--NVL()�Լ�) nvl(�ʵ尪,���ð�) ->�ʵ尪�� null�ΰ�� ���ð� ����
select ename,nvl(mgr,0) mgr from emp;

select ename,sal,comm,(sal+nvl(comm,0)) from emp;
                            --nvl2(�÷�,null�� �ƴѰ��,null�ΰ��)
select ename,sal,comm,(sal+nvl2(comm,comm+100,0)) from emp;