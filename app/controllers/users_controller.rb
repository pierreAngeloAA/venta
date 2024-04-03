class UsersController < ApplicationController

    def index
       @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to users_path, notice: 'Usuario actualizado con éxito.'
        else
          render :edit
        end
    end
    private

    def user_params
        params.require(:user).permit(
            :nombre,
            :email, 
            :password, 
            :password_confirmation,
            :role
        )
    end      
end
  