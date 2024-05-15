class SkillsController < ApplicationController
	before_action :find_skill, only: [:show, :edit, :update, :destroy]
	def index
		@skills = Skill.all
	end

	def show
	end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)

		if @skill.save
				redirect_to skills_path, notice: 'Habilidad creada con éxito.'
		else
				render :new, status: :unprocessable_entity
		end
	end

	def edit
	end

	def update
		if @skill.update(skill_params)
				redirect_to skills_path, notice: 'Habilidad actualizada con exito.'
		else
				render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@skill.destroy
		redirect_to  skills_path, alert: 'Habilidad eliminada'
	end

	def index_area
		@skills = Skill.all
	end

	private
	def find_skill
		@skill = Skill.find(params[:id])
	end

	def skill_params
		params.require(:skill).permit(:name,:parent_id)
	end
end
