class Api::V1::Admin::GameSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :game_type, serializer: GameTypeSerializer
end