#!/bin/bash

PS_SCRIPT="script.ps1"
if ! command -v pwsh &> /dev/null; then
    echo "PowerShell is not installed. Please install PowerShell for macOS."
    exit 1
fi
pwsh -File "$PS_SCRIPT" &
sleep 5
open "http://localhost:8080/"
