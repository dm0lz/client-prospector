class Backend::ItemsController < Backend::BaseController
  #before_action :authenticate_backend_admin!
  before_action :current_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to backend_item_path(@item)
    else
      @errors = @item.errors
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to backend_items_path
    else
      @errors = @item.errors
      render "edit"
    end
  end

  def show
  end

  def destroy
    #binding.pry
    if @item.destroy
      redirect_to backend_items_path
    else

    end
  end


  private
  def current_item
    @item = Item.find params.require(:id)
  end

  def item_params
    params.require(:item).permit(:name, :price)
  end

end
