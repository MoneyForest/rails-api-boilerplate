require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /auth_user' do
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }
    let(:user) { create(:user, email: email, password: password) }

    context 'valid request' do
      let(:params) do
        {
          'email' => user.email,
          'password' => user.password
        }
      end

      it 'returns a 200 response' do
        subject
        expect(response).to have_http_status :ok
      end
    end

    context 'invalid request' do
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
