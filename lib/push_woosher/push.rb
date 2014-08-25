module PushWoosher
  class Push < PushWoosher::Base
    attribute :notification

    def resource_path
      'createMessage'
    end

    def request_hash
      {
        notifications: [notification]
      }
    end

    def post
      post_action(
        path: resource_path,
        request_hash: request_hash
      )
    end
  end
end
