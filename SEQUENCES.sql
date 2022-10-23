--시퀀스는 오라클 데이터베이스에서 특정 규칙에 맞는 연속 숫자를 생성하는 객체.

/*시퀀스 생성문
  CREATE SEQUENCE 시퀀스 이름
  [INCREMENT BY n] : 시퀀스에서 생성할 번호의 증가 값 (기본값은 1) (선택)
  [START WITH n] : 시퀀스에서 생성할 번호의 시작 값 (기본값은 1) (선택) 
  [MAXVALUE n | NOMAXVALUE] : 시퀀스에서 생성할 번호의 최댓값 지정, 최댓값은 시작 값(START WITH) 이상, 최솟값(MINVALUE)을 초괏값으로 지정. NOMXVALUE로 지정하였을 겨웅 오름차순이면 10, 내림차순일 경우 -1로 설정(선택)
  [MINVALUE n | NOMUNVALUE] : 시퀀스에서 생성할 번호의 최솟값 지정, 최솟값은 시작 값(START WITH)이하, 최댓값(MAXVALUE) 미만 값으로 지정. NOMINVALUE로 지정하였을 경우 오름차순이면 1, 내차순이면 -10으로 설정(선택)
  [CYCLE | NOCYCLE] : 시퀀스에서 생성한 번호가 최댓값(MAXVALUE)에 도달했을 경우 CYCLE이면 시작 값(START WITH)에서 다시 시작, NOCYCLE이면 번호 생성이 중단되고, 추가 번호 생성을 요청하면 오류 발생(선택)
  [CACHE n | NOCACHE] : 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정, NOCACHE는 미리 생성하지 않도록 설정 옵션을 모두 생략하면 기본값은 20(선택)
*/

CREATE TABLE DEPT_SEQUENCE
    AS SELECT * FROM DEPT
        WHERE 1 <> 1;
SELECT * FROM DEPT_SEQUNCE;

--시퀀스생성  10으로 시작해서 10씩 증가 
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
   INCREMENT BY 10
   START WITH 10
   MAXVALUE 90
   MINVALUE 0
   NOCYCLE
   CACHE 2;
   
--시퀀스 확인하기
SELECT * FROM USER_SEQUENCES;

--시퀀스에서 생성한 순번을 사용한 INSERT문
INSERT INTO DEPT_SEQUENCE(DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE' , 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--가장 마지막으로 생성된 시퀀스 확인하기
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

--시퀀스에서 생성한 순번을 반복 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO , DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE' ,'SEOUL'); --9번 INSERT한다.

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--시퀀스 최댓값 90을 도달한 후 다시 INSERT문을 실행하면 시퀀스는 번호를 더 생성하지 못해서 오류남.


--시퀀스 수정
/*
ALTER SEQUENCE 시퀀스 이름
[INCREMENT BY n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
*/

--앞에서 생성한 시퀀스인 SEQ_DEPT_SEQUENCE의 최댓값을 99, 증가 값을 3, 그리고 NOCYCLE대신 CYCLE옵션을 준다.
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
   INCREMENT BY 3
   MAXVALUE 99
   CYCLE;
   
INSERT INTO DEPT_SEQUENCE (DEPTNO , DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE' ,'SEOUL'); 

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;--DEPTNO가 93인 데이터가 생김.
--최댓값까지 도달 후 계속 INSERT해서 수행결과를 확인하면 최소값0부터 다시 3씩 증가해 시작해서 데이터가 생김

--시퀀스 삭제
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

SELECT * FROM USER_SEQUENCES;