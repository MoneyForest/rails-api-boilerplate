class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :team_id, null:false
      t.boolean :archived, null: false, default: false

      t.timestamps
    end
  end
end
