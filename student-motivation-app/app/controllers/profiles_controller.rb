class ProfilesController < ApplicationController
    def create
        user = User.find(session[:user_id])
        profile = user.profile.create!(profile_params)
        render json: profile, status: :created
    end

    def show
        profile = Profile.find(params[:id])
        render json: profile, status: :ok
    end

    def update
       profile = Profile.find(params[:id])
       profile.update!(profile_params)
       render json: profile, status: 200
    end

    private

    def profile_params
        params.permit(:bio, :profile_pic)
    end
end
