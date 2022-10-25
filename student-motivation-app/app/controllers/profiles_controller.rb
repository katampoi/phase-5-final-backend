class ProfilesController < ApplicationController
    before_action :authorize
    def create
        # @user =current_user
        # profile = @user.profile.create!(profile_params)
        profile = Profile.create!(profile_params)       
        render json: profile, status: :created
    end

    def show
        profile = Profile.find(params[:id])
        render json: profile, status: :ok
        # render json:current_user.profile
    end

    def update_profile
    
        profile = current_user.profile.update!(profile_params)
        render json: current_user.profile, status: 200
    end

    # def update
    #     profile = Profile.find(params[:id])
    #     profile.update(profile_params)
    #     render json: profile
    # end

    private

    def profile_params
        params.permit(:bio, :profile_pic, :user_id)
    end
end
