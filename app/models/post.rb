class Post < ApplicationRecord
  # belongs_to :user
  # has_many :likes  
  # has_many :comments
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
