param(
    [string]$VenvPath = ".venv"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $VenvPath)) {
    Write-Host "Creating virtual environment at $VenvPath ..."
    py -m venv $VenvPath
}

$python = Join-Path $VenvPath "Scripts\\python.exe"

if (-not (Test-Path $python)) {
    throw "Python executable not found at $python"
}

Write-Host "Upgrading pip ..."
& $python -m pip install --upgrade pip

Write-Host "Installing dependencies from requirements.txt ..."
& $python -m pip install -r requirements.txt

Write-Host ""
Write-Host "Done. Activate with:"
Write-Host "  .\\$VenvPath\\Scripts\\Activate.ps1"
