--날짜,숫자 데이터를 문자 데이터로 변환하는 TO_CHAR함수
--TO_CHAR([날짜데이터(필수)],'[출력되길 원하는 문자 형태(필수)];)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 --2022/10/23 02:45:27
    FROM DUAL;
   

SELECT SYSDATE
      ,TO_CHAR(SYSDATE, 'MM') AS MM --10 
      ,TO_CHAR(SYSDATE, 'MON') AS MON --10월
      ,TO_CHAR(SYSDATE, 'MONTH') AS MONTH --10월
      ,TO_CHAR(SYSDATE, 'DD') AS DD --23
      ,TO_CHAR(SYSDATE, 'DY') AS DY --일
      ,TO_CHAR(SYSDATE, 'DAY') AS DAY --일요일
    FROM DUAL;  
    
    
--숫자 데이터 형식을 지정하여 출력하기

SELECT '48000' 
      ,TO_CHAR(48000, '$999,999') AS SAL_$ --$48,000
      ,TO_CHAR(48000, 'L999,999') AS SAL_L --￦48,000
      ,TO_CHAR(48000, '999,999.00') AS SAL_1 --48,000.00
      ,TO_CHAR(48000, '000,999,999,00') AS SAL_2 --000,000,480,00
      ,TO_CHAR(48000, '000999999.99') AS SAL_3 --000048000.00
      ,TO_CHAR(48000, '999,999,00') AS SAL_4 --480,00
    FROM DUAL;