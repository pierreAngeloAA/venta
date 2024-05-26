class ClientsController < ApplicationController
	before_action :find_client, except: [:index, :show, :new, :create]

	def index
		@clients = Client.all
	end

	def show
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
	end

	def update
		if @client.update(client_params)
				redirect_to clients_path, notice: 'Client was successfully updated.'
		else
				render :index, status: :unprocessable_entity
		end
	end

	def destroy
		@client.destroy
		redirect_to clients_url, notice: 'Client was successfully destroyed.'
	end

    # def assign_user
    #     if @client.email.blank?
    #         flash[:error] = "The client must have assigned an email first"
    #         return render :edit, status: :unprocessable_entity
    #     end

    #     password = SecureRandom.alphanumeric(10)
    #     user = User.new(email: @client.email, password: password, password_confirmation: password, role: :client)
    #     if user.save
    #         @client.update(user_id: user.id)
    #         UserMailer.welcome_new_user(user, password).deliver_later
    #         redirect_to client_path(@client), notice: 'Client was successfully updated.'
    #     else
    #         flash[:error] = user.errors.full_messages.join(', ')
    #         render :edit, status: :unprocessable_entity
    #     end
    # end

    private

	def find_client
		@client = Client.find(params[:id])
	end

	def client_params
		params.require(:client).permit(
				:name,
				:email
		)
	end
end
