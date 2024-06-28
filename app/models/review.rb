class Review < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :rate, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
