class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :role, :phone_number, :created_at, :updated_at
end
