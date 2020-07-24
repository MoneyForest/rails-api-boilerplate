class AddIndexesToProjects < ActiveRecord::Migration[6.0]
  def change
    add_index :projects, :team_id
  end
end
