class User < ActiveRecord::Base
  enum role: {user: 0, patient: 1, p_parent: 2, staff: 3, admin: 4}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
end
