class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
  end

  def table
    @items = Item.all
    @search = Item.ransack(params[:q])
    @items = @search.result(distinct: true)
  end
  # GET /items/1
  # GET /items/1.json
  def show
    @comment = Comment.new
    @comments = @item.comments
  end

  # GET /items/new
  def new
    @item = Item.new
    authorize @item
  end

  # GET /items/1/edit
  def edit
    authorize @item
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    authorize @item
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    authorize @item
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    authorize @item
    @item.auction.destroy if @item.has_auction?
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def transfer
    @item = Item.find(params[:id])
    if @item.auction.ended?
      @item.update_attribute :user_id, @item.auction.top_bid.user_id
      redirect_to item_confirmation_path(@item), notice: "successfully transfered the product"
    else
      redirect_to item_path, notice: "the auction has not ended yet"
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description, :starting_price, :end_time, :image, :sport, :charity, :sponsor)
    end
end
