class Api::V1::TeamSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :team_name, :created_at, :updated_at
  has_many :players
end
