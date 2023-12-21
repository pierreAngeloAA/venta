class Specialty < ApplicationRecord
    has_many :technician_specialties
    has_many :technicians, through: :technician_specialties
end
