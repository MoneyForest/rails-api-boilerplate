class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :deadline_at, :repeats, :is_completed, :parent_task_id, :assigned_user_id,
             :created_user_id, :created_at, :updated_at
end
