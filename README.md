# Help Desk Dashboard

> **Note**: This website was built for a help desk center. Due to constraints, it was not possible to use a database or Node.js in this project.

A responsive and interactive Help Desk Dashboard built using HTML, React, and Bootstrap. This dashboard visualizes call statistics, tracks performance, and provides insights for managing help desk activities effectively.

## Features
- **Data Visualization**: Displays daily, weekly, and monthly statistics using Google Charts.
- **Live Data Synchronization**: Fetches real-time data from a backend service and updates the dashboard every two minutes. The data is stored in a CSV file, which is updated periodically. A sample CSV file is included.
- **Pending Call Management**: Lists pending calls for quick reference and management.
- **Agent Performance Tracking**: Tracks call handling by agents, categorized by status and source.
- **Interactive Modals**: Allows users to view detailed information about individual calls.

## Technologies Used
- **Frontend**:
  - HTML5, CSS3
  - React (via UMD CDN)
  - Bootstrap 5
- **Visualization**: Google Charts API
- **Backend**: Fetches data from a local server at `http://localhost:8080`

## Project Files

- calls.csv: A sample CSV file containing call data. This file serves as the data source for the dashboard. The interface fetches and updates data from this file every two minutes during the server runtime.

- index.html: The main HTML file for the dashboard interface. It includes all necessary elements for displaying call statistics, pending calls, and performance insights.

- open-dashboard.vbs: A VBScript file designed for Windows users. It automates the process of starting the PowerShell server (script.ps1) and opening the dashboard in a web browser.

- open-dashboard.sh: A Bash script intended for macOS users. It performs the same function as the VBScript: starting the PowerShell server (script.ps1) and opening the dashboard in a web browser.
> **Note**: PowerShell must be installed on your macOS system in order to run this script.

- script.ps1: A PowerShell script that acts as the backend server. It serves the index.html file, processes data from calls.csv, and provides endpoints for fetching statistics and managing calls.

## How to Use

1. To start the backend server and open the dashboard in your browser, run the open-dashboard.VBS script. This script will execute the PowerShell server and open the dashboard at http://localhost:8080/.
2. View call statistics in daily, weekly, and monthly charts.
3. Click on a pending call in the list to view detailed information.
4. To stop the server script, click on the red X button in the interface. This will terminate the PowerShell server gracefully.

## Components

**Home**
- Displays the main dashboard interface.
- Periodically fetches and updates data.
- Handles interactions such as dropdown selection and modal display.
- The user interface is in Hebrew.

**Helper Functions**
- calculateStats: Processes raw call data into structured statistics.
- updatePendingCalls: Filters pending calls from the fetched data.
