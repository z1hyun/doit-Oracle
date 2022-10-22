--��¥�����Ϳ� ����ϴ� ROUND / TRUNC�Լ�

/*
    ROUND([��¥������(�ʼ�)] , [�ݿø� ���� ����])
    TRUNC([��¥������(�ʼ�)] , [���� ���� ����])
*/

--ROUND�Լ��� ����Ͽ� ��¥ ������ ����ϱ�

SELECT SYSDATE
      ,ROUND(SYSDATE, 'CC') AS FORMAT_CC --2001/01/01
      ,ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY --2023/01/01
      ,ROUND(SYSDATE, 'Q') AS FORMAT_Q --2022/10/01
      ,ROUND(SYSDATE, 'DDD') AS FORMAT_DDD --2022/10/23
      ,ROUND(SYSDATE, 'HH') AS FORMAT_HH --2022/10/23 ���� 3:00:00
    FROM DUAL;
    
SELECT SYSDATE
      ,TRUNC(SYSDATE, 'CC') AS FORMAT_CC --2001/01/01
      ,TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY --2022/01/01
      ,TRUNC(SYSDATE, 'Q') AS FORMAT_Q --2022/10/01
      ,TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD --2022/10/23
      ,TRUNC(SYSDATE, 'HH') AS FORMAT_HH --2022/10/23 ���� 2:00:00
    FROM DUAL;