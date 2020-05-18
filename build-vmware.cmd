@echo off

if "%~f1" == "" (
    for /f %%G in ('dir /b *.pkrvars.hcl ^| findstr "centos-"') do (
        CALL :packer_build "%%G"
    )
) else (
    CALL :packer_build "%~f1"
)

GOTO :eof

:packer_build
packer build -force -var-file "%*" -only="vmware-iso.centos" .
EXIT /B %ERRORLEVEL%
