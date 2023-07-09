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
echo 3. Manual/new file
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
  echo type NAS server to connect to:
  set /p remote_dir=
  net use "%remote_dir%"
  echo set full path with file to read/write:
  set /p proglog_dir=
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
echo 0. Set directory/new file
echo 1. Add a time_piece note  
echo 2. Open time_piece notes
echo 3. Read all time_piece notes
echo 4. Exit
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
set /p choice="> "

if %choice%==0 goto :dir_set
if %choice%==1 goto :note
if %choice%==2 goto :editor
if %choice%==3 goto :reader
if %choice%==4 goto :EO
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
:EO
echo.
echo Have a good time!
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~