class ClientsController < ApplicationController
    def index
        @clients = Client.all
    end
  
    def show
        client
    end
  
    def new
        @client = Client.new
    end
  
    def create
        @client = Client.new(client_params)
      
        if @client.save
            redirect_to clients_path, notice: 'Client was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end      
  
    def edit
        client
    end
  
    def update
        if client.update(client_params)
            redirect_to clients_path, notice: 'Client was successfully updated.'
        else
            render :index, status: :unprocessable_entity
        end
    end
  
    def destroy
        client.destroy
        redirect_to clients_url, notice: 'Client was successfully destroyed.'
    end
  
    private
    def client
        @client = Client.find(params[:id])
    end
  
    def client_params
        params.require(:client).permit(
            :name,
            :user_id
            )
    end
  end