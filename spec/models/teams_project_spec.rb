require 'rails_helper'

RSpec.describe TeamsProject, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to :team }
    it { is_expected.to belong_to :project }
  end
end
