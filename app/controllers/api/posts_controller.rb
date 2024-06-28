module Api
  class PostsController < ApplicationController
    before_action :validate_user, only: %i[index create]
    PAGE_SIZE = 10

    def index
      begin
        @pagy = nil
        render json: { message: "User Not Found"}, status: :not_found and return if @user.nil?
        @pagy, @posts = pagy(Post.where(user_id: params[:user_id]), items: PAGE_SIZE)
      rescue Exception => e
        @posts = []
      end
      @serializer = PostSerializer.new(@posts).serializable_hash
      render json: { data: @serializer[:data], pagination: @pagy }, status: :ok
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        render json: PostSerializer.new(@post).serializable_hash, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def top_posts
      begin
        @pagy = nil
        @pagy, @posts = pagy(Post.joins(:reviews).group(:id).order('AVG(reviews.rate) DESC'), items: PAGE_SIZE)
      rescue Exception => e
        @posts = []
      end
      @serializer = PostSerializer.new(@posts).serializable_hash
      render json: { data: @serializer[:data], pagination: @pagy }, status: :ok
    end

    private

    def validate_user
      @user = User.find_by(id: params[:user_id])
    end

    def post_params
      params.permit(:title, :body, :user_id)
    end
  end
end
