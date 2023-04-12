@echo off

set flavor=%1
set dev=%2
set ver=%3
set runtime_assets=D:\code\NPLRuntimeCI\NPLRuntime\Platform\AndroidStudio\app\assets

echo CopyScriptCI-flavor:%flavor%
echo CopyScriptCI-dev:%dev%
echo CopyScriptCI-ver:%ver%

del %runtime_assets%\npl_packages\ParacraftBuildinMod.zip
del %runtime_assets%\main.pkg
del %runtime_assets%\main150727.pkg
del %runtime_assets%\assets_manifest.txt
del %runtime_assets%\version.txt
del %runtime_assets%\config.txt

curl -o %runtime_assets%\npl_packages\ParacraftBuildinMod.zip http://10.8.0.2/ParacraftBuildinMod.zip
curl -o %runtime_assets%\main.pkg http://10.8.0.2/main.pkg
curl -o %runtime_assets%\assets_manifest.txt http://10.8.0.2/assets_manifest.txt._P_E_0

if "%dev%" == "true" (
    curl -o %runtime_assets%\main150727.pkg http://10.8.0.2/main_dev.pkg
) else (
    curl -o %runtime_assets%\main150727.pkg http://10.8.0.2/main150727.pkg
)

set cmdline=cmdline=noupdate="true" debug="main" mc="true" bootstrapper="script/apps/Aries/main_loop.lua" android_flavor="%flavor%"
echo %cmdline% > %runtime_assets%\config.txt

echo ver=%ver% > %runtime_assets%\version.txt
