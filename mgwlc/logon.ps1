
Write-Host "Masta Ghimau's Windows Logon Counter (MGWLC)"
$year = Read-Host "Enter the year"

$loginCounts = @{}

# Event ID 4624
$events = Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4624 -and $_.TimeCreated.Year -eq [int]$year }

$userCounts = @{}

$events | ForEach-Object {
    $eventMonth = Get-Date $_.TimeCreated -Format "MMMM"
    if ($loginCounts.ContainsKey($eventMonth)) {
        $loginCounts[$eventMonth]++
    } else {
        $loginCounts[$eventMonth] = 1
    }
}

$sortedMonths = $loginCounts.GetEnumerator() | Sort-Object -Property @{Expression={[DateTime]::ParseExact($_.Name, 'MMMM', $null)}}

# Calculate the logon threshold as the maximum count plus 10% rounded to the nearest hundred
$maxCount = $sortedMonths | Measure-Object -Property Value -Maximum | Select-Object -ExpandProperty Maximum
$logonThreshold = [math]::Ceiling($maxCount * 1.1 / 100) * 100

$computerName = "$env:computername"
$computer = [ADSI]"WinNT://$computerName,computer" 
$localUsers = $computer.psbase.Children | Where-Object { $_.psbase.schemaclassname -eq 'user' }
$userCount = $localUsers.Count

Write-Host "[+] Server Name: $computerName"
Write-Host "[+] User's Count: $userCount"
Write-Host "[+] User's List:"
Write-Host ""

$localUsers | ForEach-Object {
    $username = $_.Name
    Write-Host "        - $username"
}

Write-Host ""
Write-Host "[+] Logon Threshold: $logonThreshold"
Write-Host ""
Write-Host "[+] Login Count:"

Write-Host "Month`t`tCounts"
Write-Host "------------------------"
$sortedMonths | ForEach-Object {
    $month = $_.Name
    $count = $_.Value
    Write-Host ("{0,-20}{1}" -f $month, $count)
}
