# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
class Skill < ApplicationRecord
	include Rails.application.routes.url_helpers

	belongs_to :parent, class_name: 'Skill', optional: true, dependent: :destroy
	has_many :subskills, class_name: 'Skill', foreign_key: 'parent_id', dependent: :destroy
	has_many :technician_skills, dependent: :destroy
	has_many :technicians, through: :technician_skills
	has_many :labours

	validates :name, presence: true

	scope :skills,  -> { where(parent_id: nil) }
	scope :subskills, -> { where.not(parent_id: nil) }

	def skill?
		parent_id.nil?
	end

	def subskills?
		!skill?
	end

	def self.skills_and_subskills
		skills + subskills
	end

	def build_back_path
		skill? ? categories_path : category_path(parent_id)
	end
end
