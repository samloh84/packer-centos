for /f %%G in ('dir /b *.pkrvars.hcl ^| findstr "centos-"') do packer build -force -var-file "%%G" -only="vmware-iso.centos" .
