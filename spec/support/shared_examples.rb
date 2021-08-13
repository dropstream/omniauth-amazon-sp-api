# Courtesy omniauth-37signals:
# https://github.com/tallgreentree/omniauth-37signals/blob/master/spec/support/shared_examples.rb

shared_examples 'an oauth2 strategy' do
  describe '#client' do
    subject(:client) { strategy.client}

    context  'with client_options informed' do
      let(:options) do
        {
          client_options: { 'authorize_url' => 'https://example.com' }
        }
      end

      it 'should be initialized with symbolized client_options' do
        expect(client.options[:authorize_url]).to eq 'https://example.com'
      end
    end
  end

  describe '#authorize_params' do
    subject(:authorize_params) { strategy.authorize_params}

    context 'with authorized_params option' do
      let(:options) do
        { authorize_params: { foo: 'bar', baz: 'zip' } }
      end

      it 'should include any authorize params passed in the :authorize_params option' do
        expect(authorize_params['foo']).to eq 'bar'
        expect(authorize_params['baz']).to eq 'zip'
      end
    end

    context 'with top-level options marked as authorized_options' do
      let(:options) do
        { authorize_options: %i[scope foo], scope: 'bar', foo: 'baz' }
      end

      it 'should include top-level options that are marked as :authorize_options' do
        expect(authorize_params['scope']).to eq 'bar'
        expect(authorize_params['foo']).to eq 'baz'
      end
    end
  end

  describe '#token_params' do
    subject(:token_params) { strategy.token_params}

    context 'with token_params option' do
      let(:options) do
        { token_params: { foo: 'bar', baz: 'zip' } }
      end

      it 'should include any authorize params passed in the :token_params option' do
        expect(token_params['foo']).to eq 'bar'
        expect(token_params['baz']).to eq 'zip'
      end
    end

    context 'with top-level options marked as authorized_options' do
      let(:options) do
        { token_options: %i[scope foo], scope: 'bar', foo: 'baz' }
      end

      it 'should include top-level options that are marked as :token_options' do
        expect(token_params['scope']).to eq 'bar'
        expect(token_params['foo']).to eq 'baz'
      end
    end
  end
end
