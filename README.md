# PowershellRAMDISK
Create RAMDISKs natively in Windows Server using Powershell

## About
This script can be used to create RAMDISKs (disks that are stored in RAM) on Windows Server 2012 R2 and Windows Server 2016.

## Important

Before using this script make sure that you have the following roles installed:

1 .File and Storage Services > File and iSCSI Services > iSCSI Target Server
2. File and Storage Services > File and iSCSI Services > iSCSI Target Storage Provider


## Usage

./createRAMDISK.ps1 -ip [ip address of the server] -size [size in GB]
