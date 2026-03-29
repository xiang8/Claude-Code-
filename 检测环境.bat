@echo off
cls

echo ========================================
echo    Environment Check Tool
echo ========================================
echo.

echo [1/2] Checking Node.js...
echo.

node --version >nul 2>&1
set NODE_RESULT=%errorlevel%

echo [2/2] Checking Git for Windows...
echo.

git --version >nul 2>&1
set GIT_RESULT=%errorlevel%

cls
echo ========================================
echo    Environment Check Result
echo ========================================
echo.

if %NODE_RESULT% equ 0 (
    echo [OK] Node.js: Installed
    echo    Version:
    node --version
) else (
    echo [X] Node.js: Not Installed
)

echo.

if %GIT_RESULT% equ 0 (
    echo [OK] Git for Windows: Installed
    echo    Version:
    git --version
) else (
    echo [X] Git for Windows: Not Installed
)

echo.
echo ========================================
echo.

if %NODE_RESULT% equ 0 (
    if %GIT_RESULT% equ 0 (
        echo [SUCCESS] Both installed! Ready to install Claude Code
        echo.
        echo Close this window and continue with the tutorial
    ) else (
        echo [WARNING] Node.js installed, but Git missing
        echo.
        echo Close this window and install Git first
    )
) else (
    echo [ERROR] Node.js not installed
    echo.
    echo Close this window and install Node.js first
)

echo.
echo ========================================
echo.
pause
