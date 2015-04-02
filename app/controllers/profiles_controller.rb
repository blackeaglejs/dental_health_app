class ProfilesController < ApplicationController
	before_action :load_user
	before_action :load_profile, except: [:index]

	def index
		@profiles = Profile.all
	end

	def new
		@profile = Profile.new
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

	def show
		@profile = Profile.find(@profile.id)
	end

	def edit
		@role = current_user.profile.role
	end

	def update
		# @passcode = params[:passcode]
		if params[:role].to_i == 3 and params[:passcode] == "septocaine"
			@profile.update(profile_params)
		elsif params[:role].to_i != 3
			@profile.update(profile_params)
		end
		if @profile.update(profile_params)
			redirect_to dental_index_path
		else
			redirect_to edit_profile_path
		end	
	end

	private

	def load_user
		@user = current_user
	end

	def load_profile
		if @user.profile
			@profile = Profile.find(params[:id])
		end
	end

	def profile_params
		params.require(:profile).permit(:name, :role, :phone, :passcode)
	end
end