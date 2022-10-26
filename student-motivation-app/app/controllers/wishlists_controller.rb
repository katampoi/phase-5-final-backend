class WishlistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
end

# GET: /wishlist
def index
    wishlist = Wishlist.all
    render json: Wishlist.all, status: :ok
end

# GET: /wishlist/:id
def show
    wishlist = Wishlist.find(params[:id])
    render json: wishlist, status: :ok
end

# POST: /wishlist
def create
    
end

# PATCH: /wishlist/:id
def update
    wishlist = Wishlist.find(params[:id])
    wishlist.update!(wishlist_params)
    render json: wishlist, status: :ok
end

# DELETE: /wishlist/:id
def destroy
    wishlist = Wishlist.find(params[:id])
    wishlist.destroy
    head :no_content
end

private

def wishlist_params
    params.permit(:user_id)
    
end

def render_not_found_response
    render json: {error: "Content not found"}
end

def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    
end


