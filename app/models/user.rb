class User < ApplicationRecord
  rolify
  has_many :comments
  has_many :items
  has_many :bids
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



 after_create :assign_default_role

   def assign_default_role
    self.add_role(:user) if self.roles.blank?
   end

   def admin?
     has_role?(:admin)
   end
end
