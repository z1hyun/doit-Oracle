--���� �����͸� ��¥ �����ͷ� ��ȯ�ϴ� TO_DATE �Լ�
--TO_DATE('[���ڿ� ������(�ʼ�)]' , '[�νĵ� ��¥����(�ʼ�)]')

SELECT TO_DATE('2018-07-14' , 'YYYY-MM-DD') AS TODATE1 --2018/07/14
      ,TO_DATE('20180714' , 'YYYY-MM-DD') AS TODATE2 --2018/07/14
  FROM DUAL;
  
--�������� �������� ��¥ ������ ����ϱ�

SELECT TO_DATE('49/12/10' , 'YY/MM/DD') AS YY_YEAR_49 --2049/12/10
      ,TO_DATE('49/12/10' , 'RR/MM/DD') AS RR_YEAR_49 --2049/12/10
      ,TO_DATE('50/12/10' , 'YY/MM/DD') AS YY_YEAR_50 --2050/12/10
      ,TO_DATE('50/12/10' , 'RR/MM/DD') AS RR_YEAR_50 --1950/12/10
      ,TO_DATE('51/12/10' , 'YY/MM/DD') AS YY_YEAR_51 --2051/12/10
      ,TO_DATE('51/12/10' , 'RR/MM/DD') AS RR_YEAR_51 --1951/12/10
    FROM DUAL;
    