# 簡單的 HTTP 伺服器啟動腳本
# 使用 Python 內建的 HTTP 伺服器

Write-Host "正在啟動本地伺服器..." -ForegroundColor Green
Write-Host "伺服器將在 http://localhost:8000 運行" -ForegroundColor Yellow
Write-Host "按 Ctrl+C 停止伺服器" -ForegroundColor Yellow
Write-Host ""

# 檢查 Python 是否安裝
$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) {
    $python = Get-Command python3 -ErrorAction SilentlyContinue
}

if ($python) {
    # 使用 Python HTTP 伺服器
    python -m http.server 8000
} else {
    Write-Host "未找到 Python，嘗試使用 Node.js..." -ForegroundColor Yellow
    
    # 檢查 Node.js 是否安裝
    $node = Get-Command node -ErrorAction SilentlyContinue
    if ($node) {
        # 使用 npx http-server
        npx --yes http-server -p 8000 -o
    } else {
        Write-Host "錯誤：未找到 Python 或 Node.js" -ForegroundColor Red
        Write-Host "請安裝 Python 或 Node.js，或直接雙擊 HTML 文件打開" -ForegroundColor Red
        pause
    }
}

