REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

IF "%1"=="" SET CENTOS7SERVER=1
IF "%1"=="" SET CENTOS7WORKSTATION=1
IF "%1"=="" SET CENTOS6SERVER=1
IF "%1"=="" SET CENTOS6WORKSTATION=1
IF "%1"=="" SET CENTOS5SERVER=1
IF "%1"=="" SET CENTOS5WORKSTATION=1

IF "%1"=="centos-7" SET CENTOS7SERVER=1
IF "%1"=="centos-7" SET CENTOS7WORKSTATION=1
IF "%1"=="centos-6" SET CENTOS6SERVER=1
IF "%1"=="centos-6" SET CENTOS6WORKSTATION=1
IF "%1"=="centos-5" SET CENTOS5SERVER=1
IF "%1"=="centos-5" SET CENTOS5WORKSTATION=1

IF "%1"=="centos-7-server" SET CENTOS7SERVER=1
IF "%1"=="centos-7-workstation" SET CENTOS7WORKSTATION=1
IF "%1"=="centos-6-server" SET CENTOS6SERVER=1
IF "%1"=="centos-6-workstation" SET CENTOS6WORKSTATION=1
IF "%1"=="centos-5-server" SET CENTOS5SERVER=1
IF "%1"=="centos-5-workstation" SET CENTOS5WORKSTATION=1

set RESTVAR=
shift
:loop1
if "%1"=="" goto after_loop
set RESTVAR=%RESTVAR% %1
shift
goto loop1

:after_loop
pushd ..
IF DEFINED CENTOS7SERVER ( packer.exe build -var-file=centos-7-server.json %RESTVAR% centos.json )
IF DEFINED CENTOS7WORKSTATION ( packer.exe build -var-file=centos-7-workstation.json %RESTVAR% centos.json )
IF DEFINED CENTOS6SERVER ( packer.exe build -var-file=centos-6-server.json %RESTVAR% centos.json )
IF DEFINED CENTOS6WORKSTATION ( packer.exe build -var-file=centos-6-workstation.json %RESTVAR% centos.json )
IF DEFINED CENTOS5SERVER ( packer.exe build -var-file=centos-5-server.json %RESTVAR% centos.json )
IF DEFINED CENTOS5WORKSTATION ( packer.exe build -var-file=centos-5-workstation.json %RESTVAR% centos.json )
popd
