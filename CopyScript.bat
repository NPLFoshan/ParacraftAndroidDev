@echo off

set sdk_path=C:\\Users\\onedou\\ParacraftAndroidDev
set dest_path=D:\\code\\NPLRuntime\\NPLRuntime\\Platform\\AndroidStudio\\app\\assets
set paracraft_build_in_mod_path=D:\\code\\ParacraftBuildinMod
set dev=C:\\Users\\onedou\\dev
set trunk_path=%dev%\\trunk
set paraengine=D:\\code\\ParaCraftSDK\\redist\\ParaEngineClient.exe
set boost_file=%sdk_path%\create_pkg.lua

pushd %trunk_path%
%sdk_path%\7z.exe a %dev%\main.zip .\ -xr!.git
popd

echo %boost_file%

echo NPL.load("(gl)script/ide/commonlib.lua");>%boost_file%
echo local filesPath = "%dev%";>>%boost_file%
echo local destPath = "%dest_path%";>>%boost_file%
echo local originFile = "%dev%\\main.zip";>>%boost_file%
echo local encryptFile = "%dest_path%\\main.pkg";>>%boost_file%
echo ParaAsset.GeneratePkgFile(originFile, encryptFile);>>%boost_file%
echo -- ParaIO.CopyFile(encryptFile, destPath .. "\\main.pkg", true);>>%boost_file%
echo ParaIO.DeleteFile(originFile);>>%boost_file%
echo --ParaIO.DeleteFile(encryptFile);>>%boost_file%
echo ParaIO.DeleteFile(filesPath .. "\\create_pkg.lua");>>%boost_file%
echo ParaGlobal.ExitApp();>>%boost_file%

call "%paraengine%" bootstrapper="%boost_file%"

del %boost_file%

exit 0
