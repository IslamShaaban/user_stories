require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  before do
    @user = User.create(username: 'InovaUser')
    @post = Post.create(title: 'Title of Post', body: 'Body of Post', user_id: @user.id)
    @review = Review.create(rate: 1, comment: 'WOWO', post_id: @post.id, user_id: @user.id)
  end

  describe 'GET Reviews API' do
    context 'when the request to Get All Posts for Specific User and Posts List Not Empty' do
      it 'returns all posts' do
        get "/api/posts/#{@post.id}/reviews", params: { post_id: @post.id }
        expect(response).to have_http_status(200)
      end
    end
  end
end