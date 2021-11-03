@echo off

echo "Merging assets..."

set resource_path=D:\code\ParaCraftSDK
set trunk_path=%resource_path%\..\trunk
set mod_path=%resource_path%\_mod\
set merged_assets=%1

echo %resource_path%
echo %trunk_path%
echo %mod_path%
echo %merged_assets%

copy %merged_assets%\script\mainstate.lua %merged_assets%\mainstate_backup.lua
xcopy %trunk_path%\script\ %merged_assets%\script /e/h/c/i
move %merged_assets%\mainstate_backup.lua %merged_assets%\script\mainstate.lua

mkdir %merged_assets%\dev
xcopy %mod_path%WorldShare\ %merged_assets%\dev\WorldShare\ /e/h/c/i
xcopy %mod_path%ExplorerApp\ %merged_assets%\dev\ExplorerApp\ /e/h/c/i
xcopy %mod_path%DiffWorld\ %merged_assets%\dev\DiffWorld\ /e/h/c/i

copy .\config.txt %merged_assets%\config.txt
copy .\ParacraftBuildinMod.zip %merged_assets%\npl_packages\ParacraftBuildinMod.zip

copy .\package.npl %merged_assets%\dev\WorldShare\package.npl
copy .\package.npl %merged_assets%\dev\ExplorerApp\package.npl
copy .\package.npl %merged_assets%\dev\DiffWorld\package.npl

exit /b %errorlevel%
