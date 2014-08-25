module PushWoosher
  module Device
    class Ios < PushWoosher::Device::Base
      def device_type
        1
      end
    end
  end
end
