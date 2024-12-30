Set objShell = CreateObject("WScript.Shell")

scriptPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName) & "\script.ps1"

objShell.Run "powershell -ExecutionPolicy Bypass -File """ & scriptPath & """", 0, True

objShell.Run """C:\Program Files\Google\Chrome\Application\chrome.exe"" http://localhost:8080", 1, True
