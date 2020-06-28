class Post < ApplicationRecord
	has_many :comments, as: :commentable
	belongs_to :user
	has_one_attached :image

	validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
									 message: "must be valid image format" },
					 size: { less_than: 5.megabytes,
					 		 message: "should be less than 5MB" }
	HEX_REGEX = /\A[#]{1}[\w]{6}\z/
	validates :font_color, format: { with: HEX_REGEX }
	validates :body_color, format: { with: HEX_REGEX }
	validates :user_id, presence: true
end
