
/*
EMPNO������ EMP���̺��� ��� �̸�(ENAME)�� �ټ� ���� �̻��̸� ���� ���� �̸��� ��� ������ �����
MASKING_EMPNO ������ �����ȣ(EMPNO)�� �� �ڸ� �� �� �ڸ��� * ��ȣ�� �����
MASKING_ENAME ������ ��� �̸��� ù ���ڸ� �����ְ� ���������ڼ� ��ŭ* ��ȣ�� ����ϼ���.
*/

SELECT EMPNO , RPAD(SUBSTR(EMPNO , 0,2) , LENGTH(EMPNO) , '*') MASKING_EMPNO ,  ENAME , RPAD(SUBSTR(ENAME , 0 ,1) , LENGTH(ENAME), '*') MASKING_ENAME 
FROM EMP
WHERE LENGTH(ENAME) BETWEEN 5 AND 6;

/*
EMP���̺��� ������� �� ��� �ٹ��� ���� 21.5���Դϴ�. �Ϸ� �ٹ� �ð��� 8�ð����� ��������
������� �Ϸ� �޿�(DAY_PAY)�� �ñ�(TIME_PAY)�� ����Ͽ� ����� ����Ѵ�.
�Ϸ�޿��� �Ҽ��� ����°�ڸ����� ������, �ñ��� �ι�° �Ҽ��� �ڸ����� �ݿø��Ѵ�.
*/

SELECT EMPNO , ENAME , , SAL 
FROM EMP;

/*
EMP���̺��� ������� �Ի���(HIREDATE)�� �������� 3������ ���� �� ù�����Ͽ� �������̵ȴ�.
������� �������� �Ǵ� ��¥�� YYYY-MM-DD�������� �����ʰ� ���� ������ּ���.
�߰�����(COMM)�� ���¾ֵ��� �߰������� N/A�� ����ض�
*/

SELECT EMPNO , ENAME , HIREDATE  , NEXT_DAY(ADD_MONTHS(HIREDATE, 3) , '������') R_JOB , NVL(TO_CHAR(COMM), 'N/A') COMM
FROM EMP;

/*
EMP���̺��� ��� ����� ������� ���� ����� ��� ��ȣ(MGR)�� ������ ���� ������ �������� ��ȯ�ؼ� CHG_MGR���� ����ض�
-���ӻ���� ��� ��ȣ�� �������� ���� ��� :0000
-���ӻ���� ��� ��ȣ�� �� ���ڸ��� 75�� ��� : 5555
-���ӻ���� ��� ��ȣ �� ���ڸ��� 76�� ��� : 6666
-���ӻ���� ��� ��ȣ �� ���ڸ��� 77�� ��� : 7777
-���ӻ���� ��� ��ȣ �� ���ڸ��� 78�� ��� : 8888
-�� �� ���� ��� �����ȣ�� ��� : ���� ���� ����� ��� ��ȣ �״�� ���
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

