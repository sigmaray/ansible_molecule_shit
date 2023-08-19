Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"

  # config.vm.network "private_network", ip: "192.168.18.9"
  config.vm.provider :libvirt do |libvirt, override|
    override.vm.network "forwarded_port", guest: 22, host: 3022
    libvirt.driver = "qemu"
    # v.memory = 4096
    # v.cpus = 4
    # config.vm.network "forwarded_port", id: "ssh", host: 3022, guest: 22
  end
  config.vm.network "forwarded_port", id: "ssh", host: 3022, guest: 22

  # config.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
end
