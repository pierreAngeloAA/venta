class SkillsController < ApplicationController
    def index
        @skills = Skill.all
    end

    def show
        skill
    end

    def new
        @skill = Skill.new
    end

    def create
        @skill = Skill.new(skill_params)

        if @skill.save
            redirect_to skills_path, notice: 'Skill was successfully created.'
        else
            render :new
        end
    end

    def edit
        skill
    end

    def update
        skill
        if skill.update(skill_params)
            redirect_to skills_path, notice: 'Skill was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        skill
        skill.destroy
        redirect_to  skills_path, notice: 'Skill was successfully destroyed.'
    end

    private

    def skill
        @skill = Skill.find(params[:id])
    end

    def skill_params
        params.require(:skill).permit(
            :name
        )
    end
end
