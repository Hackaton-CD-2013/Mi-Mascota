class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pets

  def full_name
  	name_parts = []
  	name_parts << first_name unless first_name.blank?
	name_parts << last_name  unless last_name.blank?

	name_parts.join ' '
  end
end
