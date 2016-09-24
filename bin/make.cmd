REM To force build, add -force to arguments
REM To build for only one builder, add -only=virtualbox-iso or -only=vmware-iso

pushd ..
packer.exe build -var-file=centos-7-server.json %* centos.json
packer.exe build -var-file=centos-7-workstation.json %* centos.json
popd
