class ItemsController < ApplicationController

  # /items GET
  def index
    @items = Item.all
  end

  # /items/id/ GET
  def show
    unless @item = Item.where(id: params[:id]).first
      render text: "Page Not Found", status: 404
    end
  end

  # /items/new GET
  def new
  end

  # /items/id/edit GET
  def edit
  end

  # /items POST
  def create
    @item = Item.create(items_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  # /items/id PUT
  def update
  end

  # /items/id DELETE
  def destroy
  end

  private
  
    def items_params
      params.require(:item).permit(:name, :price, :description, :weight, :real)
    end

end
