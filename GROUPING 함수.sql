
--GROUPING SETS�Լ�
--���� ������ �׷�ȭ ���� ���� ���� �� �� ���� �׷�ȭ�� ���� ��� ���� ����ϴµ� ���
/*
SELECT [��ȸ�� ��1 �̸�], [��2 �̸�] ..[��N �̸�]
  FROM [��ȸ�� ���̺� �̸�]
WHERE [��ȸ�� ���� �����ϴ� ���ǽ�]
GROUP BY GROUPING SETS [�׷�ȭ �� ����(���� �� ��������)];
*/
--���� �׷�ȭ ��� ���� ��� ���� ���� ���� �������� �����.
SELECT DEPTNO , JOB , COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO ,JOB)
ORDER BY DEPTNO , JOB;
--�׷�ȭ�� ���� ������ ���� ���������� �з����� �ʰ� ���� ���� �׷�ȭ �� �� ������ ������. 


--GROUPING �Լ�
/*
 SELECT [��ȸ�� ��1 �̸�] , [��2 �̸�], ...[��N �̸�]
    GROUPING [GROUP BY���� RPLLUP �Ǵ� CUBE�� ����� �׷�ȭ �� �� �̸�]
FROM [��ȸ�� ���̺� �̸�]
WHERE [��ȸ�� ���� �����ϴ� ���ǽ�]
GROUP BY ROLLUP �Ǵ� CUBE[�׷�ȭ�� ��];
*/
--���� ����� �׷�ȭ ��� ���� �׷�ȭ�� �̷���� ������ �������� ���θ� �����. 0��1�� �������.

SELECT DEPTNO , JOB , COUNT(*) ,  MAX(SAL), SUM(SAL), AVG(SAL)
    ,GROUPING(DEPTNO)
    ,GROUPING(JOB)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO , JOB;
/*
GROUPING ������ 0�� ������ �Լ��� ������ ���� �׷�ȭ �Ǿ����� �ǹ�ȭ�ϰ�
GROUPING ������ 1�� ������ �׷�ȭ���� ���� �����͸� �ǹ��Ѵ�.
*/


--DECODE������ GROUPING �Լ��� �����Ͽ� ���ǥ���ϱ�.
SELECT DECODE(GROUPING(DEPTNO) , 1 , 'ALL_DEPT' , DEPTNO) AS DEPTNO
      ,DECODE(GROUPING(JOB) , 1 , 'ALL_JOB' , JOB) AS JOB
      ,COUNT(*) , MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY CUBE(DEPTNO , JOB)
ORDER BY DEPTNO , JOB;


-- GROUPING_ID :: GROUPING �Լ��� ���������� ROLLUP , CUBE�Լ��� ������ �� Ư������ �׷�ȭ�Ǿ������� ����ϴ� �Լ�(�˻��� ���� ������ ������ �� �ִ�.)

/*
  SELECT [��ȸ�� ��1 �̸�] , [��2 �̸�], ... [��N �̸�]
     GROUPING_ID [�׷�ȭ ���θ� Ȯ���� ��(������ ��������)]
    FROM [��ȸ�� ���̺� �̸�] WHERE [��ȸ�� ���� �����ϴ� ���ǽ�]
  GROUP BY ROLLUP �Ǵ� CUBE [�׷�ȭ �� ��];
*/

/*
    �׷�ȭ �� �� | �׷�ȭ ��Ʈ ���� | ���� ���
      a, b   |   0   0      | 0
        a    |   0   1      | 1
        b    |   1   0      | 2
       ����   |   1   1      | 3
       
       ��Ʈ ���Ͱ��� 2������ ���� 10������ �ٲ� ���� ���� ����� ��µȴ�.
*/