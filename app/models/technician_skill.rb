# == Schema Information
#
# Table name: technician_skills
#
#  id            :integer          not null, primary key
#  level         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  skill_id      :integer          not null
#  technician_id :integer          not null
#
# Indexes
#
#  index_technician_skills_on_skill_id                    (skill_id)
#  index_technician_skills_on_technician_id               (technician_id)
#  index_technician_skills_on_technician_id_and_skill_id  (technician_id,skill_id) UNIQUE
#
# Foreign Keys
#
#  skill_id       (skill_id => skills.id)
#  technician_id  (technician_id => technicians.id)
#
class TechnicianSkill < ApplicationRecord
  belongs_to :technician
  belongs_to :skill

  validates_presence_of :technician_id, :skill_id, :level
  validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :technician_id, uniqueness: { scope: :skill_id, message: "cannot have skill duplicated" }
end