class ChildrenController < ApplicationController
	before_action :load_user
	before_action :load_profile
	before_action :load_child

	def index
		@children = @profile.children.all.order(:name)
		@child = @profile.children
	end

	def staff_index
	end

	def new
		@child = Child.new
	end

	def create
		@child = Child.new(child_params)
		@child.profile = @profile
		@child.save
		if @child.save
			redirect_to profile_children_path(@profile)
		else
			redirect_to new_profile_child_path
		end
	end

	def show
		@children = Child.all
	end

	private

	def load_user
		@user = current_user
	end

	def load_profile
		@profile = Profile.find(current_user.profile)
	end

	def load_child
		@child = @profile.children.find_by(params[:name])
	end

	def child_params
		params.require(:child).permit(:name, :birth_year, :birth_month, :birth_date)
	end
end