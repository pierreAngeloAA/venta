class Technician < ApplicationRecord
    belongs_to :user, optional: true
    has_many :technician_skills, dependent: :destroy
    has_many :skills, through: :technician_skills

    validates :name,:email, presence: true
    validates :user_id, uniqueness: true, allow_nil: true
end
