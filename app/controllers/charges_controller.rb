class ChargesController < ApplicationController
    def new
    end

    def create
      @item = Item.find(params[:item_id])
      @auction = @item.auction
      @amount = (@item.auction.current_bid * 100).to_i


      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => "Your money went to charity.. I think",
        :currency    => 'aud'
      )

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end

    def confirmation
      @item = Item.find(params[:item_id])
      @auction = @item.auction
      @comment = Comment.new
    end
end
