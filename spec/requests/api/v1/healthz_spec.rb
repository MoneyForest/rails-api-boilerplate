require 'rails_helper'

RSpec.describe '/api/v1/healthz', type: :request do
  describe 'GET /api/v1/healthz' do
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      it 'returns a 200 response' do
        subject
        expect(response).to have_http_status :ok
      end
    end

    context 'when invalid request' do
      include_context 'with invalid authenticated request headers'

      it 'returns a 401 response' do
        subject
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
