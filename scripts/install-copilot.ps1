# Install the skills for GitHub Copilot (VS Code agent mode) as personal skills,
# and create the local log folder.
# Usage: powershell -ExecutionPolicy Bypass -File scripts\install-copilot.ps1 [-Target <dir>]
# Default target: $HOME\.copilot\skills. Pass <repo>\.github\skills to install in one project.
param([string]$Target = (Join-Path $HOME ".copilot\skills"))
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$skills = Join-Path $root "skills"
New-Item -ItemType Directory -Force -Path $Target | Out-Null
foreach ($dir in Get-ChildItem -Directory $skills) {
  $dest = Join-Path $Target $dir.Name
  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Recurse -Force $dir.FullName $dest
  Write-Output "installed $($dir.Name) -> $dest"
}
$log = Join-Path $HOME "socratic-log"
New-Item -ItemType Directory -Force -Path $log | Out-Null
Write-Output "log folder: $log (keep it local, never in git)"
