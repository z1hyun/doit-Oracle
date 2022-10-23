
--DEPT 테이블을 복사해서 DEPT_TEMP테이블 만들기
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

--테이블을 잘못 만들었거나 지워야할때에는 DROP명령어를 사용한다.
--DROP TABLE 테이블 이름;


--EMP 테이블과 동일한 열 구조, 데이터를 가지는 EMP_TEMP10 테이블을 생성하기 위한구문
CREATE TABLE EMP_TEMP10
AS SELECT * FROM EMP;


