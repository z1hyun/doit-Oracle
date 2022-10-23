--문자 데이터를 날짜 데이터로 변환하는 TO_DATE 함수
--TO_DATE('[문자열 데이터(필수)]' , '[인식될 날짜형태(필수)]')

SELECT TO_DATE('2018-07-14' , 'YYYY-MM-DD') AS TODATE1 --2018/07/14
      ,TO_DATE('20180714' , 'YYYY-MM-DD') AS TODATE2 --2018/07/14
  FROM DUAL;
  
--여러가지 형식으로 날짜 데이터 출력하기

SELECT TO_DATE('49/12/10' , 'YY/MM/DD') AS YY_YEAR_49 --2049/12/10
      ,TO_DATE('49/12/10' , 'RR/MM/DD') AS RR_YEAR_49 --2049/12/10
      ,TO_DATE('50/12/10' , 'YY/MM/DD') AS YY_YEAR_50 --2050/12/10
      ,TO_DATE('50/12/10' , 'RR/MM/DD') AS RR_YEAR_50 --1950/12/10
      ,TO_DATE('51/12/10' , 'YY/MM/DD') AS YY_YEAR_51 --2051/12/10
      ,TO_DATE('51/12/10' , 'RR/MM/DD') AS RR_YEAR_51 --1951/12/10
    FROM DUAL;
    