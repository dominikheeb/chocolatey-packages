$toolsLocation = Get-ToolsLocation
$seleniumDir = "$toolsLocation\selenium"

If (Test-Path -Path $seleniumDir) {
  $driverPath = "$seleniumDir\IEDriverServer.exe"
  If (Test-Path -Path $driverPath) {
    Remove-Item -Path $driverPath -Force
  }

  $directoryInfo = Get-ChildItem -Path $seleniumDir | Measure-Object
  If ($directoryInfo.count -eq 0) {
    Remove-Item -Path $seleniumDir -Force
  }
}

If (Test-Path -Path "$($env:ChocolateyInstall)\bin\IEDriverServer.exe") {
  Uninstall-BinFile -Name 'IEDriverServer'
}

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutDir = "$menuPrograms\Selenium"

If (Test-Path -Path $shortcutDir) {
  $shortcutFile = "$shortcutDir\Selenium Internet Explorer Driver.lnk"
  If (Test-Path -Path $shortcutFile) {
    Remove-Item -Path $shortcutFile -Force
  }

  $directoryInfo = Get-ChildItem -Path $shortcutDir | Measure-Object
  If ($directoryInfo.count -eq 0) {
    Remove-Item -Path $shortcutDir -Force
  }
}
