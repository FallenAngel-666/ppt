@echo off
title Push EchoNet Presentation to GitHub
color 0B
echo =====================================================================
echo       EchoNet 3.0 Presentation - GitHub Push & Vercel Setup
echo =====================================================================
echo.
echo Your presentation repository is prepared and committed on the 'main' branch.
echo.
echo STEP 1: Go to GitHub (https://github.com/new) and create a new repository
echo         (e.g., named 'echonet-presentation'). Keep it empty (no README).
echo.
echo STEP 2: Paste your GitHub repository URL below (HTTPS or SSH):
echo         Example: https://github.com/your-username/echonet-presentation.git
echo.
set /p REPO_URL="Enter GitHub Repository URL: "

if "%REPO_URL%"=="" (
    echo Error: No URL provided. Exiting.
    pause
    exit /b
)

echo.
echo Adding remote origin: %REPO_URL%
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git branch -M main

echo.
echo Pushing code to GitHub...
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo =====================================================================
    echo [SUCCESS] Pushed to GitHub successfully!
    echo =====================================================================
    echo.
    echo NEXT STEP - DEPLOY ON VERCEL:
    echo 1. Go to https://vercel.com/new
    echo 2. Import your GitHub repository: '%REPO_URL%'
    echo 3. Framework Preset: Other / Static (root directory has index.html)
    echo 4. Click 'Deploy'!
    echo.
) else (
    echo.
    echo [NOTE] If git requested credentials, please authenticate in your browser.
)

pause
