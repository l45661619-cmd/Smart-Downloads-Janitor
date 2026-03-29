Smart Downloads Janitor: Automated Folder Cleanup Script
This PowerShell script provides a safe and efficient way to manage the accumulation of old files in your Windows Downloads folder. Instead of permanent deletion, it archives inactive files to a designated folder on your Desktop.
Key Features
Time-Based Filtering: Automatically identifies files that have not been modified for more than 30 days.
Non-Destructive Archiving: Moves files to an "Unused Files" folder on the Desktop instead of deleting them, preventing accidental data loss.
Dynamic Unit Conversion: Calculates the total size of moved files and automatically displays the report in Megabytes (MB) or Gigabytes (GB).
Multi-Language Support: Detects system culture settings to provide status messages in either Russian or English.
Zero Footprint: If no old files are found, the script exits without creating unnecessary directories.
Why This Script is Safe
Open Source: Every line of code is transparent. There are no hidden network calls or obfuscated commands.
Local Execution: The script operates entirely on your local machine and does not require administrative privileges.
Reversibility: Since files are moved and not deleted, any action can be manually undone by moving files back from the Desktop folder.
Quick Start (One-Liner)

To download and run the script immediately without manual saving, paste this command into your PowerShell terminal:
```powershell
powershell -ExecutionPolicy Bypass -Command "iwr -useb 'https://raw.githubusercontent.com/l45661619-cmd/Smart-Downloads-Janitor/refs/heads/main/Smart%20Downloads%20Janitor.ps1' -OutFile '$env:TEMP\Cleanup.ps1'; & '$env:TEMP\Cleanup.ps1'"
```

Manual Installation
  1. Copy the script code into a text editor (e.g., Notepad).
  2. Save the file with a .ps1 extension (e.g., CleanupDownloads.ps1).
  3. Right-click the file and select "Run with PowerShell"
