class DentalController < ApplicationController
	def index
		@user = current_user
		if @user
			@profile = @user.profile
		end
	end
end