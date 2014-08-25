module PushWoosher
  module Device
    class Android < PushWoosher::Device::Base
      def device_type
        3
      end
    end
  end
end
