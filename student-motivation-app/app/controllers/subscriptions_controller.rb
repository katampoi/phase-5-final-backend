class SubscriptionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    

    # GET: /subscriptions
    def index
        subscription = Subscription.all
        render json: Subscription.all, status: :ok
    end

    # GET: /subscription/:id
    def show
        subscription = Subscription.find(params[:id])
        render json: subscription, status: :ok
    end

    # POST: /subscriptions
    def create
        Subscription = Subscription.create!(subscription_params)
        render json: subscription, status: :created
    end
    
    # PATCH: /subscription/:id
    def update
        subscription = Subscription.find(params[:id])
        subscription.update!(subscription_params)
        render json: subscription, status: :ok
    end

    # DELETE: /subscription/:id
    def destroy
        subscription = Subscription.find(params[:id])
        subscription.destroy
        head :no_content
    end

    private
    def subscription_params
        params.permit(:user_id, :category_id)
    end

    def render_not_found_response
        render json: {error: "subscription not found"}
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        
    end


end
