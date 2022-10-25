class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]
  
    def show_me
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
  
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      head :no_content
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :username, :firstName, :password, :password_confirmation, :user_type)
    end
end
