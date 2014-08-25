module PushWoosher
  class Base
    include Virtus.model

    BASE_HOST = 'cp.pushwoosh.com'
    PROTOCOL = 'https'
    BASE_PATH = '/json/1.3'

    def connection
      @connection = Faraday.new(url: "#{PROTOCOL}://#{BASE_HOST}") do |faraday|
        faraday.request :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def post_action(opts = {})
      response = connection.post do |req|
        req.url "#{BASE_PATH}/#{opts[:path]}"
        req.headers['Content-Type'] = 'application/json'
        req.body = { request: opts[:request_hash].merge(config) }.to_json
      end

      case response.status
      when 200
        true
      else
        { status: response.status, message: response.body }
      end
    end

    def config
      {
        application: PushWoosher.configuration.application_code,
        auth: PushWoosher.configuration.api_token
      }
    end
  end
end
