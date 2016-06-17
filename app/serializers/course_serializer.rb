class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :instructor, :description, :category_tags

  has_many :customers
  belongs_to :studio
end
