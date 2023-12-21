class Technician < ApplicationRecord
  belongs_to :user
  has_many :technician_specialties
  has_many :specialties, through: :technician_specialties
end
  