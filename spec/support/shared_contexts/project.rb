RSpec.shared_context 'with a project associated user' do
  let(:project) { create(:project) }
  before do
    create(:users_project, user: user, project: project)
  end
end
