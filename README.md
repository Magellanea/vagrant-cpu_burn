# VagrantCPUBurn

A vagrant plugin to simulate a cpu burn failure on a node


# Usage in ``VagrantFile``

```
Vagrant.configure(2) do |config|
  config.vm.box = "precise64"
  config.cpuburn_vagrant.burn_cpus = 1
  (1..2).each do |n|
    config.vm.define ("memcachednode%d" % n) do |machine|
      machine.vm.network :public_network
      # You have to specify the configuration
      machine.cpuburn_vagrant.burn_cpus = 1
      # You have to use the cpuburn_vagrant provisioner
      machine.vm.provision "cpuburn_vagrant" do |p|
        p.cpu_burn = true
      end
    end
  end
end
```
