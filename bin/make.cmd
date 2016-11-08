@echo off

REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

SET NO_OPTS=1

SET CENTOS_7_SERVER=0
SET CENTOS_7_WORKSTATION=0
SET CENTOS_6_SERVER=0
SET CENTOS_6_WORKSTATION=0
SET CENTOS_5_SERVER=0
SET CENTOS_5_WORKSTATION=0

SET REST_ARGS=

:GETOPTS
SET OPTS_MATCHED=0
IF "%1" == "all" (
	SET CENTOS_7_SERVER=1
	SET CENTOS_7_WORKSTATION=1
	SET CENTOS_6_SERVER=1
	SET CENTOS_6_WORKSTATION=1
	SET CENTOS_5_SERVER=1
	SET CENTOS_5_WORKSTATION=1
)

IF "%1" == "centos-7" (
	SET CENTOS_7_SERVER=1
	SET CENTOS_7_WORKSTATION=1
)

IF "%1" == "centos-6" (
	SET CENTOS_6_SERVER=1
	SET CENTOS_6_WORKSTATION=1
)

IF "%1" == "centos-5" (
	SET CENTOS_5_SERVER=1
	SET CENTOS_5_WORKSTATION=1
)

IF "%1" == "centos-7-server" (
	SET CENTOS_7_SERVER=1
)

IF "%1" == "centos-7-workstation" (
	SET CENTOS_7_WORKSTATION=1
)

IF "%1" == "centos-6-server" (
	SET CENTOS_6_SERVER=1
)

IF "%1" == "centos-6-workstation" (
	SET CENTOS_6_WORKSTATION=1
)

IF "%1" == "centos-5-server" (
	SET CENTOS_5_SERVER=1
)

IF "%1" == "centos-5-workstation" (
	SET CENTOS_5_WORKSTATION=1
)


SHIFT
IF OPTS_MATCHED EQU 0 SET REST_ARGS=%REST_ARGS% %1
IF NOT "%1" == "" GOTO GETOPTS

IF NO_OPTS EQU 1 (
	SET CENTOS_7_SERVER=1
    SET CENTOS_7_WORKSTATION=1
    SET CENTOS_6_SERVER=1
    SET CENTOS_6_WORKSTATION=1
    SET CENTOS_5_SERVER=1
    SET CENTOS_5_WORKSTATION=1
)


pushd ..
IF CENTOS_7_SERVER EQU 1 (
	packer.exe build -var-file=centos-7-server.json %REST_ARGS% centos.json
	ovftool.exe --overwrite output\vmware-iso\centos-7-server\centos-7-server.vmx output\centos-7-server.ova
)
IF CENTOS_7_WORKSTATION EQU 1 (
	packer.exe build -var-file=centos-7-workstation.json %REST_ARGS% centos.json
	ovftool.exe --overwrite output\vmware-iso\centos-7-workstation\centos-7-workstation.vmx output\centos-7-workstation.ova
)

IF CENTOS_6_SERVER EQU 1 (
	packer.exe build -var-file=centos-6-server.json %REST_ARGS% centos.json
	ovftool.exe --overwrite output\vmware-iso\centos-6-server\centos-6-server.vmx output\centos-6-server.ova
)
IF CENTOS_6_WORKSTATION EQU 1 (
	packer.exe build -var-file=centos-6-workstation.json %REST_ARGS% centos.json
	ovftool.exe --overwrite output\vmware-iso\centos-6-workstation\centos-6-workstation.vmx output\centos-6-workstation.ova
)

IF CENTOS_5_SERVER EQU 1 (
	packer.exe build -var-file=centos-5-server.json %REST_ARGS% centos.json
	ovftool.exe --overwrite output\vmware-iso\centos-5-server\centos-5-server.vmx output\centos-5-server.ova
)
IF CENTOS_5_WORKSTATION EQU 1 (
	packer.exe build -var-file=centos-5-workstation.json %REST_ARGS% centos.json
	ovftool.exe --overwrite output\vmware-iso\centos-5-workstation\centos-5-workstation.vmx output\centos-5-workstation.ova
)
popd
