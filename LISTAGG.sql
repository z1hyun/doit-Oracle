--LISTAGG�Լ� 
--�׷쿡 �����ִ� �����͸� ���η� �����Ҷ� ����Ѵ�.


SELECT DEPTNO , ENAME
  FROM EMP
GROUP BY DEPTNO , ENAME;

/*
SELECT [��ȸ�� ��1 �̸�] , [��2 �̸�], ..., [��N �̸�]
       LISTAGG([������ ��(�ʼ�)] , [�� �����͸� �����ϴ� ������(����)])
       WITHIN GROUP(ORDER BY ������ ���� ���� ���� �� (����))
FROM [��ȸ�� ���̺� �̸�]
WHERE [��ȸ�� ���� �����ϴ� ���ǽ�];
*/

SELECT DEPTNO
      ,LISTAGG(ENAME , ',') WITHIN GROUP (ORDER BY SAL DESC) AS ENAMES
  FROM EMP
GROUP BY DEPTNO;

--10	KING,CLARK,MILLER
--20	FORD,JONES,SMITH
--30	BLAKE,ALLEN,TURNER,MARTIN,WARD,JAMES