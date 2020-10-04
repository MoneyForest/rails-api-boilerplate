json.tasks @tasks.each do |task|
  json.task do
    json.partial! partial: 'task', locals: { task: task }
  end
end
