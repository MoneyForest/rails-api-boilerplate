class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_archived, :created_at, :updated_at
end
