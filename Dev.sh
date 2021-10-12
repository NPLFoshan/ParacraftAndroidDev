#!bin/bash

machine_username=$(whoami)
resource_path=/Users/$machine_username/Library/Containers/com.tatfook.paracraftmac/Data/Documents/Paracraft/files
merged_assets=$1

echo "Merging assets..."

cp $merged_assets/script/mainstate.lua $merged_assets/mainstate_backup.lua
cp -r $resource_path/dev/trunk/script/ $merged_assets/script
mv $merged_assets/mainstate_backup.lua $merged_assets/script/mainstate.lua

mkdir $merged_assets/dev
cp -r $resource_path/dev/WorldShare/ $merged_assets/dev/WorldShare
cp -r $resource_path/dev/ExplorerApp/ $merged_assets/dev/ExplorerApp
cp -r $resource_path/dev/DiffWorld/ $merged_assets/dev/DiffWorld

cp ./config.txt $merged_assets/config.txt

cp ./ParacraftBuildinMod.zip $merged_assets/npl_packages/ParacraftBuildinMod.zip

cp ./package.npl $merged_assets/dev/WorldShare/package.npl
cp ./package.npl $merged_assets/dev/ExplorerApp/package.npl
cp ./package.npl $merged_assets/dev/DiffWorld/package.npl