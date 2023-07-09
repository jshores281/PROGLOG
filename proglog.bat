@echo off
goto :main
:: add if new month (creates new file with month name and year, set persistent env var of month/year)


::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:main
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Development Progress Logging
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo  _____  _____   ____   _____ _      ____   _____
echo ^|  __ \^|  __ \ / __ \ / ____^| ^|    / __ \ / ____^|
echo ^| ^|__) ^| ^|__) ^| ^|  ^| ^| ^|  __^| ^|   ^| ^|  ^| ^| ^|  __
echo ^|  ___/^|  _  /^| ^|  ^| ^| ^| ^|_ ^| ^|   ^| ^|  ^| ^| ^| ^|_ ^|
echo ^| ^|    ^| ^| \ \^| ^|__^| ^| ^|__^| ^| ^|___^| ^|__^| ^| ^|__^| ^|
echo ^|_^|    ^|_^|  \_\\____/ \_____^|______\____/ \_____^|
echo.                                                 
echo.

goto :menu


:dir_set
echo Current dir: %proglog_dir%
echo.
echo Set proglog dir.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 1. Local  
echo 2. Remote
echo 3. Manual
echo 4. skip
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
set /p dir="> "


if %dir%==1 (
  echo Local directory was selected
  set proglog_dir="C:\users\%username%\Documents\proglog_CURRENT.txt"
)

:: do a connection check
if %dir%==2 (
  echo Remote directory was selected
  set /p remote_dir="Type NAS full path and file: "
  set proglog_dir="%remote_dir%"
)

if %dir%==3 (
  echo Manual directory was selected
  echo Type path where to store proglog:
  set /p proglog_dir="> "
)

if %dir%==4 (
  goto :menu
)

goto :menu


:menu
echo.
echo Current dir: %proglog_dir%
echo.
echo Choose from the menu.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 0. Set directory
echo 1. Add a time_piece note  
echo 2. Open time_piece notes
echo 3. Read all time_piece notes
echo 4. Create a new time_piece file
echo 5. Exit
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
set /p choice="> "

if %choice%==0 goto :dir_set
if %choice%==1 goto :note
if %choice%==2 goto :editor
if %choice%==3 goto :reader
if %choice%==4 goto :New_file
if %choice%==5 goto :EO
goto :EO



::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:note
setlocal EnableDelayedExpansion
echo.
echo Enter notes:
set /p proglog=" "

echo ------------------------------------- >> %proglog_dir%
echo last working directory: >> %proglog_dir%
echo %cd% >> %proglog_dir%
echo %date% >> %proglog_dir%
echo %time% >> %proglog_dir%
echo. >> %proglog_dir%
echo !proglog! >> %proglog_dir%
echo. >> %proglog_dir%
echo. >> %proglog_dir%
echo ------------------------------------- >> %proglog_dir%
echo.
setlocal DisableDelayedExpansion
echo Entry saved!

goto :add_note



::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:editor
echo.
set /p choice="Open editor? [y]/[n]: "
:: ADD ERROR HANDLING FEATURE
if %choice% == y (
  sublime %proglog_dir%
  goto :add_note
) else (
  goto :main
)
 

::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:reader
type %proglog_dir%
pause
goto :main





::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:add_note
echo.
set /p loopend="Add another note? [y]/[n]: "

if %loopend% == y (
  goto :note
) else (
  goto :main
)


::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:New_file
echo.
echo yet to be implemented
echo.
pause
goto :main


 
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:EO
echo.
echo Have a good time, Joshua!
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




















rem @echo off
rem goto :main
rem :: add if new month (creates new file with month name and year, set persistent env var of month/year)


rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem :main
rem echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem echo Development Progress Logging
rem echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem echo.
rem echo  _____  _____   ____   _____ _      ____   _____
rem echo ^|  __ \^|  __ \ / __ \ / ____^| ^|    / __ \ / ____^|
rem echo ^| ^|__) ^| ^|__) ^| ^|  ^| ^| ^|  __^| ^|   ^| ^|  ^| ^| ^|  __
rem echo ^|  ___/^|  _  /^| ^|  ^| ^| ^| ^|_ ^| ^|   ^| ^|  ^| ^| ^| ^|_ ^|
rem echo ^| ^|    ^| ^| \ \^| ^|__^| ^| ^|__^| ^| ^|___^| ^|__^| ^| ^|__^| ^|
rem echo ^|_^|    ^|_^|  \_\\____/ \_____^|______\____/ \_____^|
rem echo.                                                 
rem echo.
rem set proglog_dir="C:\Users\%username%\Documents\0-NOTES\BULBS\proglog_CURRENT.txt"

rem echo Current dir: %proglog_dir%
rem echo.
rem echo Choose from the menu.
rem echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem echo 1. Add a time_piece note
rem echo 2. Open time_piece notes
rem echo 3. Read all time_piece notes
rem echo 4. Create a new time_piece file
rem echo 5. Exit
rem echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem echo.
rem set /p choice="> "

rem if %choice%==1 goto :note
rem if %choice%==2 goto :editor
rem if %choice%==3 goto :reader
rem if %choice%==4 goto :New_file
rem if %choice%==5 goto :EO
rem goto :EO



rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem :note
rem setlocal EnableDelayedExpansion
rem echo.
rem echo Enter notes:
rem set /p proglog=" "
rem echo ------------------------------------- >> %proglog_dir%
rem echo last working directory: >> %proglog_dir%
rem echo %cd% >> %proglog_dir%
rem echo %date% >> %proglog_dir%
rem echo %time% >> %proglog_dir%
rem echo. >> %proglog_dir%
rem echo !proglog! >> %proglog_dir%
rem echo. >> %proglog_dir%
rem echo. >> %proglog_dir%
rem echo ------------------------------------- >> %proglog_dir%
rem echo Entry saved!
rem goto :add_note



rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem :editor
rem echo.
rem set /p choice="Open editor? [y]/[n]: "

rem if %choice% == y (
rem   sublime %proglog_dir%
rem   goto :add_note
rem ) else (
rem   goto :main
rem )
 

rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem :reader
rem type %proglog_dir%
rem pause
rem goto :main





rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem :add_note
rem echo.
rem set /p loopend="Add another note? [y]/[n]: "

rem if %loopend% == y (
rem   goto :note
rem ) else (
rem   goto :main
rem )


rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem :New_file
rem echo.
rem echo yet to be implemented
rem echo.
rem pause
rem goto :main


 
rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem :EO
rem echo.
rem echo Have a good time, Joshua!
rem ::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
