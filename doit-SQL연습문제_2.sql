
/*
   EMP ���̺��� �̿��Ͽ� �μ� ��ȣ(DEPTNO) , ��� �޿�(AVG_SAL), �ְ� �޿�(MAX_SAL), ���� �޿�(MIN_SAL), ��� ��(CNT)�� ����Ѵ�.
   �� , ��� �޿��� ����Ҷ� �Ҽ����� �����ϰ� �� �μ���ȣ ���� ����ϼ���.
*/
SELECT DEPTNO 
     , TRUNC(AVG(SAL)) AVG_SAL
     , MAX(SAL) MAX_SAL
     , MIN(SAL) MIN_SAL
     , COUNT(*) 
FROM EMP
GROUP BY DEPTNO; 

/*
���� ��å(JOB)�� �����ϴ� ����� 3�� �̻��� ��å�� �ο����� ����ϼ���.
*/

SELECT JOB , COUNT(*)
FROM EMP
HAVING COUNT(*) >= 3
GROUP BY JOB
ORDER BY COUNT(*) DESC;

/*
������� �Ի� ����(HIRE_YEAR)�� �������� �μ����� �� ���� �Ի��ߴ��� ����ϼ���.
*/

SELECT  TO_CHAR(HIREDATE , 'YYYY') , DEPTNO , COUNT(*) FROM EMP
GROUP BY TO_CHAR(HIREDATE , 'YYYY') , DEPTNO 
ORDER BY TO_CHAR(HIREDATE , 'YYYY') DESC ;


/*
�߰� ����(COMM)�� �޴� ��� ���� �����ʴ� ��� ���� ����ϼ���.
*/

SELECT NVL2(COMM , 'O' ,'X') AS EXIST_COMM , COUNT(*) 
FROM EMP
GROUP BY NVL2(COMM, 'O','X');

/*
�� �μ��� �Ի� ������ ��� ��, �ְ� �޿�, �޿� ��, ��� �޿��� ����ϰ� �� �μ��� �Ұ�� �Ѱ踦 ����ϼ���.
*/

SELECT DEPTNO , TO_CHAR(HIREDATE , 'YYYY') HIRE_YEAR , COUNT(*) CNT , MAX(SAL) MAX_SAL , SUM(SAL) SUM_SAL ,  AVG(SAL) AVG_SAL
FROM EMP 
GROUP BY ROLLUP (DEPTNO , TO_CHAR(HIREDATE , 'YYYY'));1