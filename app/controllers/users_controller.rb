class UsersController < ApplicationController
    
    
    def create
        @new_user = User.find_or_create_by user_params
        
        if @new_user.valid?
            render json: @new_user, status: :created
        else
            render json: @new_user.errors.messages
        end
        
    end

    def show                                                #READ action show
        @user = User.find(params[:id])
        render json: @user
    end
    
    def index                                               #READ action index
        @users = User.all

        render json: @users
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end

    private

    def user_params
        params.permit([:name])
    end

end
