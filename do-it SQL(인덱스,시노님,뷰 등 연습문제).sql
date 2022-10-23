/*
   1.EMP ���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� ����� ������.
   2.������ EMPIDX ���̺��� EMPNO���� IDX_EMPIDX_EMPNO �ε����� ����� ������.
   3.���������� �ε����� �� �����Ǿ����� ������ ������ ���� �並 ���� Ȯ���غ�����.
*/

CREATE TABLE EMPIDX
    AS SELECT * FROM EMP;

SELECT * FROM EMPIDX;

CREATE INDEX IDX_EMPIDX_EMPNO
 ON EMPIDX(EMPNO);
 
 SELECT * FROM USER_IND_COLUMNS;
 

/*
���� 1������ ������ EMPIDX ���̺��� ������ �� �޿�(SAL)�� 1500 �ʰ��� ����鸸 ����ϴ� EMPIDX_OVER15K �並 �����غ�����.
�� �̸��� ���� �䰡 �̹� ������ ��쿡 ���ο� �������� ��ü �����ؾ� �մϴ�.
EMPIDX_OVER15K ��� ��� ��ȣ, ��� �̸�, ��å, �μ� ��ȣ, �޿� �߰� ���� ���� ������ �ִ�.
�߰� ���� ���� ��쿡 �߰� ������ �����ϸ� O,�������� ������ X�� ����Ѵ�.
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
  1.DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��غ�����.
  2.������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� ������ Ư���� �°� �����غ�����.
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

