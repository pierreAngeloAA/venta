class TechniciansController < ApplicationController
    def index
        @technicians = Technician.all
    end

    def show
    end

    def new
        @technician = Technician.new
    end

    def create
        @technician = Technician.new
        @technician.user_id = current_user.id

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

    private

    def technician
        @technician = Technician.find(params[:id])
    end
end