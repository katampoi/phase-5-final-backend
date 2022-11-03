class PostsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    # GET: /posts
    def index
        posts = Post.all
        render json: posts, status: :ok
    end

    #GET: /posts/:id
    def show
        post = Post.find(params[:id])
        render json: post, status: :ok      
    end

    #POST: /posts
    def create
        post = Post.create!(post_params)
        render json: post, status: :created
    end

    #PATCH: /posts/:id
    def update
        post = Post.find(params[:id])
        post.update!(post_params)
        render json: post, status: :ok
    end

    #DELETE: /posts/:id
    def destroy
        post = Post.find(params[:id])
        post.destroy

        head :no_content
    end


     # PATCH: /posts/:id/like
     def increase_likes
        post = Post.find(params[:id])
        post.update!(like: post.like + 1)
        render json: post, status: :ok
    end

    # PATCH: /posts/:id/dislike
    def decrease_likes
        post = Post.find(params[:id])
        post.update!(dislike: post.dislike + 1)
        render json: post, status: :ok
    end

    private
    def post_params
        params.permit(:user_id, :category_id, :title, :media_img, :media_vid, :content)
    end

    def render_not_found_response
        render json: {error: "Post not found"}
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
