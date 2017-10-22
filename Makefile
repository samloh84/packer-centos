
.PHONY: all centos-7 centos-6 centos-5

centos-7: centos-7-server centos-7-workstation

centos-7-server: centos.json centos-7-server.json floppy/centos-7-server/anaconda-ks.cfg
	packer -var-file=centos-7-server.json centos.json

centos-7-workstation: centos.json centos-7-workstation.json floppy/centos-7-workstation/anaconda-ks.cfg
	packer -var-file=centos-7-workstation.json centos.json

centos-6: centos-6-server centos-6-workstation

centos-6-server: centos.json centos-6-server.json floppy/centos-6-server/anaconda-ks.cfg
	packer -var-file=centos-6-server.json centos.json

centos-6-workstation: centos.json centos-6-workstation.json floppy/centos-6-workstation/anaconda-ks.cfg
	packer -var-file=centos-6-workstation.json centos.json

centos-5: centos-5-server centos-5-workstation

centos-5-server: centos.json centos-5-server.json floppy/centos-5-server/anaconda-ks.cfg
	packer -var-file=centos-5-server.json centos.json

centos-5-workstation: centos.json centos-5-workstation.json floppy/centos-5-workstation/anaconda-ks.cfg
	packer -var-file=centos-5-workstation.json centos.json
