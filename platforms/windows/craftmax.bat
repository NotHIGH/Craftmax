@echo off
setlocal

set "GAME_DIR=%~dp0..\.."
for %%I in ("%GAME_DIR%") do set "GAME_ID=%%~nxI"
for %%I in ("%GAME_DIR%\..") do set "GAME_PARENT=%%~fI"

if "%CRAFTMAX_ENGINE%"=="" (
    set "ENGINE=luanti.exe"
) else (
    set "ENGINE=%CRAFTMAX_ENGINE%"
)

"%ENGINE%" --gamespath "%GAME_PARENT%" --gameid "%GAME_ID%" %*