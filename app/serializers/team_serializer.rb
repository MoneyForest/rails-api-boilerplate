class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_user_id, :created_at, :updated_at
end
