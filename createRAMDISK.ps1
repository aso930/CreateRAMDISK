
#Prerequisites:
#Tested only on Windows Server 2012 R2 and Windows Server 2016
#The following roles need to be installed on the server:
#File and Storage Services > File and iSCSI Services > iSCSI Target Server
#File and Storage Services > File and iSCSI Services > iSCSI Target Storage Provider

param (
    [Parameter(Mandatory=$True)][string]$ip,
    [Parameter(Mandatory=$True)][number]$size
)


New-iscsivirtualdisk -path ramdisk:RAMDISK1.vhdx -size ($size)GB
New-IscsiServerTarget Target1 -InitiatorId IPAddress:$ip
Add-IscsiVirtualDiskTargetMapping -TargetName Target1 -Path ramdisk:RAMDISK1.vhdx -Lun 1
Start-Service msiscsi
New-IscsiTargetPortal -TargetPortalAddress $ip
Get-IscsiTarget | Connect-IscsiTarget
Get-IscsiConnection | Get-Disk | Set-Disk -IsOffline $False
Get-IscsiConnection | Get-Disk | Initialize-Disk -PartitionStyle MBR
Get-IscsiConnection | Get-Disk | New-Partition -UseMaximumSize -AssignDriveLetter
