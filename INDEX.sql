

--인덱스 생성쿼리

--EMP 테이블의 SAL 열에 인덱스를 생성하기
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);

--단일인덱스
CREATE INDEX IDX_NAME ON EMP(SAL);

--복합 인덱스 / 결합인덱스

/*
- 두개 이상 열로 만들어지는 인덱스
- WHERE절의 두 열이 AND 연산으로 묶이는 경우
*/
CREATE INDEX IDX_NAME ON EMP(SAL,ENAME);

--고유 인덱스
/*
- 열에 중복 데이터가 없을때 사용
- UNIQUE키워드를 지정하지 않으면 비고유 인덱스가 기본값
*/
CREATE INDEX IDX_NAME ON EMP(EMPNO);

--함수 기반 인덱스
/* 
- 열에 산술식 같은 데이터 가공이 진행된 결과로 인덱스 생성
*/
CREATE INDEX IDX_NAME ON EMP(SAL*12 + COMM);

--비트맵 인덱스
/*
-데이터 종류가 적고 같은 데이터가 많이 존재할 때 주로 사용
*/
CREATE BITMAP INDEX IDX_NAME ON EXP(JOB);

--인덱스 삭제
--DROP INDEX 인덱스 이름;
DROP INDEX IDX_NAME;

--생성된 인덱스 살펴버기
SELECT * FROM USER_IND_COLUMNS;
