class TechniciansController < ApplicationController
    def index
        @technicians = Technician.all
    end

    def show
        technician
        @technician_skill = TechnicianSkill.new
        @skills = technician.technician_skills
    end

    def new
        @technician = Technician.new
    end

    def create
        @technician = Technician.new(technician_params)

        if @technician.save
            redirect_to technicians_path, notice: 'Técnico creado con éxito.'
        else
            render :new
        end
    end

    def edit
        technician
    end

    def update
        if technician.update(technician_params)
            redirect_to technicians_path, notice: 'Técnico actualizado con éxito.'
        else
            render :edit
        end
    end

    def destroy
        technician.destroy
        redirect_to technicians_path, notice: 'Técnico eliminado con éxito.'
    end

    def add_skill
        @technician_skill = TechnicianSkill.new({technician_id:  technician.id, skill_id: params[:skill_id]})

        if @technician_skill.save
            puts "="*100
            puts @technician_skill
            puts "="*100
            redirect_to technician_path(@technician_skill.technician_id), notice: 'Technician Specialty was successfully created.'
        else
            puts "="*100, "ERROR"
            puts @technician_skill.errors.full_messages
            puts "="*100
            
            @skill = @technician.technician_specialties
            render :show
        end
    end

    def delete_skill
        skill = TechnicianSkill.find(params[:skill_id])
        skill.destroy
        redirect_to technician_path(params[:technician_id]), notice: 'Especialidad eliminada exitosamente.'
      end

    private

    def technician
        @technician = Technician.find(params[:id])
    end

    def technician_params
        params.require(:technician).permit(
            :user_id
        )
    end
end