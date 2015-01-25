module VagrantPlugins
  module VagrantCPUBurn
    class CPUBurn < Vagrant.plugin(2, :command)
      def execute
        with_target_vms(@argv) do |machine|
          if machine.state.id != :running
            @env.ui.info("#{machine.name} is not running.")
            next
          end
          config_obj = machine.config.chaos_monkey
          command = 'stress --cpu %s --vm %s --vm-bytes %s  &' % [config_obj.burn_cpus, config_obj.burn_vm, config_obj.burn_vm_bytes]
          machine.communicate.execute(command) do |type, data|
            @env.ui.info(data)
          end
        end
        return 0
      end

    end

  end

end
