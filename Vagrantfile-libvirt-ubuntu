Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"

  config.vm.provider :libvirt do |libvirt|
    libvirt.driver = "qemu"
    # v.memory = 4096
    # v.cpus = 8
  end

  config.vm.network "forwarded_port", id: "ssh", host: 3022, guest: 22

  config.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
end
