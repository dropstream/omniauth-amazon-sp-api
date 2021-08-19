require 'spec_helper'
require 'support/shared_examples'

describe OmniAuth::Strategies::AmazonSpApi do
  subject(:strategy) do
    strategy = OmniAuth::Strategies::AmazonSpApi.new(nil, nil, options)
    strategy.stub(:session) { {} }
    strategy
  end

  let(:options) { {} }

  include_examples 'an oauth2 strategy'

  describe '#client' do
    subject(:client) { strategy.client }

    it 'should have the correct Amazon site' do
      expect(client.site).to eq 'https://sellingpartnerapi-na.amazon.com'
    end

    it 'should have the correct authorization url' do
      expect(client.options[:authorize_url]).to eq(
        'https://sellercentral.amazon.com/apps/authorize/consent'
      )
    end

    it 'should have the correct token url' do
      expect(client.options[:token_url]).to eq(
        'https://api.amazon.com/auth/o2/token'
      )
    end
  end

  describe '#callback_path' do
    subject(:callback_path) { strategy.callback_path }

    it 'should have the correct callback path' do
      expect(callback_path).to eq '/auth/amazon_sp_api/callback'
    end
  end

  describe '#callback_url' do
    subject(:callback_url) { strategy.callback_url }

    it 'does not include query parameters' do
      allow(strategy).to receive(:full_host).and_return('https://example.com')
      allow(strategy).to receive(:script_name).and_return('/sub_uri')
      allow(strategy).to receive(:query_string).and_return('?foo=bar')

      expect(callback_url).to eq 'https://example.com/sub_uri/auth/amazon_sp_api/callback'
    end

    context 'when a redirect_uri option is informed' do
      let(:options) { { redirect_uri: "https://example.com/auth/amazon_sp_api/callback" } }

      it 'returns the redirect_uri' do
        expect(callback_url).to eq options[:redirect_uri]
      end
    end
  end
end
