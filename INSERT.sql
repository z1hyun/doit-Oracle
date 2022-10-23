
--테이블에 데이터를 추가하는 INSERT문

/* 
  INSERT INTO 테이블 이름[(열1,열2, ...,열N)]
  VALUES (열 1에 들어갈 데이터, 열 2에 들어갈 데이터, ... ,  열N에 들어갈 데이터);
  */

INSERT INTO DEPT_TEMP (DEPTNO , DNAME, LOC)
    VALUES (50, 'DATABASE' , 'SEOUL');
    
SELECT * FROM DEPT_TEMP;


--INSERT문에 열 지정 없이 데이터 추가하기
INSERT INTO DEPT_TEMP
VALUES (60, 'NETWORK' , 'BUSAN');

SELECT * FROM DEPT_TEMP;

--테이블의 NULL 데이터 입력하기
--NULL의 명시적 입력
INSERT INTO DEPT_TEMP (DEPTNO , DNAME , LOC)
     VALUES (70 , 'WEB' , NULL);

SELECT * FROM DEPT_TEMP;

--NULL의 암시적 입력
INSERT INTO DEPT_TEMP(DEPTNO , LOC)
     VALUES (90 , 'INCHEON');
     
SELECT * FROM DEPT_TEMP;

--테이블에 날짜 데이터 입력하기

CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP
   WHERE 1<>1 ;

SELECT * FROM EMP_TEMP;

--위 쿼리는 테이블과 같은 열 구조를 가지지만 데이터는 복사하지 않고싶을때 종종사용함(급하게 테이블을 복사해야할때)
--WHERE 조건이 1<>1이기때문에 각 행을 조건식에 대입한 결과 값은 항상 false이기 때문에 행은 안만들어짐.

INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
      VALUES (9999, '홍길동' , 'PRESIDENT' , NULL , '2001/01/01', 5000, 1000, 10);

SELECT * FROM EMP_TEMP;
--날짜형식을 YYYY/MM/DD로 입력함


INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
      VALUES (1111, '성춘향' , 'MANAGER' , 9999 , '2001-01-05', 4000, NULL, 20);

SELECT * FROM EMP_TEMP;
--날짜형식을 YYYY-MM-DD로 입력함


/*
날짜데이터를 입력할때 
    년/월/일 순서와 반대료
    일/월/년 순서로 입력하면 다음과 같이 오류가 발생하고 데이터가 입력되지 않습니다.
*/

INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
     VALUES (2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001' , 'DD/MM/YYYY'), 4000, NULL,20);
--위에 퀴리들 처럼 문자열로 날짜를 입력하는 거보다 TO_DATE함수를 사용하는 것이 좋다.


INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
    VALUES (3111, '심청이' , 'MANAGER' , 9999, SYSDATE , 4000, NULL,30);

SELECT * FROM EMP_TEMP;

--서브쿼리를 사용하여 한번에 데이터 여러개 추가하기
INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
    SELECT E.EMPNO , E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
      FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE = 1;
    
SELECT * FROM EMP_TEMP;

/*
INSERT문에서 서브쿼리 사용할 때 유의할 점

1.VALUES절은 사용하지 않는다.
2.데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.
3.데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.
*/



     

