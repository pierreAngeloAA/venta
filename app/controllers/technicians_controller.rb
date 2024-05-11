class TechniciansController < ApplicationController
    before_action :find_technician, only: [:show, :edit, :update, :destroy, :add_skill]

    def index
      @technicians = Technician.all
    end

    def show
      @technician_skill = TechnicianSkill.new
      @skills = @technician.technician_skills
    end

    def new
      @technician = Technician.new
    end

    def create
      @technician = Technician.new(technician_params)

      if @technician.save
        redirect_to technicians_path, notice: 'Técnico creado con éxito.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @technician.update(technician_params)
        redirect_to technicians_path, notice: 'Técnico actualizado con éxito.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @technician.destroy
      redirect_to technicians_path, alert: 'Técnico eliminado con éxito.'
    end

    def add_skill
      @technician_skill = TechnicianSkill.new(technician_id: @technician.id, skill_id: params[:skill_id], level: params[:level])

      if @technician_skill.save
        redirect_to technician_path(@technician_skill.technician_id), notice: 'Habilidad agregada correctamente.'
      else
        @skills = @technician.technician_skills
        render :show, status: :unprocessable_entity
      end
    end

    def delete_skill
      @technician_skill = TechnicianSkill.find(params[:id])
      technician_id = @technician_skill.technician_id
      @technician_skill.destroy
      redirect_to technician_path(technician_id), alert: 'Habilidad eliminada exitosamente.'
    end

    private

    def find_technician
      @technician = Technician.find(params[:id])
    end

    def add_skill_params
      params.require(:technician_skill).permit(:skill_id).merge(technician_id: @technician.id)
    end

    def technician_params
      params.require(:technician).permit(:name, :email)
    end
  end
