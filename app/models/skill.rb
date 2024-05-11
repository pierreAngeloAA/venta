# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Skill < ApplicationRecord
	include Rails.application.routes.url_helpers

	belongs_to :parent, class_name: 'Skill', optional: true, dependent: :destroy
	has_many :subskills, class_name: 'Skill', foreign_key: 'parent_id', dependent: :destroy
	has_many :technician_skills, dependent: :destroy
	has_many :technicians, through: :technician_skills

	validates :name, presence: true

	scope :categories,  -> { where(parent_id: nil) }
	scope :subcategories, -> { where.not(parent_id: nil) }

	def category?
		parent_id.nil?
	end

	def subcategory?
		!category?
	end

	def self.categories_and_subcategories
		categories + subcategories
	end

	def build_back_path
		area? ? areas_path : category_path(parent_id)
	end
end
