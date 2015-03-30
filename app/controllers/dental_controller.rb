class DentalController < ApplicationController
	def index
		@user = current_user
		@profile = @user.profile
	end
end