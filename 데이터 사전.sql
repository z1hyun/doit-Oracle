
--SCOTT 계정에서 사용 가능한 데이터 사전 살펴보기
SELECT * FROM DICT;

--USER_접두어를 가진 데이터 사전
SELECT TABLE_NAME
  FROM USER_TABLES;
  
--ALL 접두어를 가진 데이터 사전
--SCOTT 계정이 사용할 수 있는 객체 정보 살펴보기

SELECT OWNER, TABLE_NAME
  FROM ALL_TABLES;
--OWNER열은 테이블을 소유한 사용자를 명시한다.

/*
OWNER VARCHAR2(30) NOT NULL 테이블을 소유한 사용자(ALL_TABLES에서만 존재)
TABLE_NAME VARCHAR2(30) NOT NULL 테이블이름
TABLESPACE_NAME VHARCHAR2(30) NULL허용 테이블 스페이스 이름
NUM_ROWS NUMBER 테이블에 저장된 행 수
*/

--SCOTT 계정으로 DBA_접두어 사용하기
SELECT * FROM DBA_TABLES;
--DBA_ 접두어를 가진 데이터 사전은 데이터베이스관리 권한을 가진 사용자만 조회할 수 있는 테이블로 SCOTT계정으로는 조횝 ㅜㄹ가.