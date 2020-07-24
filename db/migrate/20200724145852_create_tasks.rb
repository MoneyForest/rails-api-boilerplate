class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :deadline
      t.string :repeats
      t.boolean :completed, null: false, default: false
      t.boolean :parent_id
      t.integer :assignee_id
      t.integer :creator_id, null: false

      t.timestamps
    end
  end
end
