module Metrika
  class Client
    include Request
    DEFAULT_OAUTH_OPTIONS = {
        :site => 'https://api-metrika.yandex.ru/',
        :authorize_url => 'https://oauth.yandex.ru/authorize',
        :token_url => 'https://oauth.yandex.ru/token'
    }

    attr_accessor :application_id, :application_password

=begin
    https://api-metrika.yandex.ru/stat/v1/data?44406319&ym:s:visits&oauth_token=AQAAAAAJroNSAASSMsJ5FtIsfEGZmZgr-3zM-sY
=end

    def initialize(application_id = Metrika.application_id, application_password = Metrika.application_password)
      @application_id = application_id
      @application_password = application_password
    end

    def authorize_token(auth_code)
      @token = self.client.auth_code.get_token(auth_code)
    end

    def authorization_url
      self.client.auth_code.authorize_url
    end

    def restore_token(access_token)
      @token = OAuth2::AccessToken.new(self.client, access_token)
    end


    def test_get
      # request = Metrika::Request.new
      a = self.get '/management/v1/counters'
      pp a
    end



  protected

    def client
      @client ||= OAuth2::Client.new(@application_id, @application_password, DEFAULT_OAUTH_OPTIONS.dup)
    end

    def token
      raise Metrika::Errors::UnauthorizedError.new("Access token is not initialized") if @token.nil?

      @token
    end
  end


end