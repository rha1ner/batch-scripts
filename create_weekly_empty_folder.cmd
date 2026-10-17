@echo off
setlocal enabledelayedexpansion

:: ==============================================================================
:: CONFIGURATION: Set your target directory here.
:: Leave it blank or set to current folder (.) if you want it created where 
:: the script is run. Use quotes if your path contains spaces.
:: Examples: 
::   set "TARGET_DIR=C:\Users\YourUsername\Documents\MyFolders"
::   set "TARGET_DIR=D:\Logs\2026"
:: ==============================================================================
set "TARGET_DIR=."

:: Verify or create the target directory if it doesn't exist
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

:: Get the date of Monday for the current week (DayOfWeek = 1)
for /f "usebackq tokens=*" %%a in (`powershell -NoProfile -Command "$d = Get-Date; $monday = $d.AddDays([int][DayOfWeek]::Monday - [int]$d.DayOfWeek); $monday.ToString('yyyyMMdd')"`) do (
    set MONDAY=%%a
)

echo Creating folders in: %TARGET_DIR%
echo ----------------------------------------

:: Loop from Day 0 (Monday) to Day 5 (Saturday)
for /l %%i in (0,1,5) do (
    for /f "usebackq tokens=*" %%d in (`powershell -NoProfile -Command "$m = [datetime]::ParseExact('%MONDAY%', 'yyyyMMdd', $null); $m.AddDays(%%i).ToString('MM-dd-yy')"`) do (
        set FOLDER_NAME=%%d
        set "FULL_PATH=%TARGET_DIR%\!FOLDER_NAME!"
        
        if not exist "!FULL_PATH!" (
            mkdir "!FULL_PATH!"
            echo Created: !FULL_PATH!
        ) else (
            echo Already exists: !FULL_PATH!
        )
    )
)

echo ----------------------------------------
echo Done!
pause