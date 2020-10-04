FactoryBot.define do
  factory :tasks_project do
    task_id { task.id }
    project_id { project.id }
  end
end
