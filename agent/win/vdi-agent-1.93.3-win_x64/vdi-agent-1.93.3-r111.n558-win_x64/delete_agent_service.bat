sc stop VDIAgentService
sc delete VDIAgentService
netsh advfirewall firewall delete rule name="VDIBlockTightVNC" 
pause
