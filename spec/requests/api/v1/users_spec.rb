require 'rails_helper'

RSpec.describe '/api/v1/users', type: :request do
  describe 'POST /api/v1/users/authenticate' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    let(:headers) do
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    end

    context 'when valid request' do
      include_examples 'committer schema check'

      let(:params) do
        {
          'email' => email,
          'password' => password
        }
      end

      it 'returns a 200 response' do
        subject
        expect(response).to have_http_status :ok
      end
    end

    context 'when invalid request' do
      include_examples 'committer schema check'

      let(:params) do
        {
          'email' => email.reverse,
          'password' => password.reverse
        }
      end

      it 'returns a 401 response' do
        subject
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
