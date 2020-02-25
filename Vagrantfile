# -*- mode: ruby -*-
# vi: set ft=ruby :

extra_vars = {}
File.read('.env').each_line do |line|
  key, value = line.chomp.split('=')
  extra_vars[key.downcase] = value
end

Vagrant.configure('2') do |config|
  config.vm.box = 'uzxmx/mybox'

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'main.yml'
    ansible.extra_vars = extra_vars
    ansible.verbose = true
  end
end
