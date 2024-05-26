class CategoriesController < ApplicationController
	before_action :find_category, only: [:show]
	def index
		@root_categories = Skill.skills
	end
	
	def show
		@subcategories = Skill.where(parent_id: @category.id)
	end

	private
	def find_category
		@category = Skill.find(params[:id])
	end

	def category_params
		params.require(:category).permit(
				:name,
				:parent_id
		)
	end
end
  