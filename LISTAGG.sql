--LISTAGG함수 
--그룹에 속해있는 데이터를 가로로 나열할때 사용한다.


SELECT DEPTNO , ENAME
  FROM EMP
GROUP BY DEPTNO , ENAME;

/*
SELECT [조회할 열1 이름] , [열2 이름], ..., [열N 이름]
       LISTAGG([나열할 열(필수)] , [각 데이터를 구분하는 구분자(선택)])
       WITHIN GROUP(ORDER BY 나열할 열의 정렬 기준 열 (선택))
FROM [조회할 테이블 이름]
WHERE [조회할 행을 선별하는 조건식];
*/

SELECT DEPTNO
      ,LISTAGG(ENAME , ',') WITHIN GROUP (ORDER BY SAL DESC) AS ENAMES
  FROM EMP
GROUP BY DEPTNO;

--10	KING,CLARK,MILLER
--20	FORD,JONES,SMITH
--30	BLAKE,ALLEN,TURNER,MARTIN,WARD,JAMES