class User < ApplicationRecord
  has_many :posts
  has_many :articles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  HEX_REGEX = /\A[#]{1}[\w]{6}\z/
  validates :color, format: { with: HEX_REGEX }
end
