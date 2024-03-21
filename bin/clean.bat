@echo off
setlocal
chcp 65001 >nul

set BIN=%~dp0
set ROOT=%BIN%..\
set PROJ=Dialogos
set MINI=miniconda
set LOGS=Logs
set ML=ml-agents
set DIST=dist

echo.
echo 🚮 Starting cleanup process...
call :main
echo ✅ Cleanup process completed 🎭
echo.
endlocal
exit /b 0

:main
call :remove %ROOT%%DIST% "Distribution Directory"
call :remove %ROOT%%MINI% "Miniconda Directory"
call :remove %ROOT%%ML% "ML-Agents Directory"
call :remove %ROOT%%PROJ%\%LOGS% "Project Logs"
goto :eof

:remove
if exist %1 (
  echo Removing %2...
  for %%f in (%1*.exe) do (
    del /q %%f
  )
  for /d %%d in (%1*) do (
    rd /s /q %%d
  )
  echo %2 removed successfully.
) else (
  echo %2 not found or already removed. > nul
)
goto :eof
