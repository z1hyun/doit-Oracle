
--SCOTT �������� ��� ������ ������ ���� ���캸��
SELECT * FROM DICT;

--USER_���ξ ���� ������ ����
SELECT TABLE_NAME
  FROM USER_TABLES;
  
--ALL ���ξ ���� ������ ����
--SCOTT ������ ����� �� �ִ� ��ü ���� ���캸��

SELECT OWNER, TABLE_NAME
  FROM ALL_TABLES;
--OWNER���� ���̺��� ������ ����ڸ� ����Ѵ�.

/*
OWNER VARCHAR2(30) NOT NULL ���̺��� ������ �����(ALL_TABLES������ ����)
TABLE_NAME VARCHAR2(30) NOT NULL ���̺��̸�
TABLESPACE_NAME VHARCHAR2(30) NULL��� ���̺� �����̽� �̸�
NUM_ROWS NUMBER ���̺� ����� �� ��
*/

--SCOTT �������� DBA_���ξ� ����ϱ�
SELECT * FROM DBA_TABLES;
--DBA_ ���ξ ���� ������ ������ �����ͺ��̽����� ������ ���� ����ڸ� ��ȸ�� �� �ִ� ���̺�� SCOTT�������δ� ��ȼ �̤���.