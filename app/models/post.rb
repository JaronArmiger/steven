class Post < ApplicationRecord
	has_many :comments, as: :commentable
	belongs_to :user
	has_one_attached :image
end
