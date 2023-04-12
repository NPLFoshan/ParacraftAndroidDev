@echo off

set dev_path=C:\Users\onedou\ParacraftAndroidDev\

for /F %%i in ('type %dev_path%CI\lock') do ( set content=%%i )

echo %content%

for /f "tokens=1,2,3 delims=:" %%a in ( "%content%" ) do (
    set c1=%%a
    set c2=%%b
    set c3=%%c
)

echo flavor:%c1%
echo dev:%c2%
echo ver:%c3%

echo copy CI.....
call %dev_path%CopyScriptCI.bat %c1% %c2% %c3%

echo update NPLRuntime...
pushd D:\code\NPLRuntimeCI\NPLRuntime\Platform\AndroidStudio

git stash
git pull lixizhi cp_old
git stash pop

echo make apk...
./gradlew.bat assemble%c1%Release

popd

