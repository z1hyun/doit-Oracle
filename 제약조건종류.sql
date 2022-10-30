
--제약조건

/*
    NOT NULL | 지정한 열에 NULL을 허용하지 않는다.  NULL을제외한 데이터의 중복은 허용
    UNIQUE | 지정한 열이 유일한 값을 가져야한다. 중복불가 , 단 NULL값은 중복에서 제외
    PRIMARY KEY | 지정한 열이 유일한 값이면서  NULL을 허용하지 않는다. PRIMARY KEY는 테이블에 하나만 지정가능
    FOREIGN KEY | 다른 테이블의 열을 참조하여 존재하는 값만 입력할 수 있다.
    CHECK | 설정한 조건식을 만족하는 데이터만 입력 가능.
    
   -데이터 무결성이란?
    데이터 무결성은 데이터베이스에 저장되는 데이터의 정확성과 일관성을 보장한다는 의미
    
   영역 무결성 | 열에 저장되는 값의 적정 여부를 확인, 자료형, 적절한 형식의 데이터, NULL 여부같은 정해 놓은 범위를 만족하는 데이터임을 규정
   개체 무결성 | 테이블 데이터에 유일하게 식별할 수 있는 기본키는 반드시 값을 가지고 있어야하며, NULL이 될 수 없고 중복될 수도 없음을 규정
   참조 무결성 | 참조 테이블의 외래키 값은 참조 테이브르이 기본키로서 존재해야하며 NULL이 가능
*/

--빈값을 허락하지 않는 NOT NULL

--테이블 생성시에 NOT NULL설정하기

CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL
   ,LOGIN_PWD VARCHAR2(20) NOT NULL
   ,TEL VARCHAR2(20)
   );
   
   DESC TABLE_NOTNULL;
   
--제약조건 확인하기
/*
    OWNER | 제약 조건 소유 계정
    CONSTRAINT_NAME | 제약 조건 이름(직접 지정하지 않을 경우 오라클이 자동으로 지정함)
    CONSTRAINT_TYPE | 제약 조건 종류
    C : CHECK,NOT NULL
    U : UNIQUE
    P: PRIMARY KEY
    R: FOREIGN KEY
   TABLRE_NAME | 제약 조건을 지정한 테이블 이름
*/
SELECT OWNER , CONSTRAINT_NAME , CONSTRAINT_TYPE , TABLE_NAME
FROM USER_CONSTRAINTS;

  CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL
   ,LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL
   ,TEL VARCHAR2(20)
  );

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--이미 생성한 테이블에 제약 조건 지정

--TEL 열에 NOT NULL제약 조건 추가하기
ALTER TABLE TABLE_NOTNULL
MODIFY (TEL NOT NULL);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--생성한 테이블에 제약 조건 이름 직접 지정해서 추가하기.

--제약 조건에 이름 지정해서 추가하기
ALTER TABLE TABLE_NOTNULL2
MODIFY (TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

SELECT OWNER , CONSTRAINT_NAME, CONSTRAINT_TYPE , TABLE_NAME
FROM USER_CONSTRAINTS;

DESC TABLE_NOTNULL2;

ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TEL_NN;


SELECT OWNER , CONSTRAINT_NAME, CONSTRAINT_TYPE , TABLE_NAME
FROM USER_CONSTRAINTS;

