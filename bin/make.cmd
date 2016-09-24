REM To force build, add -force to arguments

pushd ..
packer.exe build %* centos-7-workstation.json
packer.exe build %* centos-7-server.json

ovftool.exe output\centos-7-server\centos-7-server.vmx output\centos-7-server.ova
ovftool.exe output\centos-7-workstation\centos-7-workstation.vmx output\centos-7-workstation.ova

popd
