

--�ε��� ��������

--EMP ���̺��� SAL ���� �ε����� �����ϱ�
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);

--�����ε���
CREATE INDEX IDX_NAME ON EMP(SAL);

--���� �ε��� / �����ε���

/*
- �ΰ� �̻� ���� ��������� �ε���
- WHERE���� �� ���� AND �������� ���̴� ���
*/
CREATE INDEX IDX_NAME ON EMP(SAL,ENAME);

--���� �ε���
/*
- ���� �ߺ� �����Ͱ� ������ ���
- UNIQUEŰ���带 �������� ������ ����� �ε����� �⺻��
*/
CREATE INDEX IDX_NAME ON EMP(EMPNO);

--�Լ� ��� �ε���
/* 
- ���� ����� ���� ������ ������ ����� ����� �ε��� ����
*/
CREATE INDEX IDX_NAME ON EMP(SAL*12 + COMM);

--��Ʈ�� �ε���
/*
-������ ������ ���� ���� �����Ͱ� ���� ������ �� �ַ� ���
*/
CREATE BITMAP INDEX IDX_NAME ON EXP(JOB);

--�ε��� ����
--DROP INDEX �ε��� �̸�;
DROP INDEX IDX_NAME;

--������ �ε��� �������
SELECT * FROM USER_IND_COLUMNS;
