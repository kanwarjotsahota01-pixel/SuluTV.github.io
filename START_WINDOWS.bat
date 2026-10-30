@echo off
setlocal
cd /d "%~dp0"
echo.
echo ===============================================
echo             FLIXJP TV - Windows
echo ===============================================
echo.
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is missing. Install Node.js 22 LTS first.
  pause
  exit /b 1
)
if not exist ".env" (
  copy ".env.example" ".env" >nul
  echo Created .env file. EDIT .env with your private ADMIN_PASSWORD and SESSION_SECRET before using Owner Studio.
)
if not exist "node_modules" (
  echo Installing project packages...
  call npm install
  if errorlevel 1 (
    echo Package installation failed. Check your internet connection and retry.
    pause
    exit /b 1
  )
)
echo Starting FLIXJP TV...
echo Open http://localhost:5173 in your browser.
echo Press Ctrl+C to stop.
call npm run dev
pause
