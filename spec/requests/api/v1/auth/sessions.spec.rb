require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  describe 'POST /api/v1/auth/sign_in' do
    let(:user) { create(:user) }
    let(:params) do
      {
        email: user.email,
        password: user.password
      }
    end

    context 'with authorization params' do
      it { is_expected.to eq(200) }
    end
  end
end
