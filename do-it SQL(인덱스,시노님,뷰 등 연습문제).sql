/*
   1.EMP 테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 만들어 보세요.
   2.생성한 EMPIDX 테이블의 EMPNO열에 IDX_EMPIDX_EMPNO 인덱스를 만들어 보세요.
   3.마지막으로 인덱스가 잘 생성되었는지 적절한 데이터 사전 뷰를 통해 확인해보세요.
*/

CREATE TABLE EMPIDX
    AS SELECT * FROM EMP;

SELECT * FROM EMPIDX;

CREATE INDEX IDX_EMPIDX_EMPNO
 ON EMPIDX(EMPNO);
 
 SELECT * FROM USER_IND_COLUMNS;
 

/*
문제 1번에서 생성한 EMPIDX 테이블의 데이터 중 급여(SAL)가 1500 초과인 사원들만 출력하는 EMPIDX_OVER15K 뷰를 생성해보세요.
이 이름을 가진 뷰가 이미 존재할 경우에 새로운 내용으로 대체 가능해야 합니다.
EMPIDX_OVER15K 뷰는 사원 번호, 사원 이름, 직책, 부서 번호, 급여 추가 수당 열을 가지고 있다.
추가 수당 열의 경우에 추가 수당이 존재하면 O,존재하지 않으면 X로 출력한다.
*/

CREATE OR REPLACE VIEW  EMPIDX_OVER15K
AS(
SELECT EMPNO , ENAME, JOB , DEPTNO , SAL , NVL2(COMM , 'O', 'X') COMM FROM EMP
WHERE SAL >=1500
);


SELECT * FROM EMPIDX_OVER15K
ORDER BY EMPNO;

SELECT * FROM USER_VIEWS;


/*
  1.DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성해보세요.
  2.생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 오른쪽 특성에 맞게 생성해보세요.
*/

CREATE TABLE DEPTSEQ
    AS SELECT * FROM DEPT;

CREATE SEQUENCE DEPTSEQ_SEQ
         MAXVALUE 99
         MINVALUE 1
         NOCYCLE
         NOCACHE
         ;
         
         
--CREATE SEQUENCE DEPTSEQ
--        INCREMENT BY 1
--        START WITH 1
--        MAXVALUE 99
--        MINVALUE 1
--        NOCYCLE
--        NOCACHE;

SELECT * FROM DEPTSEQ;

INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ , 'DATABASE' ,'SEOUL');

INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ , 'WEB' ,'BUSAN');

INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ , 'MOBILE' ,'ILSAN')

