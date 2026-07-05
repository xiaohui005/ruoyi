@echo off
setlocal
set "ROOT_DIR=%~dp0"
if "%ROOT_DIR:~-1%"=="\" set "ROOT_DIR=%ROOT_DIR:~0,-1%"
set "JAVA_EXE=C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot\bin\java.exe"
set "JAR_EXE=C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot\bin\jar.exe"
set "JAR_FILE=%ROOT_DIR%\yudao-server\target\yudao-server.jar"
set "OUT_LOG=%ROOT_DIR%\yudao-server-out.log"
set "ERR_LOG=%ROOT_DIR%\yudao-server-err.log"
set "LIB_ROOT=%ROOT_DIR%\.runtime\yudao-server-libs"

if not exist "%JAVA_EXE%" (
    echo [ERROR] Java executable not found:
    echo         %JAVA_EXE%
    exit /b 1
)

if not exist "%JAR_EXE%" (
    echo [ERROR] Jar executable not found:
    echo         %JAR_EXE%
    exit /b 1
)

if not exist "%JAR_FILE%" (
    echo [ERROR] Backend jar not found:
    echo         %JAR_FILE%
    exit /b 1
)

if not exist "%ROOT_DIR%\yudao-server\target\classes" (
    echo [ERROR] Backend classes directory not found:
    echo         %ROOT_DIR%\yudao-server\target\classes
    exit /b 1
)

if exist "%OUT_LOG%" del /f /q "%OUT_LOG%"
if exist "%ERR_LOG%" del /f /q "%ERR_LOG%"

if not exist "%LIB_ROOT%\BOOT-INF\lib" (
    mkdir "%LIB_ROOT%" >nul 2>nul
    pushd "%LIB_ROOT%"
    "%JAR_EXE%" xf "%JAR_FILE%" BOOT-INF/lib
    popd
)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$repo = '%ROOT_DIR%';" ^
  "$projectClasses = Get-ChildItem $repo -Directory -Recurse -Filter classes | Where-Object { $_.FullName -like '*\target\classes' } | Select-Object -ExpandProperty FullName;" ^
  "$cp = [string]::Join(';', $projectClasses) + ';' + (Join-Path '%LIB_ROOT%' 'BOOT-INF\lib\*');" ^
  "Start-Process -FilePath '%JAVA_EXE%' -ArgumentList '-cp', $cp, 'cn.iocoder.yudao.server.YudaoServerApplication', '--spring.profiles.active=local' -WorkingDirectory $repo -WindowStyle Hidden -RedirectStandardOutput '%OUT_LOG%' -RedirectStandardError '%ERR_LOG%'"

if errorlevel 1 (
    echo [ERROR] Failed to start backend process.
    exit /b 1
)
