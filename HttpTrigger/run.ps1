using namespace System.Net

param($Timer)

# Get the current universal time in the default string format
$currentUTCtime = (Get-Date).ToUniversalTime()

# The 'IsPastDue' porperty is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"


# Define source, source contains the blob newly uploaded(with file name)
$SourceFullPath = ""

# Define dest, dest is only the full container name
$DestFullPath = ""


# del azcopy.exe and download lastest version of azcopy
# del azcopy.exe

# Test if AzCopy.exe exists in current folder
$AzcoypFile = "azcopy.exe"
$AzCopyExists = Test-Path $AzcoypFile
$YesterdayDate = (Get-Date).AddDays(-1).ToString('yyyy-MM-dd')         
$RootSitePath= "C:\local"
Write-Host "AzCopy exists:" $AzCopyExists
Write-Host "Available if you want from day:" $YesterdayDate

# Download AzCopy.zip and unzip if it doesn't exist
# If ($AzCopyExists -eq $False)
# {
#     Write-Host "AzCopy not found. Downloading..."
    
#     #Download AzCopy
#     Invoke-WebRequest -Uri "https://aka.ms/downloadazcopy-v10-windows" -OutFile AzCopy.zip -UseBasicParsing
 
#     #unzip azcopy
#     Write-Host "unzip azcopy.zip"
#     Expand-Archive ./AzCopy.zip ./AzCopy -Force

#     # Copy AzCopy to current dir
#     Get-ChildItem ./AzCopy/*/azcopy.exe | Copy-Item -Destination "./AzCopy.exe"
# }


# Run AzCopy from source blob to destination blob 

Write-Host "copy blob from  $($SourceFullPath) to  $($DestFullPath)"
$env:AZCOPY_JOB_PLAN_LOCATION = $RootSitePath
$env:AZCOPY_LOG_LOCATION = $RootSitePath


C:\home\site\wwwroot\azcopy.exe copy $SourceFullPath $DestFullPath --recursive=true