require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /api/v1/auth' do
    let(:name) { Faker::Name.name }
    let(:nickname) { Faker::Games::Pokemon.name }
    let(:email) { Faker::Internet.safe_email }
    let(:password) { 'password' }
    let(:password_confirmation) { password }
    let(:params) do
      {
        name: name,
        nickname: nickname,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      }
    end

    context 'with authorization params' do
      it { is_expected.to eq(200) }
    end
  end
end
