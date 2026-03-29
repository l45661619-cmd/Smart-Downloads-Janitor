$downloads = "$env:USERPROFILE\Downloads"
$desktop = [Environment]::GetFolderPath("Desktop")
$target = Join-Path $desktop "Неиспользуемые файлы"
$days = 30

$oldFiles = Get-ChildItem -Path $downloads -File | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$days)
}

if ($oldFiles.Count -gt 0) {
    if (!(Test-Path $target)) {
        New-Item -ItemType Directory -Path $target | Out-Null
    }

    $fileCount = $oldFiles.Count
    $totalSizeBytes = ($oldFiles | Measure-Object -Property Length -Sum).Sum

    if ($totalSizeBytes -ge 1GB) {
        $sizeValue = [Math]::Round($totalSizeBytes / 1GB, 2)
        $sizeUnit = "GB"
    } else {
        $sizeValue = [Math]::Round($totalSizeBytes / 1MB, 2)
        $sizeUnit = "MB"
    }

    $oldFiles | Move-Item -Destination $target

    $lang = $env:LANG
    if (-not $lang) { $lang = (Get-Culture).TwoLetterISOLanguageName }

    switch ($lang) {
        "ru" {
            $message = @"
Все неиспользуемые файлы найдены и перемещены в папку на рабочем столе!
Количество файлов: $fileCount
Вес файлов: $sizeValue $sizeUnit
"@
        }
        default {
            $message = @"
All unused files were found and moved to a folder on your Desktop!
File count: $fileCount
Total size: $sizeValue $sizeUnit
"@
        }
    }

    Start-Process cmd -ArgumentList "/k echo $message"
}