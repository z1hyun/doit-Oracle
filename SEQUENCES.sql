--�������� ����Ŭ �����ͺ��̽����� Ư�� ��Ģ�� �´� ���� ���ڸ� �����ϴ� ��ü.

/*������ ������
  CREATE SEQUENCE ������ �̸�
  [INCREMENT BY n] : ���������� ������ ��ȣ�� ���� �� (�⺻���� 1) (����)
  [START WITH n] : ���������� ������ ��ȣ�� ���� �� (�⺻���� 1) (����) 
  [MAXVALUE n | NOMAXVALUE] : ���������� ������ ��ȣ�� �ִ� ����, �ִ��� ���� ��(START WITH) �̻�, �ּڰ�(MINVALUE)�� �ʱ������� ����. NOMXVALUE�� �����Ͽ��� �ܿ� ���������̸� 10, ���������� ��� -1�� ����(����)
  [MINVALUE n | NOMUNVALUE] : ���������� ������ ��ȣ�� �ּڰ� ����, �ּڰ��� ���� ��(START WITH)����, �ִ�(MAXVALUE) �̸� ������ ����. NOMINVALUE�� �����Ͽ��� ��� ���������̸� 1, �������̸� -10���� ����(����)
  [CYCLE | NOCYCLE] : ���������� ������ ��ȣ�� �ִ�(MAXVALUE)�� �������� ��� CYCLE�̸� ���� ��(START WITH)���� �ٽ� ����, NOCYCLE�̸� ��ȣ ������ �ߴܵǰ�, �߰� ��ȣ ������ ��û�ϸ� ���� �߻�(����)
  [CACHE n | NOCACHE] : �������� ������ ��ȣ�� �޸𸮿� �̸� �Ҵ��� ���� ���� ����, NOCACHE�� �̸� �������� �ʵ��� ���� �ɼ��� ��� �����ϸ� �⺻���� 20(����)
*/

CREATE TABLE DEPT_SEQUENCE
    AS SELECT * FROM DEPT
        WHERE 1 <> 1;
SELECT * FROM DEPT_SEQUNCE;

--����������  10���� �����ؼ� 10�� ���� 
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
   INCREMENT BY 10
   START WITH 10
   MAXVALUE 90
   MINVALUE 0
   NOCYCLE
   CACHE 2;
   
--������ Ȯ���ϱ�
SELECT * FROM USER_SEQUENCES;

--���������� ������ ������ ����� INSERT��
INSERT INTO DEPT_SEQUENCE(DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE' , 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--���� ���������� ������ ������ Ȯ���ϱ�
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

--���������� ������ ������ �ݺ� ����Ͽ� INSERT�� �����ϱ�
INSERT INTO DEPT_SEQUENCE (DEPTNO , DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE' ,'SEOUL'); --9�� INSERT�Ѵ�.

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--������ �ִ� 90�� ������ �� �ٽ� INSERT���� �����ϸ� �������� ��ȣ�� �� �������� ���ؼ� ������.


--������ ����
/*
ALTER SEQUENCE ������ �̸�
[INCREMENT BY n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
*/

--�տ��� ������ �������� SEQ_DEPT_SEQUENCE�� �ִ��� 99, ���� ���� 3, �׸��� NOCYCLE��� CYCLE�ɼ��� �ش�.
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
   INCREMENT BY 3
   MAXVALUE 99
   CYCLE;
   
INSERT INTO DEPT_SEQUENCE (DEPTNO , DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE' ,'SEOUL'); 

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;--DEPTNO�� 93�� �����Ͱ� ����.
--�ִ񰪱��� ���� �� ��� INSERT�ؼ� �������� Ȯ���ϸ� �ּҰ�0���� �ٽ� 3�� ������ �����ؼ� �����Ͱ� ����

--������ ����
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

SELECT * FROM USER_SEQUENCES;