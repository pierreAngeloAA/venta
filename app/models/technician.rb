class Technician < ApplicationRecord
  belongs_to :user
  has_many :technician_skills
  has_many :skills, through: :technician_skills

  validates :name, presence: true
  validates :age, presence: true
  validates :speciality, presence: true
  validates :user_id, presence: true
end
