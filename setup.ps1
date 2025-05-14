Write-Host "Setting up nutriaiagent environment..." -ForegroundColor Green

# Check if virtual environment exists
if (-not (Test-Path ".\nutriai_env")) {
    Write-Host "Creating virtual environment..." -ForegroundColor Yellow
    python -m venv nutriai_env
}

# Ensure we're in the virtual environment
if (-not $env:VIRTUAL_ENV) {
    Write-Host "Activating virtual environment..." -ForegroundColor Yellow
    .\nutriai_env\Scripts\Activate.ps1
}

# Upgrade pip first
Write-Host "Upgrading pip to latest version..." -ForegroundColor Yellow
python.exe -m pip install --upgrade pip setuptools wheel

# Install requirements
Write-Host "Installing project requirements..." -ForegroundColor Yellow
python.exe -m pip install -r requirements.txt

Write-Host "Setup completed successfully!" -ForegroundColor Green

# Optional: Run the Streamlit app
$response = Read-Host "Would you like to run the Streamlit app? (y/n)"
if ($response -eq 'y') {
    Write-Host "Starting Streamlit app..." -ForegroundColor Green
    streamlit run streamlit_app.py
}
