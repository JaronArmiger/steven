class Setting < ApplicationRecord
	HEX_REGEX = /\A[#]{1}[\w]{6}\z/
    validates :color, format: { with: HEX_REGEX, 
    							message: "must be in hex format" }
end
