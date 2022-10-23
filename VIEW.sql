--VIEW ���̺�ó�� ����ϴ� ��
/*
�������̺�� �θ��� ��(view)�� �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT ���� ������ ��ü�� ���Ѵ�.
SELECT���� �����ϱ� ������ ������ �����͸� ���� ����X
*/

/*
���� ������(����)

1.���� : SELECT ���� ���⵵�� ��ȭ�ϱ� ����
2.���ȼ� : ���̺��� Ư�� ���� �����ϰ� ���� ���� ���

�� ����
��� CREATE������ ������ �� �ִ�.
SCOTT�������δ� �� ���� ������ �����Ƿ� SYSTEM�������� ������ �� ���� ��ɾ ����Ͽ� SCOTT������ ������ �ο��� �־���Ѵ�.
*/

--�� ���� �ִ� ��
--GRANT CREATE VIEW TO SCOTT;

/*�� �����ϴ� ��
  CREATE [OR REPLACE] [FORCE|NOFORCE] VIEW �� �̸�(�� �̸�1, �� �̸�2, ...)
        AS (������SELECT��)
  [WITH CHECK OPTION [CONSTRAINT ��������]]
  [WITH READ ONLY [CONSTRAINT ��������]];
*/

/*
   OR REPALCE : ���� �̸��� �䰡 �̹� ������ ��� ���� ������ ��� ��ü�Ͽ� ����(����)
   FORCE : �䰡 ������ SELECT���� ��� ���̺��� �������� �ʾƵ� ������ ����(����)
   NOFORCE : �䰡 ������ SELECT���� ��� ���̺��� ������ ��쿡�� ����(�⺻��)(����)
   �� �̸� : ������ �� �̸��� ����(�ʼ�)
   �� �̸�: SELECT���� ��õ� �̸� ��� ����� �� �̸� ����(���� ����)(����)
   ������ SELECT�� : ������ �信 ������ SELECT�� ����(�ʼ�)
   WITH CHECK OPTION : ������ ���� ������ �����ϴ� �����Ϳ� ���� DML�۾��� �����ϵ��� �� ����(����)
   WITH READ ONLY : ���� ����, SELECT�� �����ϵ��� �� ����(����)
  
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
VIEW������ ������ ����.����.���� �� ������ ���۾� ����� �����ϱ� �ϳ�
�並 ���� ������ ������ �����Ϸ��� ���� ���� ������ �����ؾ� �ϰ� ���̺��� ������ ��
������ ������ ������ �並 ���� ������ �������� ���� �������� ���� �����Ͱ� ������� �����Ƿ� ���� ����ϴ� �� Xz
*/



/* �ζ��� �� : SQL������ ��ȸ������ ���� ����ϴ� �並 �ζ��� ��(inline view)����Ѵ�.*/

SELECT ROWNUM , E.*
FROM(
SELECT * FROM EMP E
ORDER BY SAL DESC) E;

/** WITH�� ���**/
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E;
    
/* �ζ��� ��� TOP-N �����ϱ�(�������� ���) */
SELECT ROWNUM, E.*
    FROM( SELECT * FROM EMP E ORDER BY SAL DESC) E
WHERE ROWNUM <=3 ;

/* �ζ��� ��� TOP-N �����ϱ�(WITH�� ���) */
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E
WHERE ROWNUM <=3 ;

    
    