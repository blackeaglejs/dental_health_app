class DentalController < ApplicationController
	def index
		@user = current_user
	end
end