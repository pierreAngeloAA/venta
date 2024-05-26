class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update, :destroy]
    # for testing only
    
    def index
       @users = User.all
    end

    def edit
    end

    def update
        if @user.update(user_params)
          redirect_to users_path, notice: 'Usuario actualizado con éxito.'
        else
          render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path, notice: 'Usuario eliminado con éxito.'
    end

    private
    def find_user
        @user = User.find(params[:id])
    end
end
