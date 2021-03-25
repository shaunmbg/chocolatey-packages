$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dn3.freedownloadmanager.org/6/latest/fdm_x86_setup.exe'
$url64      = 'https://dn3.freedownloadmanager.org/6/latest/fdm_x64_setup.exe'

$packageArgs = @{
  packageName   = 'free-download-manager'
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'free-download-manager*'
  checksum      = '567F60961EFDEB26CECC21D86CFF00098E6D797B49AF879F8D00705C7CC40C4A'
  checksumType  = 'sha256'
  checksum64    = '68CBCA0096F7BA2A5E30DC4A3DFA6790FC1FD99E72E512D757A6348F4160C019'
  checksumType64= 'sha256'
  
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs










    








