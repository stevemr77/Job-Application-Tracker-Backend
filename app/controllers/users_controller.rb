class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:create, :login]
    
    def create
        @user = User.create user_params
        
        if @user.valid?
            render json: @user, status: :created
        else
            render json: @user.errors.messages
        end
        
    end

    def login
        @user = User.find_by(name: params[:user][:name])
        
        if @user && @user.authenticate(params[:user][:password])
            @token = JWT.encode({user_id: @user.id}, 'this is our little secret')

            render json: {token: @token, user: @user}, status: :ok
        else 
            render json: {error: "Invalid Username and/or Password"}, status: :unauthorized
        end
    end

    def profile                                                #READ action show
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
        params.require(:user).permit([:name, :password])
    end

end
