@echo off
title StudySphere — AI Multi-Format Learning Studio
color 0b
echo ========================================================
echo   Starting StudySphere Server...
echo ========================================================
cd /d "%~dp0"

:: Free up port 8000 if occupied by any previous hung process
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :8000') do (
    taskkill /PID %%a /F >nul 2>&1
)

:: Wait 1 second and open browser
timeout /t 1 /nobreak >nul
start http://127.0.0.1:8000

echo Server running on http://127.0.0.1:8000 and http://localhost:8000
echo Press Ctrl+C in this window to stop the server.
echo ========================================================

:: Run using Python 3.13 on 127.0.0.1:8000
py -3.13 manage.py runserver 127.0.0.1:8000
if %errorlevel% neq 0 (
    python manage.py runserver 127.0.0.1:8000
)

pause
