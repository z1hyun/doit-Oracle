--�� ���� ���� ��¥�� ���ϴ� ADD_MONTHS�Լ�
--ADD_MONTHS([��¥ ������(�ʼ�)] , [���� ���� ��(����)(�ʼ�)])

SELECT SYSDATE --2022/10/23 ���� 2:23:08 
      ,ADD_MONTHS(SYSDATE,3) --2023/01/23 ���� 2:23:08
    FROM DUAL;
    
--10��� ���ϱ�

SELECT ADD_MONTHS(SYSDATE, 120) AS "10YEARS"
FROM DUAL;

--10���Ĵ� 12*10�̱� ������ 120���� 

--�Ի� 32��(384����) �̸��� ��������� ����ϱ�
SELECT EMPNO
      ,ENAME
      ,HIREDATE
      ,SYSDATE
   FROM EMP
WHERE ADD_MONTHS(HIREDATE , 384) > SYSDATE