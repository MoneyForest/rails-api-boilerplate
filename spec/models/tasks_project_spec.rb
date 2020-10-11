require 'rails_helper'

RSpec.describe TasksProject, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to :task }
    it { is_expected.to belong_to :project }
  end
end
