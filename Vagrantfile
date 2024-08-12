Vagrant.configure("2") do |config|

  config.vm.box = "debian/bullseye64"

  config.vm.network "forwarded_port", guest: 22, host: 2222

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "1024"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    set -x
    apt-get update
    apt-get install -y apache2
    useradd -m user
    echo "user:password" | chpasswd
    usermod -aG sudo user
  SHELL

  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "docker-install-scripts/docker_installation_playbook.yml"
    ansible.extra_vars = {
      "ansible_ssh_user" => "vagrant",
      "ansible_ssh_private_key_file" => "#{File.expand_path('.vagrant/machines/default/virtualbox/private_key')}"
   }
  end

  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "library-build-scripts/library_building_playbook.yml"
    ansible.extra_vars = {
    "ansible_ssh_user" => "vagrant",
    "ansible_ssh_private_key_file" => "#{File.expand_path('.vagrant/machines/default/virtualbox/private_key')}"
    }
  end
end

