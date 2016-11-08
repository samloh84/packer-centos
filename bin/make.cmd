@echo off

REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

SET CENTOS7SERVER=0
SET CENTOS7WORKSTATION=0
SET CENTOS6SERVER=0
SET CENTOS6WORKSTATION=0
SET CENTOS5SERVER=0
SET CENTOS5WORKSTATION=0

echo Building %1
IF [%1] == [] SET CENTOS7SERVER=1
IF [%1] == [] SET CENTOS7WORKSTATION=1
IF [%1] == [] SET CENTOS6SERVER=1
IF [%1] == [] SET CENTOS6WORKSTATION=1
IF [%1] == [] SET CENTOS5SERVER=1
IF [%1] == [] SET CENTOS5WORKSTATION=1

IF "%1" == "all" SET CENTOS7SERVER=1
IF "%1" == "all" SET CENTOS7WORKSTATION=1
IF "%1" == "all" SET CENTOS6SERVER=1
IF "%1" == "all" SET CENTOS6WORKSTATION=1
IF "%1" == "all" SET CENTOS5SERVER=1
IF "%1" == "all" SET CENTOS5WORKSTATION=1

IF "%1" == "centos-7" SET CENTOS7SERVER=1
IF "%1" == "centos-7" SET CENTOS7WORKSTATION=1
IF "%1" == "centos-6" SET CENTOS6SERVER=1
IF "%1" == "centos-6" SET CENTOS6WORKSTATION=1
IF "%1" == "centos-5" SET CENTOS5SERVER=1
IF "%1" == "centos-5" SET CENTOS5WORKSTATION=1

IF "%1" == "centos-7-server" SET CENTOS7SERVER=1
IF "%1" == "centos-7-workstation" SET CENTOS7WORKSTATION=1
IF "%1" == "centos-6-server" SET CENTOS6SERVER=1
IF "%1" == "centos-6-workstation" SET CENTOS6WORKSTATION=1
IF "%1" == "centos-5-server" SET CENTOS5SERVER=1
IF "%1" == "centos-5-workstation" SET CENTOS5WORKSTATION=1

set RESTVAR=
shift
:loop1
if "%1"=="" goto after_loop
set RESTVAR=%RESTVAR% %1
shift
goto loop1

:after_loop
pushd ..
IF DEFINED CENTOS7SERVER (
packer.exe build -var-file=centos-7-server.json %RESTVAR% centos.json
ovftool.exe --overwrite output\vmware-iso\centos-7-server\centos-7-server.vmx output\centos-7-server.ova
)
IF DEFINED CENTOS7WORKSTATION (
packer.exe build -var-file=centos-7-workstation.json %RESTVAR% centos.json
 ovftool.exe --overwrite output\vmware-iso\centos-7-workstation\centos-7-workstation.vmx output\centos-7-workstation.ova
)
IF DEFINED CENTOS6SERVER (
packer.exe build -var-file=centos-6-server.json %RESTVAR% centos.json
ovftool.exe --overwrite output\vmware-iso\centos-6-server\centos-7-server.vmx output\centos-7-server.ova
)
IF DEFINED CENTOS6WORKSTATION (
packer.exe build -var-file=centos-6-workstation.json %RESTVAR% centos.json
ovftool.exe --overwrite output\vmware-iso\centos-6-workstation\centos-6-workstation.vmx output\centos-6-workstation.ova
)
IF DEFINED CENTOS5SERVER (
packer.exe build -var-file=centos-5-server.json %RESTVAR% centos.json
ovftool.exe --overwrite output\vmware-iso\centos-5-server\centos-5-server.vmx output\centos-5-server.ova
)
IF DEFINED CENTOS5WORKSTATION (
packer.exe build -var-file=centos-5-workstation.json %RESTVAR% centos.json
ovftool.exe --overwrite output\vmware-iso\centos-5-workstation\centos-5-workstation.vmx output\centos-5-workstation.ova
)
popd
