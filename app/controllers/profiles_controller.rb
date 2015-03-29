class ProfilesController < ApplicationController
	def new
		@profile = Profile.new
	end

	def create
		before_action :load_user
		@profile = Profile.new(profile_params)
		if params[:role].to_i == 3 and params[:passcode] == "septocaine"
			@profile.save
		end
		if @profile.save
			redirect_to dental_index_path
		else
			redirect_to new_profile_path
		end
	end

	# def update
	# 	@email = User.email
	# 	@user = user.find_by(email: @email)
	# 	if params[role].to_i == 3 and params[:passcode] == "septocaine"
	# 		user.update({:role => params[:role].to_i}, {params[:name] => :name}, {params[:phone] => :phone})
	# 	elsif params[role].to_i == 4 and params[:passcode] == "fuckrobbie"
	# 		user.update({:role => params[:role].to_i}, {params[:name] => :name}, {params[:phone] => :phone})
	# end

	def update
		if params[:role].to_i == 3 and params[:passcode] == "septocaine"
			@profile.update_attributes(profile_params)
		end
		if @profile.update_attributes(profile_params)
			redirect_to dental_index_path
		else
			redirect_to edit_profile_path
		end
		
	end

	private

	def profile_params
		params.require(:profile).permit(:name, :role, :passcode, :phone)
	end
end