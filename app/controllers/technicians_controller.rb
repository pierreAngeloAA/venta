class TechniciansController < ApplicationController
  before_action :find_technician, only: [:show, :edit, :update, :destroy, :add_skill, :add_labour, :labours_and_skills_of_technician]

  def index
    @technicians = Technician.all
  end

  def show
    @technician_skill = TechnicianSkill.new
    @technician_labour = TechnicianLabour.new
    labours_and_skills_of_technician
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
      labours_and_skills_of_technician
      render :show, status: :unprocessable_entity
    end
  end

  def add_labour
    @technician_labour = TechnicianLabour.new(technician_id: @technician.id, labour_id: params[:labour_id], duration: params[:duration], total: params[:total])

    if @technician_labour.save
      redirect_to technician_path(@technician_labour.technician_id), notice: 'Labor agregada correctamente.'
    else
      labours_and_skills_of_technician
      render :show, status: :unprocessable_entity
    end
  end

  def delete_skill
    @technician_skill = TechnicianSkill.find(params[:id])
    technician_id = @technician_skill.technician_id
    @technician_skill.destroy
    redirect_to technician_path(technician_id), alert: 'Habilidad eliminada exitosamente.'
  end
  
  def delete_labour
    @technician_labour = TechnicianLabour.find(params[:id])
    technician_id = @technician_labour.technician_id
    @technician_labour.destroy
    redirect_to technician_path(technician_id), alert: 'Labor eliminada exitosamente.'
  end

  private  
  def labours_and_skills_of_technician
    @labours = @technician.technician_labours
    @skills = @technician.technician_skills
  end

  def find_technician
    @technician = Technician.find(params[:id])
  end

  # def add_skill_params
  #   params.require(:technician_skill).permit(:skill_id).merge(technician_id: @technician.id)
  # end

  def technician_params
    params.require(:technician).permit(:name, :email)
  end
end