
/*
EMPNO열에는 EMP테이블에서 사원 이름(ENAME)이 다섯 글자 이상이며 여섯 글자 미만인 사원 정보를 출력함
MASKING_EMPNO 열에는 사원번호(EMPNO)앞 두 자리 외 뒷 자리를 * 기호로 출력함
MASKING_ENAME 열에는 사원 이름의 첫 글자만 보여주고 나머지글자수 만큼* 기호로 출력하세요.
*/

SELECT EMPNO , RPAD(SUBSTR(EMPNO , 0,2) , LENGTH(EMPNO) , '*') MASKING_EMPNO ,  ENAME , RPAD(SUBSTR(ENAME , 0 ,1) , LENGTH(ENAME), '*') MASKING_ENAME 
FROM EMP
WHERE LENGTH(ENAME) BETWEEN 5 AND 6;

/*
EMP테이블에서 사원들의 월 평균 근무일 수는 21.5일입니다. 하루 근무 시간을 8시간으로 보았을때
사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다.
하루급여는 소수젬 세번째자리에서 버리고, 시급은 두번째 소수점 자리에서 반올림한다.
*/

SELECT EMPNO , ENAME , , SAL 
FROM EMP;

/*
EMP테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫월요일에 정직원이된다.
사원들이 정직원이 되는 날짜를 YYYY-MM-DD형식으로 오른쪽과 같이 출력해주세요.
추가수당(COMM)이 없는애들의 추가수당은 N/A로 출력해라
*/

SELECT EMPNO , ENAME , HIREDATE  , NEXT_DAY(ADD_MONTHS(HIREDATE, 3) , '월요일') R_JOB , NVL(TO_CHAR(COMM), 'N/A') COMM
FROM EMP;

/*
EMP테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR열에 출력해라
-직속상관의 사원 번호가 존재하지 않을 경우 :0000
-직속상관의 사원 번호가 앞 두자리가 75일 경우 : 5555
-직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
-직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
-직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
-그 외 직속 상관 사원번호의 경우 : 본래 직속 상관의 사원 번호 그대로 출력
*/

SELECT EMPNO 
     , ENAME 
     , MGR 
     , CASE WHEN TO_CHAR(MGR) IS NULL THEN '0000' 
            WHEN TO_CHAR(MGR) LIKE '75%' THEN '5555'
            WHEN TO_CHAR(MGR) LIKE '76%' THEN '6666'
            WHEN TO_CHAR(MGR) LIKE '77%' THEN '7777'
            WHEN TO_CHAR(MGR) LIKE '78%' THEN '8888'
            ELSE TO_CHAR(MGR) END AS CHG_MGR
FROM EMP;

