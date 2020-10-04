require 'rails_helper'

RSpec.describe '/api/v1/tasks', type: :request do
  describe 'GET /api/v1/tasks' do
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid request headers'

      context 'with a task associated user' do
        include_context 'with a task associated user'

        it 'returns a 200 response' do
          subject
          expect(response).to have_http_status :ok
        end
      end

      context 'with no task associated user' do
        it 'returns a 200 response' do
          subject
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid request headers'

        it 'returns a 401 response' do
          subject
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end
end
