class ItemsController < ApplicationController
  before_action :set_store
  before_action :set_items, only: [:show, :update, :edit, :destroy]
  def index
  @items = @store.items
  end

  def show

  end

  def new
    @items = @store.items.new
    render partial: 'form'

  end

  def edit
    render partial: 'form'
  end

  def create
    @items = @store.items.new(item_params)
    if item.save
      redirect_to [@store, @item]
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@store, @item]
    else 
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to store_items_path
  end

  private
    def
      set_store
      @store = Store.find(params[:id])
    end

    def set_items
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price)
    end
    
end
