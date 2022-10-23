--문자 데이터 숫자 데이터로 변환하는 TO_NUMBER
--TO_NUMBER('[문자열 데이터(필수)]' , '[인식될 숫자형태(필수)]')


SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
   FROM DUAL; ---200

--SELECT '1,300' - '1,500'
--   FROM DUAL;--오류