class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    
    #POST: /reviews
    def create
        review = Review.create!(review_params)
        render json: review, status: :created
    end

    #DELETE: /reviews/:id
    def destroy
        review = Review.find(params[:id])
        review.destroy

        head :no_content
    end

    private
    def review_params
        params.permit(:user_id, :post_id, :like, :dislike, :comment)
    end

    def render_not_found_response
        render json: {error: "Review not found"}
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
