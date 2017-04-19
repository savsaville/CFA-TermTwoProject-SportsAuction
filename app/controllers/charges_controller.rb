class ChargesController < ApplicationController
    def new
    end

    def create
    @auction = Auction.find(params[:id])
    @value = @item.auction.current_bid
    # # Amount in cents
    # @amount = (@booking.room.price * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @value,
      :description => "Booking id: #{@booking.id}",
      :currency    => 'aud'
    )


    @transaction = Transaction.create(amount: @amount, user_id: current_user.id, booking_id: @booking.id)

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path(r: @booking.room.id)
    end

end
