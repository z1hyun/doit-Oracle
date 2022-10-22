--몇 개월 이후 날짜를 구하는 ADD_MONTHS함수
--ADD_MONTHS([날짜 데이터(필수)] , [더할 개월 수(정수)(필수)])

SELECT SYSDATE --2022/10/23 오전 2:23:08 
      ,ADD_MONTHS(SYSDATE,3) --2023/01/23 오전 2:23:08
    FROM DUAL;
    
--10년뒤 구하기

SELECT ADD_MONTHS(SYSDATE, 120) AS "10YEARS"
FROM DUAL;

--10년후는 12*10이기 때문에 120개월 

--입사 32년(384개월) 미만인 사원데이터 출력하기
SELECT EMPNO
      ,ENAME
      ,HIREDATE
      ,SYSDATE
   FROM EMP
WHERE ADD_MONTHS(HIREDATE , 384) > SYSDATE
