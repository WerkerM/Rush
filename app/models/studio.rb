class Studio < ApplicationRecord
  has_many :courses
  has_many :registrations, through: :courses
  has_many :customers, through: :registrations
end
