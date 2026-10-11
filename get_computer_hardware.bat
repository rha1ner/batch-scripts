@echo off

:: CONSTANT DO NOT CHANGE
SET step_number=0

:: Can be changed depending on the total number of hardware (NUMBER)
SET total_steps=4

SET /A step_number+=1
ECHO [%step_number%/%total_steps%] Getting Motherboard Information...
ECHO ====================================================================================================================================
WMIC BASEBOARD LIST BRIEF

SET /A step_number+=1
ECHO [%step_number%/%total_steps%] Getting CPU Information...
ECHO ====================================================================================================================================
WMIC CPU LIST BRIEF

SET /A step_number+=1
ECHO [%step_number%/%total_steps%] Getting RAM Information...
ECHO ====================================================================================================================================
WMIC MEMORYCHIP LIST BRIEF

SET /A step_number+=1
ECHO [%step_number%/%total_steps%] Getting Disk Drive Information...
ECHO ====================================================================================================================================
WMIC DISKDRIVE LIST BRIEF

PAUSE