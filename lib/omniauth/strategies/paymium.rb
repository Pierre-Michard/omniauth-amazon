require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Paymium < OmniAuth::Strategies::OAuth2
      option :name, 'paymium'

      option :client_options, {
        :site => 'https://www.paymium.com/',
        :authorize_url => 'https://www.paymium.com/api/oauth/authorize',
        :token_url => 'https://www.paymium.com/api/oauth/token'
      }

      option :access_token_options, {
        :mode => :query
      }

      option :authorize_params, {
        :scope => 'basic'
      }

      def build_access_token
        token_params = {
          :redirect_uri => callback_url.split('?').first,
          :client_id => client.id,
          :client_secret => client.secret
        }
        verifier = request.params['code']
        client.auth_code.get_token(verifier, token_params)
      end

      info do
        {
          'email' => raw_info['email'],
          'name' => raw_info['name']
        }
      end


      def raw_info
        access_token.options[:parse] = :json

        # This way is not working right now, do it the longer way
        # for the time being
        #
        #@raw_info ||= access_token.get('/ap/user/profile').parsed

        url = '/api/v1/user'
        params = {:params => { :access_token => access_token.token}}
        @raw_info ||= access_token.client.request(:get, url, params).parsed
      end
    end
  end
end
