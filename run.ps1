# AI Comic Builder - Startup Script
# Run this to start the application

Write-Host "Starting AI Comic Builder..." -ForegroundColor Green

# Check Node.js
$nodeVersion = node --version
Write-Host "Node.js version: $nodeVersion"

# Check FFmpeg
$ffmpegVersion = ffmpeg -version 2>&1 | Select-Object -First 1
Write-Host "FFmpeg: $ffmpegVersion"

# Create data directory if not exists
if (-not (Test-Path "./data")) {
    New-Item -ItemType Directory -Path data -Force | Out-Null
    Write-Host "Created data directory" -ForegroundColor Yellow
}

# Initialize database if needed
Write-Host "Checking database..." -ForegroundColor Yellow
pnpm drizzle-kit push 2>$null

# Start dev server
Write-Host ""
Write-Host "Starting dev server at http://localhost:3000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray
Write-Host ""

pnpm dev