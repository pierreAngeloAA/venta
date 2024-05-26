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

	belongs_to :parent, class_name: 'Skill', optional: true
	has_many :subskills, class_name: 'Skill', foreign_key: 'parent_id', dependent: :destroy
	has_many :technician_skills, dependent: :destroy
	has_many :technicians, through: :technician_skills
	has_many :labours

	validates :name, presence: true

	scope :skills,  -> { where(parent_id: nil).order("name") }
	scope :subskills, -> { where.not(parent_id: nil) }
	scope :sort_by_parent_name, -> {
		joins('LEFT JOIN skills AS parents ON parents.id = skills.parent_id')
		.order('parents.name, skills.name')
	}

	before_destroy :ensure_not_root_skill
  before_destroy :ensure_not_linked_to_labour

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

	private

  def ensure_not_root_skill
    if skill?
      errors.add(:base, "Cannot delete a root skill without a parent.")
      throw(:abort)
    end
  end

  def ensure_not_linked_to_labour
    if labours.exists?
      errors.add(:base, "Cannot delete a skill that is linked to a labour.")
      throw(:abort)
    end
  end
end
