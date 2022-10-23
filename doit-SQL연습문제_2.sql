
/*
   EMP 테이블을 이용하여 부서 번호(DEPTNO) , 평균 급여(AVG_SAL), 최고 급여(MAX_SAL), 최저 급여(MIN_SAL), 사원 수(CNT)를 출력한다.
   단 , 평균 급여를 출력할때 소수점을 제외하고 각 부서번호 별로 출력하세요.
*/
SELECT DEPTNO 
     , TRUNC(AVG(SAL)) AVG_SAL
     , MAX(SAL) MAX_SAL
     , MIN(SAL) MIN_SAL
     , COUNT(*) 
FROM EMP
GROUP BY DEPTNO; 

/*
같은 직책(JOB)에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하세요.
*/

SELECT JOB , COUNT(*)
FROM EMP
HAVING COUNT(*) >= 3
GROUP BY JOB
ORDER BY COUNT(*) DESC;

/*
사원들의 입사 연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 출력하세요.
*/

SELECT  TO_CHAR(HIREDATE , 'YYYY') , DEPTNO , COUNT(*) FROM EMP
GROUP BY TO_CHAR(HIREDATE , 'YYYY') , DEPTNO 
ORDER BY TO_CHAR(HIREDATE , 'YYYY') DESC ;


/*
추가 수당(COMM)을 받는 사원 수와 받지않는 사원 수를 출력하세요.
*/

SELECT NVL2(COMM , 'O' ,'X') AS EXIST_COMM , COUNT(*) 
FROM EMP
GROUP BY NVL2(COMM, 'O','X');

/*
각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력하고 각 부서별 소계와 총계를 출력하세요.
*/

SELECT DEPTNO , TO_CHAR(HIREDATE , 'YYYY') HIRE_YEAR , COUNT(*) CNT , MAX(SAL) MAX_SAL , SUM(SAL) SUM_SAL ,  AVG(SAL) AVG_SAL
FROM EMP 
GROUP BY ROLLUP (DEPTNO , TO_CHAR(HIREDATE , 'YYYY'));1