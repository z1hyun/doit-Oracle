
--그룹화와 관련된 여러 함수

--ROLLUP
/*SELECT [조회할 열1 이름],[열2 이름] , ...[열N 이름]
  FROM [조회할 테이블 이름]
  WHERE [조회할 행을 선별하는 조건식]
  GROUP BY ROLLUP[그룹 화 열 지정(여러 개 지정 가능)];
*/

--CUBE
/*SELECT [조회할 열1 이름],[열2 이름] , ...[열N 이름]
  FROM [조회할 테이블 이름]
  WHERE [조회할 행을 선별하는 조건식]
  GROUP BY CUBE[그룹 화 열 지정(여러 개 지정 가능)];
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

--ROLLUP 함수사용
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
   1. A 그룹별 B 그룹별 C그룹에 해당하는 결과 출력
   2. A 그룹별 B 그룹에 해당하는 결과 출력
   3. A 그룹에 해당하는 결과 출력
   4. 전체 데이터 결과 출력
*/


--CUBE 함수 사용
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
   1. A 그룹별 B 그룹별 C그룹에 해당하는 결과 출력
   2. A 그룹별 B 그룹의 결과 출력
   3. B 그룹별 C 그룹의 결과 출력
   4. A 그룹별 C 그룹의 결과 출력
   5. A 그룹 결과
   6. B 그룹 결과
   7. C 그룹 결과
   8. 전체 데이터 결과
*/

--두 함수는 지정할 열이 많으면 출력될 조합이 많아질 것. 특히 CUBE함수는 제곱수로 조합경우의 수가 올라가므로 감당하기 어려울 정도의 기하급수적인 증가가 일어남.

SELECT DEPTNO , JOB , COUNT(*)
  FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);
--JOB을 GROUP화 한다음에 DEPTNO별로 COUNT(*)를 센다.

SELECT DEPTNO , JOB , COUNT(*)
  FROM EMP
GROUP BY JOB, ROLLUP(DEPTNO);
--DEPTNO을 그룹화하고 JOB별로 COUNT(*)를 센다.


