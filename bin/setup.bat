@echo off
cls
setlocal
call :set_variables
call :download_miniconda
call :install_miniconda
call :create_conda_env
endlocal
goto :eof

:set_variables
set BIN=%~dp0
set ROOT=%BIN%..\
set PROJ=Dialogos
set ENV_FILE=environment.yml
set ENV=%ROOT%%ENV_FILE%
set MINICONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
set MINICONDA=miniconda
set MINICONDA_EXE=%MINICONDA%.exe
set MINICONDA_PATH=%ROOT%%MINICONDA%\
set CONDA=%ROOT%%MINICONDA%\Scripts\conda
set DOCTOR=%BIN%doctor.bat
goto :eof

:download_miniconda
if exist %MINICONDA_PATH% (
    goto :eof
) else (
    echo Downloading miniconda...
    echo.
    call curl %MINICONDA_URL% -o %BIN%%MINICONDA_EXE%
    echo.
)
goto :eof

:install_miniconda
if exist %BIN%%MINICONDA_EXE% (
    echo Installing miniconda...
    start /wait "" %BIN%%MINICONDA_EXE% /InstallationType=JustMe /RegisterPython=0 /S /Q /D=%MINICONDA_PATH%
    echo.
) else (
    echo Error: missing %MINICONDA_EXE%
    echo.
	exit /b 1
)
goto :eof

:create_conda_env
echo Creating the conda environment...
call %CONDA% env create -n %PROJ% -f %ENV% --quiet
call %CONDA% init powershell
call %MINICONDA_PATH%\Scripts\activate %PROJ%
echo.
goto :eof
