class AddIndexToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :creator_id, :string
    add_index :teams, :creator_id
  end
end
