require 'rails_helper'

RSpec.describe '/healthz', type: :request do
  describe 'GET /healthz' do
    include_context 'a user defined'

    context 'valid request' do
      let(:headers) do
        {
          'Authorization' => 'Basic ' + auth_token
        }
      end

      it 'returns a 200 response' do
        subject
        expect(response).to have_http_status :ok
      end
    end

    context 'invalid request' do
      let(:headers) do
        {
          'Authorization' => 'Basic ' + auth_token.reverse
        }
      end

      it 'returns a 401 response' do
        subject
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
