class Customer < ApplicationRecord
  has_secure_password

  has_many :registrations
  has_many :courses, through: :registrations
  has_many :studios, through: :courses
end
