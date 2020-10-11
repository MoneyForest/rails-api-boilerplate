require 'rails_helper'

RSpec.describe JsonWebToken do
  include_context 'with a defined user'

  describe 'decode auth_token' do
    subject { JsonWebToken.decode(auth_token) }

    context 'when auth_token is valid' do
      let(:auth_token) { JsonWebToken.encode({ user_id: user.id, exp: (Time.zone.now + 2.weeks).to_i }) }
      it { is_expected.to_not be_nil }
    end

    context 'when auth_token is invalid' do
      let(:auth_token) { Faker::Alphanumeric.alpha(number: 108) }
      it { is_expected.to be_nil }
    end
  end

  describe 'encode payload' do
    let(:user_id) { user.id }
    let(:exp) { (Time.zone.now + 2.weeks).to_i }
    subject { JsonWebToken.encode({ user_id: user_id, exp: exp }) }

    context 'when payload is valid' do
      it 'encode successfully and encode data can decode' do
        expect(JsonWebToken.decode(subject)[:user_id]).to eq(user_id)
        expect(JsonWebToken.decode(subject)[:exp]).to eq(exp)
      end
    end
  end
end
