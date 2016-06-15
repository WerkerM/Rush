class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :courses
end
