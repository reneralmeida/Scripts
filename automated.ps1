If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}
start "path to AsrPolychromeRGB.exe"
ping 127.8.8.1 /n 60
taskkill /F /IM AsrPolychromeRGB.exe
$Host.SetShouldExit(0)