require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'relations' do
    it { is_expected.to have_many :tasks_project }
    it { is_expected.to have_many :project }
    it { is_expected.to have_many :users_task }
    it { is_expected.to have_many :user }
  end
end
