json.teams @teams.each do |team|
  json.team {
    json.partial! partial: 'team', locals: { team: team }
  }
end
