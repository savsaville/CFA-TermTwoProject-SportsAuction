class Item < ApplicationRecord
  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "150x150>"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_one :auction, :dependent => :destroy

  def has_auction?
    auction.present?
  end
end
