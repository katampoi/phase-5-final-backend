class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]
  before_action :authorize_admin, only: [:create, :destroy]
  
    def show_me
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def show
      user = User.find_by!(id: params[:id])
      render json:  user, status: 200
    end
  
    def create
      @user = User.create!(user_params)
       if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      # else
      #   render json: { error: 'failed to create user' }, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      head :no_content
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :password_confirmation, :user_type)
    end
end
