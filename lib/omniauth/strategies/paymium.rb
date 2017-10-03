require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Paymium < OmniAuth::Strategies::OAuth2
      option :name, 'paymium'

      option :client_options,
        site: 'https://www.paymium.com/',
        authorize_url: 'https://www.paymium.com/api/oauth/authorize',
        token_url: 'https://www.paymium.com/api/oauth/token'


      option :access_token_options,
        mode: :query


      option :authorize_params,
        scope: 'admin'


      def build_access_token
        token_params = {
            redirect_uri: callback_url.split('?').first,
            client_id: client.id,
            client_secret: client.secret
        }
        verifier = request.params['code']
        client.auth_code.get_token(verifier, token_params)
      end

      uid { admin_info['name'] }

      info do
        {
          'email' => admin_info['email'],
          'name' => admin_info['name']
        }
      end


      def admin_info
        access_token.options[:parse] = :json
        @admin_info ||= access_token.get("#{options.client_options.site}/api/v1/admin").parsed
      end
    end
  end
end
