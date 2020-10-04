RSpec.shared_context 'with a task associated user' do
  let(:task) { create(:task) }
  before do
    create(:users_task, user: user, task: task)
  end
end
