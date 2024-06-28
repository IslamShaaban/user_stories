class User < ApplicationRecord
  has_many :posts
  has_many :reviews
  validates :username, presence: true, uniqueness: true
end
