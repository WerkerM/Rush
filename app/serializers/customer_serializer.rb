class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :courses
  has_many :studios
end
