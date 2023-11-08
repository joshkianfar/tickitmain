class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  # GET /items or /items.json
  def index
    @items = Item.where(state: 'active')
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: "Item was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.turbo_stream { render :new_form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated" }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item = Item.find(params[:id])

    # Start a transaction to ensure data integrity
    ActiveRecord::Base.transaction do
      @item.tickets.each do |ticket|
        user = ticket.user
        user.update!(wallet_balance: user.wallet_balance + 0.5)
      end
    end

    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully deleted" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find_by(id: params[:id])
      unless @item
        redirect_to items_path, alert: "Item not found"
      end
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:description, :sell_goal, :image)
    end
end
