module VagrantPlugins
  module VagrantCPUBurn
    class Config < Vagrant.plugin(2, :config)
      attr_accessor :burn_cpus
      attr_accessor :burn_vm
      attr_accessor :burn_vm_bytes

      def initialize
        @burn_cpus = UNSET_VALUE
        @burn_vm = UNSET_VALUE
        @burn_vm_bytes = UNSET_VALUE
      end

      def finalize!
        @burn_cpus = 2 if @burn_cpus == UNSET_VALUE
        @burn_vm = 1 if @burn_vm == UNSET_VALUE
        @burn_vm_bytes = '128M' if @burn_vm_bytes == UNSET_VALUE
      end

    end
  end
end
    
