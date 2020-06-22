class Article < ApplicationRecord
	has_many :comments, as: :commentable
	belongs_to :user
	has_many_attached :images
end
