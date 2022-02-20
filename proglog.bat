@echo off
echo WELCOME TO YOUR NEW DAILY PROGRESS LOGGER
echo.
echo.
echo enter all productivities into this program to review progress later
:: add option to make new temp location for prog log



:: default_location

:: cd "C:\Users\%username%\Documents\NOTES"
echo. >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
echo.
echo.
echo ---------------------------------------------------------- >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
echo ---------------------------------------------------------- >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
echo %cd% >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
echo.
echo.
echo.
echo %date% >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
echo %time% >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
echo.
echo.
echo. >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
:: ADDING NEW INPUTS AT TOP OF TXT FILE
::call notepad dailylog.txt
:: copy existing file to a temporary file
::copy c:\temp\existing.txt c:\temp\temp.txt
:: replace content with your new value
::echo test >c:\temp\existing.txt
::  append content of temp file
::for /F %%i in (c:\temp\temp.txt) do echo %%i >> c:\temp\existing.txt
:: remove tempfile
::del c:\temp\temp.txt

set /p proglog="enter what you did: "
echo %proglog% >> "C:\Users\%username%\Documents\NOTES\proglog.txt"
notepad "C:\Users\%username%\Documents\NOTES\proglog.txt"
:: make sentense breaks
::if %dailylog% == %dailylog% echo %dailylog% >> dailylog.txt

::log checker
echo entry has been logged
echo. 
echo.
echo goodnight
echo. 
echo.
