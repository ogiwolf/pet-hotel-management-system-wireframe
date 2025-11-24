@echo off
echo 正在啟動本地伺服器...
echo 伺服器將在 http://localhost:8000 運行
echo 按 Ctrl+C 停止伺服器
echo.

REM 檢查 Python 是否安裝
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo 使用 Python HTTP 伺服器...
    python -m http.server 8000
    goto :end
)

REM 檢查 Node.js 是否安裝
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo 使用 Node.js http-server...
    npx --yes http-server -p 8000 -o
    goto :end
)

echo 錯誤：未找到 Python 或 Node.js
echo 請安裝 Python 或 Node.js，或直接雙擊 HTML 文件打開
pause

:end

