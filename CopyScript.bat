@echo off

set runtime_assets=D:\code\NPLRuntime\NPLRuntime\Platform\AndroidStudio\app\assets

del %runtime_assets%\npl_packages\ParacraftBuildinMod.zip
del %runtime_assets%\main.pkg
del %runtime_assets%\main150727.pkg
del %runtime_assets%\assets_manifest.txt
@REM rm %runtime_assets%\version.txt

curl -o %runtime_assets%\npl_packages\ParacraftBuildinMod.zip http://10.8.0.2/ParacraftBuildinMod.zip
curl -o %runtime_assets%\main.pkg http://10.8.0.2/main.pkg
curl -o %runtime_assets%\main150727.pkg http://10.8.0.2/main_dev.pkg
curl -o %runtime_assets%\assets_manifest.txt http://10.8.0.2/assets_manifest.txt._P_E_0
