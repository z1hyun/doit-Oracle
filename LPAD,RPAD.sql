--데이터의 빈 공간을 특정 문자로 채우는 LPAD , RPAD함수

/*
데이터와 자릿수를 지정한 후 데이터 길이가 지정한 자릿수보다 작을 경우에 나머지 공간을 특정 문자로 채우는 함수
LPAD는 왼쪽에 채우고 RPAD는 오른쪽에 채운다.
*/


--LPAD([문자열 데이터 또는 열이름(필수)] ,  [데이터의 자릿수(필수)] , [빈 공간에 채울 문자(선택)])
--RPAD([문자열 데이터 또는 열이름(필수)] ,  [데이터의 자릿수(필수)] , [빈 공간에 채울 문자(선택)])

SELECT 'Oracle'
      ,LPAD('Oracle' , 10 , '#') AS LPAD_1 --####Oracle
      ,RPAD('Oracle' , 10 , '#') AS RPAD_1 --Oracle####
      ,LPAD('Oracle' , 10) AS LPAD_2 --    Oracle
      ,RPAD('Oracle' , 10) AS RPAD_2 --Oracle    
FROM DUAL; 

--LPAD_2와 RPAD_2는 3번째 입력밧이 없기 때문에 빈공백 문자열로 띄어쓰기 처리가 되어 자릿수를 맞추고있다.

--특정문자로 자릿수 채워서 출력하기

SELECT RPAD('971225-' , 14,'*') AS RPAD_JMNO --971225-*******
      ,RPAD('010-1234-', 13, '*') AS RPAD_PHONE --010-1234-****
FROM DUAL;