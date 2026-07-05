@echo off
setlocal

set "ROOT_DIR=%~dp0"
if "%ROOT_DIR:~-1%"=="\" set "ROOT_DIR=%ROOT_DIR:~0,-1%"

set "BACKEND_BAT=%ROOT_DIR%\start-yudao-server-local.bat"
set "BACKEND_JAR=%ROOT_DIR%\yudao-server\target\yudao-server.jar"
set "FRONTEND_DIR=%ROOT_DIR%\yudao-ui\yudao-ui-admin-vue3\yudao-ui-admin-vue3"
set "FRONTEND_CMD=cd /d ""%FRONTEND_DIR%"" && pnpm dev"

set "DRY_RUN="
if /i "%~1"=="--dry-run" set "DRY_RUN=1"

if not exist "%BACKEND_BAT%" (
    echo [ERROR] Backend start script not found:
    echo         %BACKEND_BAT%
    exit /b 1
)

if not exist "%BACKEND_JAR%" (
    echo [ERROR] Backend jar not found:
    echo         %BACKEND_JAR%
    echo [HINT] Build the backend first, for example:
    echo        mvn -pl yudao-server -am clean package -Dmaven.test.skip=true
    exit /b 1
)

if not exist "%FRONTEND_DIR%\package.json" (
    echo [ERROR] Frontend directory not found:
    echo         %FRONTEND_DIR%
    exit /b 1
)

where pnpm >nul 2>nul
if errorlevel 1 (
    echo [ERROR] pnpm was not found in PATH.
    echo [HINT] Install pnpm 8.6.0+ and reopen the terminal.
    exit /b 1
)

if defined DRY_RUN (
    echo [DRY-RUN] call "%BACKEND_BAT%"
    echo [DRY-RUN] start "Yudao UI" cmd /k "%FRONTEND_CMD%"
    exit /b 0
)

echo [INFO] Starting backend...
call "%BACKEND_BAT%"
if errorlevel 1 (
    echo [ERROR] Backend start script failed.
    exit /b 1
)

echo [INFO] Starting frontend in a new terminal window...
start "Yudao UI" cmd /k "%FRONTEND_CMD%"
if errorlevel 1 (
    echo [ERROR] Failed to open the frontend terminal window.
    exit /b 1
)

echo [OK] Backend and frontend start commands were triggered.
echo [INFO] Backend logs:
echo        %ROOT_DIR%\yudao-server-out.log
echo        %ROOT_DIR%\yudao-server-err.log
exit /b 0
