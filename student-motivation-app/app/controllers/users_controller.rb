class UsersController < ApplicationController

    def index
        render json: User.all, status: 200
      end
    
      def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        session[:user_type] = user.user_type
        render json: user, status: :created
      end
  
      def show
        render json: @user
      end
  
      def update
        user = User.find(params[:id])
        user.update!(update_user_params)
        render json: user, status: :updated
      end
    
      def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
      end
    
      private
    
      def user_params
        params.permit(:email, :username, :password, :password_confirmation, :user_type)
      end

      def update_user_params
        params.permit(:username, :password, :password_confirmation)
      end
end
