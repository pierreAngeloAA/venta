class Skill < ApplicationRecord
    has_many :technician_skills, dependent: :destroy
    has_many :technicians, through: :technician_skills

    validates :name, presence: true
end