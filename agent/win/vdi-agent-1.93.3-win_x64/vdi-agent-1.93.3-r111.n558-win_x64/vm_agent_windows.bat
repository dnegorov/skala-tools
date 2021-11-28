@echo off
set AGENT_PATH=%~dp0
set PATH=%AGENT_PATH%\..\python\;%AGENT_PATH%\..\python\sripts;%PATH%
set PYTHONPATH=%AGENT_PATH%\integrity_check;%AGENT_PATH%\vdi_protocol;%AGENT_PATH%\vms_protocol;%AGENT_PATH%\vm_agent

python "%AGENT_PATH%vm_agent\vm_agent\vm_agent_windows.pyc" %*
