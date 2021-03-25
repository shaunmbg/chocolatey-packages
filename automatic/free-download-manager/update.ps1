import-module au
. $PSScriptRoot\..\_scripts\all.ps1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"     = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
        }

        #"$($Latest.PackageName).nuspec" = @{
        #    "(\<releaseNotes\>).*(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        #}

		
    }
	
	#@{
	#	FileName      = $fileName
	#	PackageName	  = $packageName
	#	#Checksum32    = $Checksum32
	#	#Checksum64    = $Checksum64
	#}
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_GetLatest {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $download_page = Invoke-WebRequest https://www.freedownloadmanager.org/download.htm

	$version = ($download_page.AllElements | Where{$_.class -eq "version"}).innerText | Select-String -Pattern '\d+\.\d+\.\d+' | % { $_.Matches } | % { $_.Value }

	$url64   = $download_page.Links | Foreach {$_.href } | Select-String -Pattern 'fdm_x64_setup.exe' | ForEach-Object {$_ -Replace "\/\/", "http://"}
	$url   = $download_page.Links | Foreach {$_.href } | Select-String -Pattern 'fdm_x86_setup.exe' | ForEach-Object {$_ -Replace "\/\/", "http://"}

	#$fileName

    @{
        Version      = $version
        URL32        = $url
        URL64        = $url64
		#Checksum	 = $checksum
		#Checksum64	 = $checksum64
    }
}

#"{0} test output" -f $package.Name, $module.Name, $module.Version
#au_GetLatest

update -ChecksumFor all
