echo off

set SCRIPT_RUN_PATH="%~dp0"
set AGENT_ROOT=%1
set ROOT=%AGENT_ROOT%\..\
set NEW_DIR=%ROOT%\new\
set OLD_DIR=%ROOT%\old\

if exist %NEW_DIR% rd /S /Q %NEW_DIR% || goto :error
if exist %OLD_DIR% rd /S /Q %OLD_DIR% || goto :error
mkdir %NEW_DIR% || goto :error
mkdir %OLD_DIR% || goto :error

:: move new agent to %NEW_DIR% 
move %SCRIPT_RUN_PATH%python %NEW_DIR% || goto :error
move %SCRIPT_RUN_PATH%TightVNC %NEW_DIR% || goto :error
move %SCRIPT_RUN_PATH%vdi-agent-1.93.3-r111.n558-win_x64 %NEW_DIR% || goto :error
:: copy vm_agent.yaml to new agent
xcopy /Q /R /Y %AGENT_ROOT%\vm_agent.yaml %NEW_DIR%vdi-agent-1.93.3-r111.n558-win_x64

:: move old agent to %OLD_DIR%
move %AGENT_ROOT% %OLD_DIR% || goto :error
:: without error because TightVNC may be not found in old agent
move %ROOT%TightVNC %OLD_DIR%
move %ROOT%python %OLD_DIR% || goto :error

:: move new agent to %AGENT_ROOT%
move %NEW_DIR%python %ROOT% || goto :error
move %NEW_DIR%TightVNC %ROOT% || goto :error
move %NEW_DIR%vdi-agent-1.93.3-r111.n558-win_x64 %AGENT_ROOT% || goto :error

rd /S /Q %NEW_DIR% || goto :error
rd /S /Q %OLD_DIR% || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1

:EOF
exit 0
