@echo off
chcp 65001 >nul

set BIN=%~dp0
set ROOT=%BIN%..\
set RUN=run.py
set ENV_NAME=Dialogos
set PROJ_NAME=%ENV_NAME%Engine
set SILENT_MODE=0

:parse_args
if "%1" == "--silent" set SILENT_MODE=1 & shift & goto parse_args

echo.
echo 🔄 Initializing environment...
if not exist "%ROOT%miniconda\Scripts\conda.exe" (
    if %SILENT_MODE% == 1 (
        call "%BIN%setup.bat"
        exit /b
    ) else (
        echo Miniconda is not installed.& echo.& echo Please press any key to run setup.bat.
        pause >nul
        call "%BIN%setup.bat"
        exit /b
    )
)

call %ROOT%miniconda\Scripts\conda init powershell
echo 🐍 Activating Conda environment '%ENV_NAME%'...
call %ROOT%miniconda\Scripts\activate %ENV_NAME%

python -c "import art" 2>nul || (
    if %SILENT_MODE% == 1 (
        call "%BIN%setup.bat"
        exit /b
    ) else (
        echo The 'art' module is not installed in the '%ENV_NAME%' environment.& echo.& echo Please press any key to run setup.bat to install required dependencies.
        pause >nul
        call "%BIN%setup.bat"
        exit /b
    )
)

echo 📥 Verifying Miniconda...
echo ✅ Environment setup READY!
echo.
python %BIN%%RUN%

call conda deactivate
