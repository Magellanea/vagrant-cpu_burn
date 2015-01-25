module VagrantPlugins
  module VagrantCPUBurn
    class ProvisionerConfig < Vagrant.plugin(2, :config)
      attr_accessor :block_all_networks
      attr_accessor :cpu_burn
      attr_accessor :shut_down_type
      # TODO check a better way to add stress tool
      attr_accessor :stress_package_url
      attr_accessor :stress_package_name
      attr_accessor :stress_tar_ball_name
      
      def initialize
        super
        @block_all_networks = UNSET_VALUE
        @cpu_burn = UNSET_VALUE
        @shut_down_type = UNSET_VALUE
        @stress_package_url = "http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz"
        @stress_tar_ball_name = "stress-1.0.4.tar.gz"
        @stress_package_name = "stress-1.0.4"
      end

      def finalize!
        @block_all_networks = false if @block_all_networks == UNSET_VALUE
        @cpu_burn = true if @cpu_burn == UNSET_VALUE
        @shut_down_type = true if @shut_down_type == UNSET_VALUE
      end

    end
  end
end
