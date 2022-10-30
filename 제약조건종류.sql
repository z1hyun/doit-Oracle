
--��������

/*
    NOT NULL | ������ ���� NULL�� ������� �ʴ´�.  NULL�������� �������� �ߺ��� ���
    UNIQUE | ������ ���� ������ ���� �������Ѵ�. �ߺ��Ұ� , �� NULL���� �ߺ����� ����
    PRIMARY KEY | ������ ���� ������ ���̸鼭  NULL�� ������� �ʴ´�. PRIMARY KEY�� ���̺� �ϳ��� ��������
    FOREIGN KEY | �ٸ� ���̺��� ���� �����Ͽ� �����ϴ� ���� �Է��� �� �ִ�.
    CHECK | ������ ���ǽ��� �����ϴ� �����͸� �Է� ����.
    
   -������ ���Ἲ�̶�?
    ������ ���Ἲ�� �����ͺ��̽��� ����Ǵ� �������� ��Ȯ���� �ϰ����� �����Ѵٴ� �ǹ�
    
   ���� ���Ἲ | ���� ����Ǵ� ���� ���� ���θ� Ȯ��, �ڷ���, ������ ������ ������, NULL ���ΰ��� ���� ���� ������ �����ϴ� ���������� ����
   ��ü ���Ἲ | ���̺� �����Ϳ� �����ϰ� �ĺ��� �� �ִ� �⺻Ű�� �ݵ�� ���� ������ �־���ϸ�, NULL�� �� �� ���� �ߺ��� ���� ������ ����
   ���� ���Ἲ | ���� ���̺��� �ܷ�Ű ���� ���� ���̺긣�� �⺻Ű�μ� �����ؾ��ϸ� NULL�� ����
*/

--���� ������� �ʴ� NOT NULL

--���̺� �����ÿ� NOT NULL�����ϱ�

CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL
   ,LOGIN_PWD VARCHAR2(20) NOT NULL
   ,TEL VARCHAR2(20)
   );
   
   DESC TABLE_NOTNULL;
   
--�������� Ȯ���ϱ�
/*
    OWNER | ���� ���� ���� ����
    CONSTRAINT_NAME | ���� ���� �̸�(���� �������� ���� ��� ����Ŭ�� �ڵ����� ������)
    CONSTRAINT_TYPE | ���� ���� ����
    C : CHECK,NOT NULL
    U : UNIQUE
    P: PRIMARY KEY
    R: FOREIGN KEY
   TABLRE_NAME | ���� ������ ������ ���̺� �̸�
*/
SELECT OWNER , CONSTRAINT_NAME , CONSTRAINT_TYPE , TABLE_NAME
FROM USER_CONSTRAINTS;

  CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL
   ,LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL
   ,TEL VARCHAR2(20)
  );

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--�̹� ������ ���̺� ���� ���� ����

--TEL ���� NOT NULL���� ���� �߰��ϱ�
ALTER TABLE TABLE_NOTNULL
MODIFY (TEL NOT NULL);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

--������ ���̺� ���� ���� �̸� ���� �����ؼ� �߰��ϱ�.

--���� ���ǿ� �̸� �����ؼ� �߰��ϱ�
ALTER TABLE TABLE_NOTNULL2
MODIFY (TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

SELECT OWNER , CONSTRAINT_NAME, CONSTRAINT_TYPE , TABLE_NAME
FROM USER_CONSTRAINTS;

DESC TABLE_NOTNULL2;

ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TEL_NN;


SELECT OWNER , CONSTRAINT_NAME, CONSTRAINT_TYPE , TABLE_NAME
FROM USER_CONSTRAINTS;

