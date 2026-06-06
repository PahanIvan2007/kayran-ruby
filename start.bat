@echo off
chcp 65001 >nul
echo ============================================
echo   Kairan - Запуск сервера
echo ============================================
echo.
ruby bin\rails server -b 0.0.0.0 -p 3000
pause
