# OmniAuth::Paymium

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-paymium'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-paymium

## Usage

Usage is similar to other OAuth2 based OmniAuth strategies:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :paymium, ENV['PAYMIUM_CLIENT_ID'], ENV['PAYMIUM_CLIENT_SECRET'],
  {
    :scope => 'admin basic',
    :client_options => {
        'authorize_url' => "#{config.authorize_url}#{config.app_id}",
        'site' => config.site,
        'token_url' => config.token_url
    },
  }
end
```

