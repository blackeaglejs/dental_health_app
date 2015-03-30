class Profile < ActiveRecord::Base
	enum role: {user: 0, patient: 1, p_parent: 2, staff: 3, admin: 4}
	belongs_to :user
	has_many :children, dependent: :destroy
end