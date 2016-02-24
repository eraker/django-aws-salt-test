Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "ladderproj"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 4443
  config.vm.network "private_network", ip: "10.0.0.100"
  config.vm.synced_folder "vagrant", "/vagrant"
  config.vm.post_up_message = "** Local ladder project running\n Visit: 10.0.0.100 **\n or `vagrant ssh`"

end
