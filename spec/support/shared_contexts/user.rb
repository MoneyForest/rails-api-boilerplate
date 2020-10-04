RSpec.shared_context 'with a defined user' do
  before do
    user
    auth_token
  end

  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }
  let(:user) { create(:user, email: email, password: password) }
  let(:auth_token) { JsonWebToken.encode({ user_id: user.id, exp: (Time.zone.now + 2.weeks).to_i }) }
end
