
.PHONY: all centos-5 centos-5-server centos-5-workstation centos-6 centos-6-server centos-6-workstation centos-7 centos-7-server centos-7-workstation 

centos-7: centos-7-server centos-7-workstation

centos-7-workstation: centos.json centos-7-workstation.json
	packer -var-file=centos-7-workstation.json centos.json

centos-7-workstation: centos.json centos-7-workstation.json
	packer -var-file=centos-7-workstation.json centos.json

centos-6: centos-6-server centos-6-workstation

centos-6-server: centos.json centos-6-server.json
	packer -var-file=centos-6-server.json centos.json

centos-6-workstation: centos.json centos-6-workstation.json
	packer -var-file=centos-6-workstation.json centos.json

centos-5: centos-5-server centos-5-workstation

centos-5-workstation: centos.json centos-5-workstation.json
	packer -var-file=centos-5-workstation.json centos.json

centos-5-workstation: centos.json centos-5-workstation.json
	packer -var-file=centos-5-workstation.json centos.json


