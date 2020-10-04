require 'rails_helper'

RSpec.describe '/healthz', type: :request do
  describe 'GET /healthz' do
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid request headers'

      it 'returns a 200 response' do
        subject
        expect(response).to have_http_status :ok
      end
    end

    context 'when invalid request' do
      include_context 'with invalid request headers'

      it 'returns a 401 response' do
        subject
        expect(response).to have_http_status :unauthorized
      end
    end

    context 'when JWT decodeError' do
      include_context 'with valid request headers'

      before do
        allow(JsonWebToken).to receive(:decode).and_raise(JWT::VerificationError)
      end

      it 'returns a 401 response' do
        subject
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
