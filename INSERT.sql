
--���̺� �����͸� �߰��ϴ� INSERT��

/* 
  INSERT INTO ���̺� �̸�[(��1,��2, ...,��N)]
  VALUES (�� 1�� �� ������, �� 2�� �� ������, ... ,  ��N�� �� ������);
  */

INSERT INTO DEPT_TEMP (DEPTNO , DNAME, LOC)
    VALUES (50, 'DATABASE' , 'SEOUL');
    
SELECT * FROM DEPT_TEMP;


--INSERT���� �� ���� ���� ������ �߰��ϱ�
INSERT INTO DEPT_TEMP
VALUES (60, 'NETWORK' , 'BUSAN');

SELECT * FROM DEPT_TEMP;

--���̺��� NULL ������ �Է��ϱ�
--NULL�� ����� �Է�
INSERT INTO DEPT_TEMP (DEPTNO , DNAME , LOC)
     VALUES (70 , 'WEB' , NULL);

SELECT * FROM DEPT_TEMP;

--NULL�� �Ͻ��� �Է�
INSERT INTO DEPT_TEMP(DEPTNO , LOC)
     VALUES (90 , 'INCHEON');
     
SELECT * FROM DEPT_TEMP;

--���̺� ��¥ ������ �Է��ϱ�

CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP
   WHERE 1<>1 ;

SELECT * FROM EMP_TEMP;

--�� ������ ���̺�� ���� �� ������ �������� �����ʹ� �������� �ʰ������ ���������(���ϰ� ���̺��� �����ؾ��Ҷ�)
--WHERE ������ 1<>1�̱⶧���� �� ���� ���ǽĿ� ������ ��� ���� �׻� false�̱� ������ ���� �ȸ������.

INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
      VALUES (9999, 'ȫ�浿' , 'PRESIDENT' , NULL , '2001/01/01', 5000, 1000, 10);

SELECT * FROM EMP_TEMP;
--��¥������ YYYY/MM/DD�� �Է���


INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
      VALUES (1111, '������' , 'MANAGER' , 9999 , '2001-01-05', 4000, NULL, 20);

SELECT * FROM EMP_TEMP;
--��¥������ YYYY-MM-DD�� �Է���


/*
��¥�����͸� �Է��Ҷ� 
    ��/��/�� ������ �ݴ��
    ��/��/�� ������ �Է��ϸ� ������ ���� ������ �߻��ϰ� �����Ͱ� �Էµ��� �ʽ��ϴ�.
*/

INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
     VALUES (2111, '�̼���', 'MANAGER', 9999, TO_DATE('07/01/2001' , 'DD/MM/YYYY'), 4000, NULL,20);
--���� ������ ó�� ���ڿ��� ��¥�� �Է��ϴ� �ź��� TO_DATE�Լ��� ����ϴ� ���� ����.


INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
    VALUES (3111, '��û��' , 'MANAGER' , 9999, SYSDATE , 4000, NULL,30);

SELECT * FROM EMP_TEMP;

--���������� ����Ͽ� �ѹ��� ������ ������ �߰��ϱ�
INSERT INTO EMP_TEMP (EMPNO , ENAME, JOB, MGR, HIREDATE , SAL, COMM, DEPTNO)
    SELECT E.EMPNO , E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
      FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE = 1;
    
SELECT * FROM EMP_TEMP;

/*
INSERT������ �������� ����� �� ������ ��

1.VALUES���� ������� �ʴ´�.
2.�����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ�ؾ� �Ѵ�.
3.�����Ͱ� �߰��Ǵ� ���̺��� �ڷ����� ���������� �ڷ����� ��ġ�ؾ� �Ѵ�.
*/



     

