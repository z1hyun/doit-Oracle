--�� ���� ���� ��¥�� ���ϴ� ADD_MONTHS�Լ�
--ADD_MONTHS([��¥ ������(�ʼ�)] , [���� ���� ��(����)(�ʼ�)])

SELECT SYSDATE --2022/10/23 ���� 2:23:08 
      ,ADD_MONTHS(SYSDATE,3) --2023/01/23 ���� 2:23:08
    FROM DUAL;
    
