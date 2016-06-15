class StudioSerializer < ActiveModel::Serializer
  attributes :id, :name, :address

  has_many :courses
  has_many :customers
end
