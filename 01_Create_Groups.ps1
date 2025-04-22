# Create security groups

$groups = @("Students", "Teachers", "Admins")

foreach ($group in $groups) {
    if (-not (Get-ADGroup -Filter "Name -eq '$group'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $group `
                    -SamAccountName $group `
                    -GroupScope Global `
                    -GroupCategory Security `
                    -Path "DC=iris,DC=com,DC=vn"
        Write-Host "Group '$group' has been created." -ForegroundColor Green
    } else {
        Write-Host "Group '$group' already exists. Skipping..." -ForegroundColor Yellow
    }
}
