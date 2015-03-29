class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :children, dependent: :destroy
	def passcode
		return "#{passcode}"
	end
end