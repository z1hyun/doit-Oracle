
--GROUPING SETS함수
--같은 수준의 그룹화 열이 여러 개일 때 각 열별 그룹화를 통해 결과 값을 출력하는데 사용
/*
SELECT [조회할 열1 이름], [열2 이름] ..[열N 이름]
  FROM [조회할 테이블 이름]
WHERE [조회할 행을 선별하는 조건식]
GROUP BY GROUPING SETS [그룹화 열 지정(여러 개 지정가능)];
*/
--여러 그룹화 대상 열의 결과 값을 각각 같은 수준으로 출력함.
SELECT DEPTNO , JOB , COUNT(*)
FROM EMP
GROUP BY GROUPING SETS(DEPTNO ,JOB)
ORDER BY DEPTNO , JOB;
--그룹화를 위해 지정한 열을 계층적으로 분류되지 않고 가각 따로 그룹화 한 후 연산을 수행함. 


--GROUPING 함수
/*
 SELECT [조회할 열1 이름] , [열2 이름], ...[열N 이름]
    GROUPING [GROUP BY절에 RPLLUP 또는 CUBE에 명시한 그룹화 할 열 이름]
FROM [조회할 테이블 이름]
WHERE [조회할 행을 선별하는 조건식]
GROUP BY ROLLUP 또는 CUBE[그룹화할 열];
*/
--현재 결과가 그룹화 대상 열의 그룹화가 이루어진 상태의 집계인지 여부를 출력함. 0과1의 출력으로.

SELECT DEPTNO , JOB , COUNT(*) ,  MAX(SAL), SUM(SAL), AVG(SAL)
    ,GROUPING(DEPTNO)
    ,GROUPING(JOB)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO , JOB;
/*
GROUPING 했을때 0이 나오면 함수에 지정한 열이 그룹화 되었음을 의미화하고
GROUPING 했을때 1이 나오면 그룹화되지 않은 데이터를 의미한다.
*/


--DECODE문으로 GROUPING 함수를 적용하여 결과표기하기.
SELECT DECODE(GROUPING(DEPTNO) , 1 , 'ALL_DEPT' , DEPTNO) AS DEPTNO
      ,DECODE(GROUPING(JOB) , 1 , 'ALL_JOB' , JOB) AS JOB
      ,COUNT(*) , MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY CUBE(DEPTNO , JOB)
ORDER BY DEPTNO , JOB;


-- GROUPING_ID :: GROUPING 함수와 마찬가지로 ROLLUP , CUBE함수로 연산할 때 특정열이 그룹화되었는지를 출력하는 함수(검사할 열을 여러개 지정할 수 있다.)

/*
  SELECT [조회할 열1 이름] , [열2 이름], ... [열N 이름]
     GROUPING_ID [그룹화 여부를 확인할 열(여러개 지정가능)]
    FROM [조회할 테이블 이름] WHERE [조회할 행을 선별하는 조건식]
  GROUP BY ROLLUP 또는 CUBE [그룹화 할 열];
*/

/*
    그룹화 된 열 | 그룹화 비트 백터 | 최종 결과
      a, b   |   0   0      | 0
        a    |   0   1      | 1
        b    |   1   0      | 2
       없음   |   1   1      | 3
       
       비트 벡터값을 2진수로 보고 10진수로 바꾼 값이 최종 결과로 출력된다.
*/