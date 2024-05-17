# == Schema Information
#
# Table name: labours
#
#  id         :integer          not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  skill_id   :integer          not null
#
# Indexes
#
#  index_labours_on_skill_id  (skill_id)
#
# Foreign Keys
#
#  skill_id  (skill_id => skills.id)
#
class Labour < ApplicationRecord
  belongs_to :skill

  validates_presence_of :title

  scope :root_labour, ->(skill_id) {joins(:skill).where(skill_id: skill_id).or(where(skill: {parent_id: skill_id}))}
end
