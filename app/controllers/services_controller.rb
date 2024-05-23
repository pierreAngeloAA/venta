class ServicesController < ApplicationController
	before_action :authorize_client
	before_action :set_service, only: [:show, :edit, :update, :destroy, :add_labour]

	def index
    @services = Service.all
	end

	def show
    @service_labour = ServiceLabour.new
    labours_of_services
	end

	def new
    @service = Service.new
	end

	def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to @service, notice: 'El servicio fue creado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
	end

	def edit
	end

	def update
    if @service.update(service_params)
      redirect_to @service, notice: 'El servicio fue actualizado exitosamente.'
    else
      render :edit
    end
	end

	def destroy
    @service.destroy
    redirect_to services_path, notice: 'El servicio fue eliminado exitosamente.'
	end

	def add_labour
    @service_labour = ServiceLabour.new(service_labour_params)

    if @service_labour.save
      redirect_to service_path(@service.id), notice: 'Se agregó la labor correctamente.'
    else
			labours_of_services
      render :show, status: :unprocessable_entity
    end
	end

	def delete_labour
    @service_labour = ServiceLabour.find(params[:id])
    service_id = @service_labour.service_id
    @service_labour.destroy
    redirect_to service_path(service_id), notice: 'Labor eliminada exitosamente.'
	end

	private
	def labours_of_services
    @labours = @service.service_labours
	end

	def set_service
    @service = Service.find(params[:id])
	end

	def service_params
		params.require(:service).permit(
			:client_id,
			:technician_id,
			:description,
			:initial_date,
			:end_date
		)
	end

	def service_labour_params
		params.require(:service_labour).permit(
			:service_id,
			:labour_id,
			:duration,
			:description
		)
	end
end