require 'rails_helper'

RSpec.describe '/no_auth/healthz', type: :request do
  describe 'GET /no_auth/healthz' do
    context 'when valid request' do
      it 'returns a 200 response' do
        subject
        expect(response).to have_http_status :ok
      end
    end
  end
end
