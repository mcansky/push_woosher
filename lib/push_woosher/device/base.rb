module PushWoosher
  module Device
    class Base < PushWoosher::Base
      attribute :token
      attribute :hwid

      def device_type
        raise NotImplementedError
      end

      def register_request_hash
        {
          push_token: token,
          hwid: hwid,
          timezone: 0,
          device_type: device_type
        }
      end

      def unregister_request_hash
        {
          hwid: hwid
        }
      end

      def register
        post_action(
          path: 'registerDevice',
          request_hash: register_request_hash
        )
      end

      def unregister
        post_action(
          path: 'unregisterDevice',
          request_hash: unregister_request_hash
        )
      end
    end
  end
end
