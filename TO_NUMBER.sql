--���� ������ ���� �����ͷ� ��ȯ�ϴ� TO_NUMBER
--TO_NUMBER('[���ڿ� ������(�ʼ�)]' , '[�νĵ� ��������(�ʼ�)]')


SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
   FROM DUAL; ---200

--SELECT '1,300' - '1,500'
--   FROM DUAL;--����