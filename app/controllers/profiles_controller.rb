class ProfilesController < ApplicationController
	before_action :load_user
	def new
		@profile = Profile.new
		binding.pry
	end

	def create
		@passcode = "none"
		@profile = Profile.new(profile_params)
		@profile.user = @user
		@passcode = params[:passcode]
		if params[:role].to_i == 3 and params[:passcode] == "septocaine"
			@profile.save
		elsif params[:role].to_i != 3
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

	def edit
		@passcode = params[:passcode]
		if params[:role].to_i == 3 and params[:passcode] == "septocaine"
			@profile.update_attributes(profile_params)
		elsif params[:role].to_i != 3
			@profile.save
		end
		if @profile.update_attributes(profile_params)
			redirect_to dental_index_path
		else
			redirect_to edit_profile_path
		end
		
	end

	private

	def load_user
		@user = current_user
	end

	def profile_params
		params.require(:profile).permit(:name, :role, :phone)
	end
end