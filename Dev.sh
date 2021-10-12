#!bin/bash

machine_username=$(whoami)
resource_path=/Users/$machine_username/Library/Containers/com.tatfook.paracraftmac/Data/Documents/Paracraft/files
merged_assets=$1

echo "Merging assets..."

cp -r $resource_path/dev $merged_assets/dev
cp ./config.txt $merged_assets/config.txt

cp ./package.npl $merged_assets/dev/trunk/package.npl
cp ./package.npl $merged_assets/dev/WorldShare/package.npl
cp ./package.npl $merged_assets/dev/ExplorerApp/package.npl
cp ./package.npl $merged_assets/dev/DiffWorld/package.npl