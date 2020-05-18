build {
  sources = [
    "source.virtualbox-iso.centos",
    "source.vmware-iso.centos"]




  provisioner "shell" {
    scripts = local.shell_scripts
    environment_vars = local.shell_environment_vars
  }

}
