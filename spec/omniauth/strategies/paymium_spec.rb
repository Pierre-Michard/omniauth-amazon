require 'spec_helper'

describe OmniAuth::Strategies::Paymium do
  subject do
    strategy = OmniAuth::Strategies::Paymium.new(nil, @options || {})
    strategy.stub(:session) { {  } }
    strategy
  end

  describe '#client' do
    it 'should have the correct Paymium site' do
      expect(subject.client.site).to eq("https://www.paymium.com/")
    end

    it 'should have the correct authorization url' do
      expect(subject.client.options[:authorize_url]).to eq("https://www.paymium.com/api/oauth/authorize")
    end

    it 'should have the correct token url' do
      expect(subject.client.options[:token_url]).to eq('https://www.paymium.com/api/oauth/token')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      expect(subject.callback_path).to eq('/auth/paymium/callback')
    end
  end
end
