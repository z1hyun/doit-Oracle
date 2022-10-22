--몇 개월 이후 날짜를 구하는 ADD_MONTHS함수
--ADD_MONTHS([날짜 데이터(필수)] , [더할 개월 수(정수)(필수)])

SELECT SYSDATE --2022/10/23 오전 2:23:08 
      ,ADD_MONTHS(SYSDATE,3) --2023/01/23 오전 2:23:08
    FROM DUAL;
    
