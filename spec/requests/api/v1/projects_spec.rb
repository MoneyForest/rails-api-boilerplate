require 'rails_helper'

RSpec.describe '/api/v1/projects', type: :request do
  describe 'GET /api/v1/projects' do
    include_context 'with committer schema check'
    include_context 'with a defined user'

    context 'when valid request' do
      include_context 'with valid authenticated request headers'

      context 'with a project associated user' do
        include_context 'with a project associated user'
        include_examples 'committer schema check'

        it 'returns a 200 response' do
          subject
          expect(response).to have_http_status :ok
        end
      end

      context 'with no project associated user' do
        include_examples 'committer schema check'

        it 'returns a 200 response' do
          subject
          expect(response).to have_http_status :ok
        end
      end
    end

    context 'when invalid request' do
      context 'when header is invalid' do
        include_context 'with invalid authenticated request headers'
        include_examples 'committer schema check'

        it 'returns a 401 response' do
          subject
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end
end
