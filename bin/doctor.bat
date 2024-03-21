@echo off
chcp 65001 >nul

set BIN_PATH=%~dp0
set ROOT_PATH=%BIN_PATH%..
set ENV_NAME=Dialogos
set PROJ_NAME=%ENV_NAME%Engine
set MINICONDA_PATH=%ROOT_PATH%\miniconda\
set CONDA_BIN_PATH=%MINICONDA_PATH%condabin\
set CONDA_CMD=%CONDA_BIN_PATH%conda
set SETUP_FILE=%BIN_PATH%setup.bat
set RUN_FILE=%BIN_PATH%run.py
set /a ERROR_COUNT=0

if "%1"=="--help" (
	echo.
    echo Usage: doctor.bat [OPTION]
    echo.
    echo Options:
    echo   --check    Check the current setup for any issues.
    echo   --fix      Attempt to fix any issues found in the setup.
    echo   --help     Display this help message and exit.
    echo.
    exit /b
)

echo.
call :check_project_folder
call :check_miniconda_folder
call :check_conda_folder
call :check_run_folder
call :report
exit /b

if "%1"=="--check" (
    goto :report
)

:fix_errors
if "%1"=="--fix" (
    if %ERROR_COUNT% gtr 0 (
        echo 🚫 There were %ERROR_COUNT% errors in the installation and setup of the previous batch file.
        call %SETUP_FILE%
        echo.
    )
)
goto :exit

:check_project_folder
if not exist %ROOT_PATH%\%PROJ_NAME% (
    echo 🚫 Project folder not found: %ROOT_PATH%\%PROJ_NAME%
    set /a ERROR_COUNT+=1
) 2>nul
goto :eof

:check_miniconda_folder
if not exist %MINICONDA_PATH% (
    echo 🚫 Miniconda folder not found: %MINICONDA_PATH%
    set /a ERROR_COUNT+=1
) 2>nul
goto :eof

:check_conda_folder
call %CONDA_CMD% info --envs | findstr /C:"%ENV_NAME%" >nul 2>nul
if errorlevel 1 (
    echo 🚫 Conda environment not activated: %ENV_NAME%
    set /a ERROR_COUNT+=1
) 2>nul
goto :eof

:check_run_folder
if not exist %RUN_FILE% (
    echo 🚫 Run.py file not found: %RUN_FILE%
    set /a ERROR_COUNT+=1
) 2>nul
goto :eof

:report
if %ERROR_COUNT% equ 0 (
    echo ✅ Everything is set up correctly 🎭
) else (
    echo 🚫 There are %ERROR_COUNT% issues detected with the setup.
)
echo.
echo    Current Batch File Variables:
echo        BIN_PATH=%BIN_PATH%
echo        ROOT_PATH=%ROOT_PATH%
echo        PROJ_NAME=%PROJ_NAME%
echo        MINICONDA_PATH=%MINICONDA_PATH%
echo        CONDA_BIN_PATH=%CONDA_BIN_PATH%
echo        CONDA_CMD=%CONDA_CMD%
echo        SETUP_FILE=%SETUP_FILE%
echo        RUN_FILE=%RUN_FILE%
echo        ERROR_COUNT=%ERROR_COUNT%
echo.
goto :exit

:exit
exit /b %ERROR_COUNT%

:eof
