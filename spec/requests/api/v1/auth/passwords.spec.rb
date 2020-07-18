require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  describe 'PUT /api/v1/auth/password' do
    let(:user) { create(:user) }
    let(:password_new) { Faker::Internet.password }

    before do
      params = {
        email: user.email,
        password: user.password
      }

      post api_user_session_path, params: params
    end

    context 'with authorization params' do
      before do
        headers['access-token'] = response.header['access-token']
        headers['client'] = response.header['client']
        headers['uid'] = response.header['uid']
        params['password'] = password_new
        params['password_confirmation'] = password_new
      end

      it { is_expected.to eq(200) }
    end
  end
end
