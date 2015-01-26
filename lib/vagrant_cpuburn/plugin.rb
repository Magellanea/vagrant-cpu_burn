begin
  require "vagrant"
rescue LoadError
  raise "You need Vagrant to run Vagrant-ChaosMonkey"
end

module VagrantPlugins
  module VagrantCPUBurn
    class Plugin < Vagrant.plugin("2")
      name "VagrantCPUBurn"
      description "CPUBurn for vagrant"
      
      config "cpuburn_vagrant" do
        require_relative "config"
        Config
      end

      provisioner "cpuburn_vagrant" do
        require_relative "provisioner.rb"
        Provisioner
      end

      config("cpuburn_vagrant", :provisioner) do
        require_relative "provisioner_config.rb"
        ProvisionerConfig
      end

      command "burn-cpu" do
        require_relative "cpuburn"
        CPUBurn
      end
      
      command "burn-cpu-kill" do
        require_relative "cpuburn_kill"
        CPUBurnKill
      end

    end
  end
end
