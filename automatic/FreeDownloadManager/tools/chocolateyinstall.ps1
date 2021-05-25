$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dn3.freedownloadmanager.org/6/latest/fdm_x86_setup.exe'
$url64      = 'https://dn3.freedownloadmanager.org/6/latest/fdm_x64_setup.exe'

$packageArgs = @{
  packageName   = 'FreeDownloadManager'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'FreeDownloadManager*'
  checksum      = '8B4A0D5046B7105C78C63BA80FCA15C55DD3352BAFB7182596221F2DC3C3235F'
  checksumType  = 'sha256'
  checksum64    = '1F1F91A9FA76BD784560229C18AC8C1476EA7E69A8340F5B8FF00691533BCFDC'
  checksumType64= 'sha256'
  
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs










    








