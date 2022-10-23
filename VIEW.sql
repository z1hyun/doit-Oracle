--VIEW 테이블처럼 사용하는 뷰
/*
가상테이블로 부르는 뷰(view)는 하나 이상의 테이블을 조회하는 SELECT 문을 저장한 객체를 뜻한다.
SELECT문을 저장하기 때문에 물리적 데이터를 따로 저장X
*/

/*
뷰의 사용목적(편리성)

1.편리성 : SELECT 문의 복잡도를 완화하기 위해
2.보안성 : 테이블의 특정 열을 노출하고 싶지 않을 경우

뷰 생성
뷰는 CREATE문으로 생성할 수 있다.
SCOTT계정으로는 뷰 생성 권한이 없으므로 SYSTEM계정으로 접속한 후 다음 명령어를 사용하여 SCOTT계정에 권한을 부여해 주어야한다.
*/

--뷰 권한 주는 법
--GRANT CREATE VIEW TO SCOTT;

/*뷰 생성하는 법
  CREATE [OR REPLACE] [FORCE|NOFORCE] VIEW 뷰 이름(열 이름1, 열 이름2, ...)
        AS (저장할SELECT문)
  [WITH CHECK OPTION [CONSTRAINT 제약조건]]
  [WITH READ ONLY [CONSTRAINT 제약조건]];
*/

/*
   OR REPALCE : 같은 이름의 뷰가 이미 존재할 경우 현재 생성할 뷰로 대체하여 생성(선택)
   FORCE : 뷰가 저장할 SELECT문의 기반 테이블이 존재하지 않아도 강제로 생성(선택)
   NOFORCE : 뷰가 저장할 SELECT문의 기반 테이블이 존재할 경우에만 생성(기본값)(선택)
   뷰 이름 : 생성할 뷰 이름을 지정(필수)
   열 이름: SELECT문에 명시된 이름 대신 사용할 열 이름 지정(생략 가능)(선택)
   저장할 SELECT문 : 생성할 뷰에 저장할 SELECT문 지정(필수)
   WITH CHECK OPTION : 지정한 제약 조건을 만족하는 데이터에 한해 DML작업이 가능하도록 뷰 생성(선택)
   WITH READ ONLY : 뷰의 열람, SELECT만 가능하도록 뷰 생성(선택)
  
*/

CREATE VIEW VIEW_VM_EMP20
    AS (SELECT EMPNO, ENAME , JOB, DEPTNO
            FROM EMP
        WHERE DEPTNO = 20);
        
SELECT * FROM USER_VIEWS;

SELECT VIEW_NAME, TEXT_LENGTH, TEXT
FROM USER_VIEWS;

SELECT * FROM VIEW_VM_EMP20;

DROP VIEW VIEW_VM_EMP20;

/*
VIEW에서도 데이터 삽입.수정.삭제 등 데이터 조작어 사용이 가능하긴 하나
뷰를 통한 데이터 조작이 가능하려면 여러 가지 조건을 만족해야 하고 테이블을 설계할 때
누락된 내용이 있으면 뷰를 통한 데이터 조작으로 인해 적합하지 않은 데이터가 생길수도 있으므로 자주 사용하는 편 Xz
*/



/* 인라인 뷰 : SQL문에서 일회성으로 만들어서 사용하는 뷰를 인라인 뷰(inline view)라고한다.*/

SELECT ROWNUM , E.*
FROM(
SELECT * FROM EMP E
ORDER BY SAL DESC) E;

/** WITH절 사용**/
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E;
    
/* 인라인 뷰로 TOP-N 추출하기(서브쿼리 사용) */
SELECT ROWNUM, E.*
    FROM( SELECT * FROM EMP E ORDER BY SAL DESC) E
WHERE ROWNUM <=3 ;

/* 인라인 뷰로 TOP-N 추출하기(WITH절 사용) */
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E
WHERE ROWNUM <=3 ;

    
    