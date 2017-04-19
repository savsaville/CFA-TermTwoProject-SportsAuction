class AuctionsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @auction = Auction.new(auction_params)
    @auction.item_id = params[:item_id]

    if @auction.save
      redirect_to @item, notice: "Product was successfully put to auction"
    else
      redirect_to @item, notice: "Something fucked up"
    end
  end

  def auction_params
    params.require(:auction).permit(:value, :end_at)
  end
end
