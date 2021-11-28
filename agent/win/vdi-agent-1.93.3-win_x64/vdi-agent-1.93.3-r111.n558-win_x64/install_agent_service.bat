@echo off
for %%B in (%~dp0.) do set vncbin=%%~dpBTightVNC\tvnserver.exe
@echo on
sc create VDIAgentService binpath= "%~dp0vm_agent_windows.bat" start= auto DisplayName= "VDI Agent Service"
sc start VDIAgentService
netsh advfirewall firewall add rule name="VDIBlockTightVNC" program="%vncbin%" protocol=TCP dir=in action=block
pause
