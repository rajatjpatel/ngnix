# -*- mode: ruby -*-
# vi: set ft=ruby :
# "./Vagrantfile"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # set ports: according to your ngnix configuration
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # sync to the ngnix root
  config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"

  # remove error message
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  # use bootrap.sh
  config.vm.provision "shell", path: "./tools/vagrant/bootstrap.sh"

end
