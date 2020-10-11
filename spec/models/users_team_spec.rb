require 'rails_helper'

RSpec.describe UsersTeam, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :team }
  end
end
