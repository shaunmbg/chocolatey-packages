$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#$url        = 'https://dn3.freedownloadmanager.org/6/latest/fdm_x86_setup.exe'
#$url64      = 'https://dn3.freedownloadmanager.org/6/latest/fdm_x64_setup.exe'

$packageArgs = @{
  packageName   = 'FreeDownloadManager'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
<<<<<<< HEAD:automatic/FreeDownloadManager/tools/chocolateyinstall.ps1
  softwareName  = 'FreeDownloadManager*'
=======
  softwareName  = 'free-download-manager*'
>>>>>>> 7ecb6b8408657c08cdcf6cf2ffcb6f58757094a7:automatic/free-download-manager/tools/chocolateyinstall.ps1
  checksum      = 'E1B01688127F770B66A06438A87C54EC36B85393F779CCAEFE1127A3DECC6E97'
  checksumType  = 'sha256'
  checksum64    = '0B25D54D3DFE34B510D032AF9EA3AD14C345B9B8C2509C17BF102CB1D52A3CAD'
  checksumType64= 'sha256'
  
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs










    








