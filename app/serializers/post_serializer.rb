class PostSerializer < ApplicationSerializer
  attributes :title, :body
  
  attribute :reviews_count do |object|
    object.reviews.count
  end
  
  attribute :owner do |object|
    object.user.username
  end
end