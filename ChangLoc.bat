@echo off
setlocal enabledelayedexpansion

REM Define the user profile path and the new destination path
set "USERPROFILEPATH=C:\Users\%USERNAME%"
set "NEWDESTINATIONPATH=D:\Windows\Zeno"

REM List of directories to move
set "DIRECTORIES=Downloads Documents Videos Desktop Pictures"

REM Move directories and create symbolic links
for %%d in (%DIRECTORIES%) do (
    echo Moving %%d...
    if not exist "!NEWDESTINATIONPATH!\%%d" (
        robocopy "!USERPROFILEPATH!\%%d" "!NEWDESTINATIONPATH!\%%d" /MOVE /E
    )
    echo Creating symbolic link for %%d...
    if exist "!USERPROFILEPATH!\%%d" (
        rmdir "!USERPROFILEPATH!\%%d"
    )
    mklink /D "!USERPROFILEPATH!\%%d" "!NEWDESTINATIONPATH!\%%d"
)

echo All tasks completed successfully.
pause
