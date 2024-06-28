require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  before do
    @user = User.create(username: 'InovaUser')
    @post = Post.create(title: 'Title of Post', body: 'Body of Post', user_id: @user.id)
  end

  describe 'GET Posts API' do
    context 'when the request to Get All Posts for Specific User and Posts List Not Empty' do
      it 'returns all posts' do
        get '/api/posts', params: { user_id: @user.id }
        expect(response).to have_http_status(200)
      end
    end
  end

  # Post Post API
  describe 'POST Post API', type: :request do
    context 'when the request to POST Specified Post with Authorization Token' do
      it 'returns specified post' do
        post "/api/posts", params: {body: 'Body of Post', title: 'Title of Post', user_id: @user.id}
        expect(response).to have_http_status(201)
      end
    end
  end 
end