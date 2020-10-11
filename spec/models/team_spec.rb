require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relations' do
    it { is_expected.to have_many :teams_project }
    it { is_expected.to have_many :project }
    it { is_expected.to have_many :users_team }
    it { is_expected.to have_many :user }
  end
end
