class Api::V1::PlayerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :phone_number, :created_at, :updated_at
end