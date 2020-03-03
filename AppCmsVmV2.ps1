# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Install Microsoft® SQL Server® CLR Types
# Source : https://www.microsoft.com/en-ie/download/details.aspx?id=42295
msiexec /i "https://github.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/raw/master/SQLSysClrTypes.msi" /qn /norestart

# Install Microsoft® SQL Server® 2014 Feature Pack
# Source : https://www.microsoft.com/en-ie/download/details.aspx?id=42295
msiexec /i "https://github.com/DOCOsoftDevelopmentTeam/Azure-ARM-Templates-Public/raw/master/SharedManagementObjects.msi" /qn /norestart
