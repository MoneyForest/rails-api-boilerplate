class AddIndexesToTasks < ActiveRecord::Migration[6.0]
  def change
    add_index :tasks, :parent_id
    add_index :tasks, :creator_id
    add_index :tasks, :assignee_id
  end
end
