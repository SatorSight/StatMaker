module Bridge
  class Api
    attr_reader :access_token, :service_id

    include Enum

    def set_access_token
      require 'net/http'

      auth_url = URI.parse(Enum::AUTH_URL)

      http = Net::HTTP.new(auth_url.host, auth_url.port)
      http.use_ssl = true
      auth_fields = {}
      auth_fields[:grant_type] = Enum::GRANT_TYPE
      auth_fields[:client_id] = Enum::CLIENT_ID
      auth_fields[:client_secret] = Enum::CLIENT_SECRET

      request = Net::HTTP::Post.new(auth_url.path, {'Content-Type' => Enum::CONTENT_FORM_TYPE})
      request.body = auth_fields.to_query

      response = http.request(request)
      res = JSON.parse response.body
      access_token = res['access_token']

      @access_token = access_token
    end

    def set_service_tech(tech)
      @service_id = tech;
    end

    # @param [User] user
    def user_subscribed?(user)
      bridge_url = URI.parse(Enum::SUBSCRIPTION_INFO_URL)

      http = Net::HTTP.new(bridge_url.host, bridge_url.port)
      http.use_ssl = true
      http.read_timeout = 600
      auth_fields = {}
      auth_fields[:serviceId] = @service_id
      auth_fields[:country] = Enum::COUNTRY
      auth_fields[:userId] = user.msisdn
      auth_fields[:operator] = user.operator.tech

      request = Net::HTTP::Post.new(bridge_url.path, {
          'Content-Type' => Enum::CONTENT_JSON_TYPE,
          'Authorization' => 'Bearer '+@access_token
      })

      request.body = auth_fields.to_json


      tries = 5
      tries.times do |attempt|
        res = run_request http, request

        if res.in? [true, false]
          return res
        end
      end

      :request_failed
    end

  private

    def run_request(http, request)

      begin
        response = http.request request
        res = JSON.parse response.body

        Integer(res['status']) == 1
      rescue
        :error
      end
    end


  end
end