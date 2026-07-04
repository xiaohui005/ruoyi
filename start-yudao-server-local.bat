@echo off
setlocal
set "JAVA_EXE=C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot\bin\java.exe"
set "JAR_FILE=D:\gongju\six6\ruoyi-vue-pro\yudao-server\target\yudao-server.jar"
set "OUT_LOG=D:\gongju\six6\ruoyi-vue-pro\yudao-server-out.log"
set "ERR_LOG=D:\gongju\six6\ruoyi-vue-pro\yudao-server-err.log"

if exist "%OUT_LOG%" del /f /q "%OUT_LOG%"
if exist "%ERR_LOG%" del /f /q "%ERR_LOG%"

start "" /b "%JAVA_EXE%" -jar "%JAR_FILE%" --spring.profiles.active=local 1>"%OUT_LOG%" 2>"%ERR_LOG%"
