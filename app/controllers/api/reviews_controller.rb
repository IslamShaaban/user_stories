module Api
  class ReviewsController < ApplicationController
    PAGE_SIZE = 10

    def create
      @post = Post.find_by(id: params[:post_id])
      @user = User.find_by(id: params[:user_id])
      render json: { message: "User Not Found" }, status: :not_found if @user.nil?
      render json: { message: "Post Not Found" }, status: :not_found if @post.nil?

      @review = Review.new(review_params)

      if @review.save
        render json: ReviewSerializer.new(@review).serializable_hash, status: :created
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end

    def index
      @post = Post.find_by(id: params[:post_id])
      if @post.nil?
        render json: { message: "Post Not Found" }, status: :not_found
        return
      end

      begin
        @pagy, @reviews = pagy(Review.where(post_id: params[:post_id]), items: PAGE_SIZE)
      rescue Pagy::OverflowError => e
        render json: { message: "Page out of range" }, status: :unprocessable_entity
        return
      end

      @serializer = ReviewSerializer.new(@reviews).serializable_hash
      render json: { data: @serializer[:data], pagination: @pagy }, status: :ok
    end

    private

    def review_params
      params.permit(:rate, :comment, :post_id, :user_id)
    end
  end
end
