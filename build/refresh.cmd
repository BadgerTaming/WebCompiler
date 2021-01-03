@echo off

@echo Updating node packages
call "%~dp0\build.cmd"

@pushd "%~dp0..\src\WebCompiler\node\"
@echo Updating WebCompiler installation
@for /d %%d in (%TEMP%\WebCompiler*) do (
    echo Updating %%d
    xcopy /R /Y 7z.* %%d > nul
    xcopy /R /Y *.7z %%d > nul
    xcopy /R /Y prepare.cmd %%d > nul
    pushd %%d
    if exist node_modules rmdir /s /q node_modules
    call prepare.cmd > prepare.log
    echo Refreshed at %date% %time% > log.txt
    popd
)

:done
@echo Done
@popd
