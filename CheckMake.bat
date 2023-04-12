@echo off

set dev_path=C:\Users\onedou\ParacraftAndroidDev\
set lock_file=%dev_path%CI\lock

:while

if exist %lock_file% (
    echo 执行中...

    call %dev_path%MakeApkCI.bat

    del %lock_file%
)

timeout /T 5

goto :while

