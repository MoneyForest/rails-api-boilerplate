require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many :users_project }
    it { is_expected.to have_many :project }
    it { is_expected.to have_many :users_task }
    it { is_expected.to have_many :task }
    it { is_expected.to have_many :users_team }
    it { is_expected.to have_many :team }
  end
end
