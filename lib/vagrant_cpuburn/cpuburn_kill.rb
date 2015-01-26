module VagrantPlugins
  module VagrantCPUBurn
    class CPUBurnKill < Vagrant.plugin(2, :command)
      def execute
        with_target_vms(@argv) do |machine|
          if machine.state.id != :running
            @env.ui.info("#{machine.name} is not running.")
            next
          end
          command = 'killall stress'
          machine.communicate.sudo(command) do |type, data|
            @env.ui.info(data)
          end
        end
        return 0
      end

    end

  end

end
