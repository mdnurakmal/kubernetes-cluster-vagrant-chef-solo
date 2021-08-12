Vagrant.configure("2") do |config|

    config.vm.define "chef-solo" do |chef_solo|
      chef_solo.vm.box = "hashicorp/bionic64"
      chef_solo.vm.hostname = "chef-server"
      chef_solo.vm.network "private_network", ip: "10.0.0.10"

      config.omnibus.chef_version = "16.0.257"

      chef_solo.vm.provision "chef_solo" do |chef|
        chef.arguments = '--chef-license accept'
        chef.cookbooks_path = "cookbooks"
        chef.add_recipe "k8s"
      end

    end
  end
