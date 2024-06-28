class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, :body, presence: true
end