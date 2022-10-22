
/*
날짜 데이터 + 숫자 : 날짜 데이터보다 숫자만큼 일수 이후의 날짜
날짜 데이터 - 숫자 : 날짜 데이터보다 숫자만큼 일수 이전의 날짜
날짜 데이터 - 날짜 데이터 : 두 날짜 데이터 간의 일수 차이
*/

SELECT SYSDATE AS NOW
      ,SYSDATE-1 AS YESTERDAY
      ,SYSDATE+1 AS TOMORROW
    FROM DUAL;