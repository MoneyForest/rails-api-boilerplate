json.teams @teams.each do |team|
  json.team do
    json.partial! partial: 'team', locals: { team: team }
  end
end
