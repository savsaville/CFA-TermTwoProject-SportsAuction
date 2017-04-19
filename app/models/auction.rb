class Auction < ApplicationRecord
  belongs_to :item, optional: true
  has_many :bids, :dependent => :destroy

  def top_bid
    bids.order(value: :desc).first
  end

  def current_bid
    top_bid.nil? ? value: top_bid.value
  end

  def ended?
  end_at < Time.now
  end
end
