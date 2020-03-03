# Create a directory to store files required for setup
$setupFilePath = "D:\DOCOsoft\temp\SetupFiles"
new-Item -ItemType directory -Path $setupFilePath

# Download files to setup directory
$windowsFeaturesConfigFileName = "WindowsFeaturesConfig.xml"
$fullWindowsFeaturesConfigFileNamePath = [IO.Path]::Combine($setupFilePath, $windowsFeaturesConfigFileName)
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/master/AppCmsVmV2WindowsConfig.xml" -OutFile $fullWindowsFeaturesConfigFileNamePath

# Install Windows features
Install-WindowsFeature -ConfigurationFilePath $fullWindowsFeaturesConfigFileNamePath

# Install Microsoft® SQL Server® CLR Types
# Source : https://www.microsoft.com/en-ie/download/details.aspx?id=42295
$InstallMSI= "https://github.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/raw/master/SQLSysClrTypes.msi"
msiexec /i $InstallMSI /qn /norestart
Write-Output "Installing MS Report Viewer Runtime SQLSysClrTypes"
#Wait untill MSI Installer is done  
$StartInstallDate = (Get-Date)
$SucessfullInstall = $Null
do
{
    $SucessfullInstall = get-eventlog -logname application -after $StartInstallDate -Source "MSIInstaller" | where {$_.eventID -eq 11707} 
    Start-Sleep -Seconds 60
    Write-host "Waiting until $InstallMSI is installed"   
}
until ($SucessfullInstall)

# Install Microsoft® SQL Server® 2014 Feature Pack
# Source : https://www.microsoft.com/en-ie/download/details.aspx?id=42295
$InstallMSI= "https://github.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/raw/master/SharedManagementObjects.msi"
msiexec /i $InstallMSI /qn /norestart
Write-Output "Installing SharedManagementObjects"
#Wait untill MSI Installer is done  
$StartInstallDate = (Get-Date)
$SucessfullInstall = $Null
do
{
    $SucessfullInstall = get-eventlog -logname application -after $StartInstallDate -Source "MSIInstaller" | where {$_.eventID -eq 11707} 
    Start-Sleep -Seconds 60
    Write-host "Waiting until $InstallMSI is installed"   
}
until ($SucessfullInstall)


# Install Microsoft® SQL Server® 2012 Native Client - QFE
# Source : https://www.microsoft.com/en-us/download/details.aspx?id=50402
$InstallMSI= "https://github.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/raw/master/sqlncli.msi"
msiexec /i $InstallMSI IACCEPTSQLNCLILICENSETERMS=YES /qn /norestart
Write-Output "Installing sqlncli"
#Wait untill MSI Installer is done  
$StartInstallDate = (Get-Date)
$SucessfullInstall = $Null
do
{
    $SucessfullInstall = get-eventlog -logname application -after $StartInstallDate -Source "MSIInstaller" | where {$_.eventID -eq 11707} 
    Start-Sleep -Seconds 60
    Write-host "Waiting until $InstallMSI is installed"   
}
until ($SucessfullInstall)

# Install Microsoft Core XML Services (MSXML) 6.0
# Source : https://www.microsoft.com/en-ie/download/details.aspx?id=3988
$InstallMSI= "https://github.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/raw/master/msxml6_x64.msi"
msiexec /i $InstallMSI /qn /norestart
Write-Output "Installing msxml6_x64"
#Wait untill MSI Installer is done  
$StartInstallDate = (Get-Date)
$SucessfullInstall = $Null
do
{
    $SucessfullInstall = get-eventlog -logname application -after $StartInstallDate -Source "MSIInstaller" | where {$_.eventID -eq 11707} 
    Start-Sleep -Seconds 60
    Write-host "Waiting until $InstallMSI is installed"   
}
until ($SucessfullInstall)

