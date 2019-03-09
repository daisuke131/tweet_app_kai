# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :like_posts, through: :likes, source: :post
  
  has_many :comments, dependent: :destroy
end
