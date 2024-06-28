module Api
  class UsersController < ApplicationController
    def index
      @users = UserSerializer.new(User.all.order(created_at: :desc)).serializable_hash
      render json: @users, status: :ok
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: userSerializer.new(@user).serializable_hash, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:username)
    end
  end
end