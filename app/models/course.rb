class Course < ApplicationRecord
  belongs_to :studio
  has_many :registrations
  has_many :customers, through: :registrations
  has_one :schedule
end
