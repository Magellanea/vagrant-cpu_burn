module VagrantPlugins
  module VagrantCPUBurn
    class Provisioner < Vagrant.plugin("2", :provisioner)
      def provision
        command = ''
        if @config.block_all_network
          #TODO implement this!
        end
        if @config.cpu_burn
          command << cpu_burn_command(@config)
        end
        if @config.shut_down_type
          #TODO implement this
        end

        @machine.communicate.sudo(command) do |t, data|
          @machine.env.ui.info(data.chomp, prefix: false)
        end
      end

      def cpu_burn_command(config)
        install_stress_command(config)
      end

      def install_stress_command(config)
        command = 'wget %s &&' % [config.stress_package_url]
        command << 'tar -zxvf %s &&' % [config.stress_tar_ball_name]
        command << 'cd %s &&' % [config.stress_package_name]
        command << './configure && make && sudo make install'
        command
      end
  
    end
  end
end
