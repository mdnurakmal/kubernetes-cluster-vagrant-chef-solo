
# Automatically create kubernetes cluster using vagrant , virtualbox , chef-solo

# Development Environment
- Windows 10

# Installation

Download & Install:
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (latest version, tested with 6.1.26)
- [Vagrant](https://www.vagrantup.com/downloads.html) (latest version, tested with 2.2.18)
- Use vagrant-omnibus to specify chef version 16.0.257
```shell
vagrant plugin install vagrant-omnibus
```

Download the following cookbooks into cookbooks folder
- [kube] (https://supermarket.chef.io/cookbooks/kube)
- [etcd] (https://supermarket.chef.io/cookbooks/etcd)
- [docker] (https://supermarket.chef.io/cookbooks/docker)

Custom recipe used for this deployment is in k8s folder

## Usage

Create VMs from vagrant file

```shell
vagrant up
```

Error message will occur as described in this https://github.com/hashicorp/vagrant/issues/12337 <br >
Edit vagrant file to include the following
```shell
chef.install = false
```

Save the updated vagrant file and update VMs.
```shell
vagrant provision
```

Destroy VMs

```shell
vagrant destroy
```
# Learning objective
* Difference between chef-solo , chef-zero , chef-infra
* Basics of chef-solo and hands-on practice

# Learning Points
* Vagrant default provider is virtualbox
* Difficulty understanding the usage of kube cookbook to make any modifications
* Unfamiliarity with ruby language
* Not beginner friendly setup
* Deprecated vagrant-omnibus plugin
* kube cookbook does not support latest chef version
* kube cookbook supports up to chef version <= 16.0.x
* Open issue - https://github.com/hashicorp/vagrant/issues/12337
* Manual adding of cookbooks (Will use Berkshelf in the future)
* Require further read up on chef and cookbook
* Unable to run kubectl from chef-solo vm (To be revisited)
* Instead of having to provision 3 VMs manually inside vagrantfile , we can use kube cookbook to help us manage the provisioning of the required VMs

# References
* https://github.com/aespinosa/cookbook-kube
