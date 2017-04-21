class User < ApplicationRecord
  rolify
  has_many :comments
  has_many :items
  has_many :bids
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
