--��¥,���� �����͸� ���� �����ͷ� ��ȯ�ϴ� TO_CHAR�Լ�
--TO_CHAR([��¥������(�ʼ�)],'[��µǱ� ���ϴ� ���� ����(�ʼ�)];)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð� --2022/10/23 02:45:27
    FROM DUAL;
   

SELECT SYSDATE
      ,TO_CHAR(SYSDATE, 'MM') AS MM --10 
      ,TO_CHAR(SYSDATE, 'MON') AS MON --10��
      ,TO_CHAR(SYSDATE, 'MONTH') AS MONTH --10��
      ,TO_CHAR(SYSDATE, 'DD') AS DD --23
      ,TO_CHAR(SYSDATE, 'DY') AS DY --��
      ,TO_CHAR(SYSDATE, 'DAY') AS DAY --�Ͽ���
    FROM DUAL;  
    
    
--���� ������ ������ �����Ͽ� ����ϱ�

SELECT '48000' 
      ,TO_CHAR(48000, '$999,999') AS SAL_$ --$48,000
      ,TO_CHAR(48000, 'L999,999') AS SAL_L --��48,000
      ,TO_CHAR(48000, '999,999.00') AS SAL_1 --48,000.00
      ,TO_CHAR(48000, '000,999,999,00') AS SAL_2 --000,000,480,00
      ,TO_CHAR(48000, '000999999.99') AS SAL_3 --000048000.00
      ,TO_CHAR(48000, '999,999,00') AS SAL_4 --480,00
    FROM DUAL;