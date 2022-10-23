
--�׷�ȭ�� ���õ� ���� �Լ�

--ROLLUP
/*SELECT [��ȸ�� ��1 �̸�],[��2 �̸�] , ...[��N �̸�]
  FROM [��ȸ�� ���̺� �̸�]
  WHERE [��ȸ�� ���� �����ϴ� ���ǽ�]
  GROUP BY ROLLUP[�׷� ȭ �� ����(���� �� ���� ����)];
*/

--CUBE
/*SELECT [��ȸ�� ��1 �̸�],[��2 �̸�] , ...[��N �̸�]
  FROM [��ȸ�� ���̺� �̸�]
  WHERE [��ȸ�� ���� �����ϴ� ���ǽ�]
  GROUP BY CUBE[�׷� ȭ �� ����(���� �� ���� ����)];
*/

SELECT DEPTNO 
     , JOB 
     , COUNT(*)
     , MAX(SAL)
     , SUM(SAL)
     , AVG(SAL)
  FROM EMP
GROUP BY DEPTNO , JOB
ORDER BY DEPTNO , JOB;

--ROLLUP �Լ����
SELECT DEPTNO 
     , JOB 
     , COUNT(*)
     , MAX(SAL)
     , SUM(SAL)
     , AVG(SAL)
  FROM EMP
GROUP BY ROLLUP(DEPTNO , JOB);

/*
   -ROLLUP(A,B,C)
   1. A �׷캰 B �׷캰 C�׷쿡 �ش��ϴ� ��� ���
   2. A �׷캰 B �׷쿡 �ش��ϴ� ��� ���
   3. A �׷쿡 �ش��ϴ� ��� ���
   4. ��ü ������ ��� ���
*/


--CUBE �Լ� ���
SELECT DEPTNO 
     , JOB 
     , COUNT(*)
     , MAX(SAL)
     , SUM(SAL)
     , AVG(SAL)
  FROM EMP
GROUP BY CUBE(DEPTNO , JOB)
ORDER BY DEPTNO , JOB;

/*
   -CUBE(A,B,C)
   1. A �׷캰 B �׷캰 C�׷쿡 �ش��ϴ� ��� ���
   2. A �׷캰 B �׷��� ��� ���
   3. B �׷캰 C �׷��� ��� ���
   4. A �׷캰 C �׷��� ��� ���
   5. A �׷� ���
   6. B �׷� ���
   7. C �׷� ���
   8. ��ü ������ ���
*/

--�� �Լ��� ������ ���� ������ ��µ� ������ ������ ��. Ư�� CUBE�Լ��� �������� ���հ���� ���� �ö󰡹Ƿ� �����ϱ� ����� ������ ���ϱ޼����� ������ �Ͼ.

SELECT DEPTNO , JOB , COUNT(*)
  FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);
--JOB�� GROUPȭ �Ѵ����� DEPTNO���� COUNT(*)�� ����.

SELECT DEPTNO , JOB , COUNT(*)
  FROM EMP
GROUP BY JOB, ROLLUP(DEPTNO);
--DEPTNO�� �׷�ȭ�ϰ� JOB���� COUNT(*)�� ����.


