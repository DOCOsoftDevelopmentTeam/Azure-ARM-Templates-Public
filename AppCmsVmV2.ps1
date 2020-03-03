# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Install SQL CLR Types
msiexec /i "https://github.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/raw/master/SQLSysClrTypes.msi" /qn /norestart
