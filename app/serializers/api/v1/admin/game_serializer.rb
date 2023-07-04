class Api::V1::Admin::GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_logo
  belongs_to :game_type, serializer: GameTypeSerializer
  
  def game_logo
    "#{ENV["BASE_URL"]}#{object.game_logo.url}" if object.game_logo.present?
  end
end