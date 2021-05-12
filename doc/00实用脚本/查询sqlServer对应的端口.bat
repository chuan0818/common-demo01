@echo off

:: 核心 netstat -ano ^| findstr %portKeyWord%  过滤出符合条件的服务的进程ID
color 0A
title 查询SqlServer端口

rem (由于启动了变量延迟，所以批处理能够感知到动态变化，即不是先给该行变量赋值，而是在运行过程中给变量赋值)
setlocal enabledelayedexpansion;

set searchKeyWord=sqlservr

:: 查询符合条件的进程的进程id
rem  mysqld.exe                     640 Services                   0      1,508 K
for /f "tokens=2" %%a in ('tasklist ^| findstr %searchKeyWord%') do (
	set pid=%%a
    :: 参考 bat SET中替换字符串 set pid=%pid:,=%  替换","符号为空
    set pid=!pid:,=!
	echo "netstat -ano | findstr !pid!"
	netstat -ano | findstr !pid!
)

echo 脚本执行完成,请按任意键退出!
rem 暂停窗口
pause>nul
@echo on