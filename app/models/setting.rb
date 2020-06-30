class Setting < ApplicationRecord
	HEX_REGEX = /\A[#]{1}[a-fA-F0-9]{6}\z/
    validates :color, format: { with: HEX_REGEX, 
    							message: "must be in hex format" }
end
