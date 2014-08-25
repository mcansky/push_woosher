module PushWoosher
  class Config
    attr_accessor :application_code
    attr_accessor :api_token

    def setup
      yield self
    end
  end

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Config.new
      yield(configuration)
    end
  end
end
