
--두 날짜 간의 개월 수 차이를 구하는 MONTHS_BETWEEN함수
--MONTHS_BETWEEN([날짜 데이터1(필수)] , [날짜 데이터2(필수)])

SELECT EMPNO
      ,ENAME
      ,HIREDATE
      ,SYSDATE
      ,MONTHS_BETWEEN(HIREDATE , SYSDATE) AS MONTHS1
      ,MONTHS_BETWEEN(SYDATE , HIREDATE) AS MONTHS2
      ,TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
   FROM EMP;
   
--비교날짜의 입력위치에 따라 음수 또는 양수가 나올 수 있다.
--개월 수 차이는 소수점 단위까지 결과가 나오므로 MONTH3과 같이 TRUNC함수를 조합하면 개월 수 차이를 정수로 출력할 수 있다.

   
   