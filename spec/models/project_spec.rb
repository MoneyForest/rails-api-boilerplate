require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'relations' do
    it { is_expected.to have_many :teams_project }
    it { is_expected.to have_many :team }
    it { is_expected.to have_many :tasks_project }
    it { is_expected.to have_many :task }
    it { is_expected.to have_many :users_project }
    it { is_expected.to have_many :user }
  end
end
