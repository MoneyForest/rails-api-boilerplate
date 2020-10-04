json.projects @projects.each do |project|
  json.project do
    json.partial! partial: 'project', locals: { project: project }
  end
end
