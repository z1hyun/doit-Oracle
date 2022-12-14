--특정 위치에서 버리는 TRUNC함수

/*
TRUNC함수는 지정된 자리에서 숫자를 버림처리하는 함수다.
반올림 위치를 지정하지 않으면 소수점 첫째자리에서 버림처리된다.

TRUNC([숫자(필수)],[버림 위치(선택)]
*/


SELECT TRUNC(1234.5678) AS TRUNC --1234 소수점 첫째자리부터 버림
      ,TRUNC(1234.5678 , 0) AS TRUNC_0 --1234 소수점 첫째자리부터 버림
      ,TRUNC(1234.5678 , 1) AS TRUNC_1 --1234.5 소수점 둘째자리부터 버림
      ,TRUNC(1234.5678 , 2) AS TRUNC_2 --1234.5 소수점 셋째자리부터 버림
      ,TRUNC(1234.5678 , -1) AS TRUNC_MINUS1 --1230 자연수 첫째자리부터 버림
      ,TRUNC(1234.5678 , -2) AS TRUNC_MINUS2 --1200 자연수 둘째자리부터 버림
FROM DUAL;