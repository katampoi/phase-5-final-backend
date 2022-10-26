class CategoriesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    #GET: /categories
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    #GET: /categories/:id
    def show
        category = Category.find(params[:id])
        render json: category, status: :ok      
    end

    def create
        category = Category.create!(category_params)
        render json: category, status: :created
    end

    #PATCH: /categories/:id
    def update
        category = Category.find(params[:id])
        category.update!(category_params)
        render json: category, status: :ok
    end

    #DELETE: /categories/:id
    def destroy
        category = Category.find(params[:id])
        category.destroy

        head :no_content
    end

    private
    def category_params
        params.permit(:category_name, :subscribe)
    end

    def render_not_found_response
        render json: {error: "Category not found"}
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
