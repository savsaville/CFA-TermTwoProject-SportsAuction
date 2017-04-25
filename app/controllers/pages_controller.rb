class PagesController < ApplicationController
  before_filter :authorize_admin, only: :admin_dash


  def home
    @items = Item.all
  end

  def admin_dash
    @items = Item.all
    @users = User.all
  end
end
