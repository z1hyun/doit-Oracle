
--�� ��¥ ���� ���� �� ���̸� ���ϴ� MONTHS_BETWEEN�Լ�
--MONTHS_BETWEEN([��¥ ������1(�ʼ�)] , [��¥ ������2(�ʼ�)])

SELECT EMPNO
      ,ENAME
      ,HIREDATE
      ,SYSDATE
      ,MONTHS_BETWEEN(HIREDATE , SYSDATE) AS MONTHS1
      ,MONTHS_BETWEEN(SYDATE , HIREDATE) AS MONTHS2
      ,TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
   FROM EMP;
   
--�񱳳�¥�� �Է���ġ�� ���� ���� �Ǵ� ����� ���� �� �ִ�.
--���� �� ���̴� �Ҽ��� �������� ����� �����Ƿ� MONTH3�� ���� TRUNC�Լ��� �����ϸ� ���� �� ���̸� ������ ����� �� �ִ�.

   
   