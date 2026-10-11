@ECHO off

ECHO For byte size/capacity guide:
ECHO 2 Gigabyte (GB)    = 2,147,483,648 bytes
ECHO 4 Gigabyte (GB)    = 4,294,967,296 bytes
ECHO 8 Gigabyte (GB)    = 8,589,934,592 bytes
ECHO 16 Gigabyte (GB)   = 17,179,869,184 bytes
ECHO.
ECHO Motherboard
WMIC BASEBOARD LIST BRIEF
::ECHO "--------------------"

ECHO CPU
WMIC CPU LIST BRIEF
::ECHO "--------------------"

ECHO Memory/RAM
WMIC MEMORYCHIP LIST BRIEF
::ECHO "--------------------"

ECHO Memory/RAM
WMIC DISKDRIVE LIST BRIEF
::ECHO "--------------------"

PAUSE