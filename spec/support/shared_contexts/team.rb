RSpec.shared_context 'with a team associated user' do
  let(:team) { create(:team) }
  before do
    create(:users_team, user: user, team: team)
  end
end
