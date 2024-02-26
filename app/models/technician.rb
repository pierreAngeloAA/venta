class Technician < ApplicationRecord
    has_many :technician_skills
    has_many :skills, through: :technician_skills
    
    validates_presence_of :name, :last_name
end
