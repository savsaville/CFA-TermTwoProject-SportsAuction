class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_one :auction, :dependent => :destroy

  has_attached_file :image, :storage => :cloudinary, :path => ':id/:style/:filename', styles: {large: "600x600>", medium: "300x300>", thumb: "150x150>"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def has_auction?
    auction.present?
  end
end
