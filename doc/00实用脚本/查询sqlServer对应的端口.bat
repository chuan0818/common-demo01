@echo off

:: ���� netstat -ano ^| findstr %portKeyWord%  ���˳����������ķ���Ľ���ID
color 0A
title ��ѯSqlServer�˿�

rem (���������˱����ӳ٣������������ܹ���֪����̬�仯���������ȸ����б�����ֵ�����������й����и�������ֵ)
setlocal enabledelayedexpansion;

set searchKeyWord=sqlservr

:: ��ѯ���������Ľ��̵Ľ���id
rem  mysqld.exe                     640 Services                   0      1,508 K
for /f "tokens=2" %%a in ('tasklist ^| findstr %searchKeyWord%') do (
	set pid=%%a
    :: �ο� bat SET���滻�ַ��� set pid=%pid:,=%  �滻","����Ϊ��
    set pid=!pid:,=!
	echo "netstat -ano | findstr !pid!"
	netstat -ano | findstr !pid!
)

echo �ű�ִ�����,�밴������˳�!
rem ��ͣ����
pause>nul
@echo on