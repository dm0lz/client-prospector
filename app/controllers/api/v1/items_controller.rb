class Api::V1::ItemsController < Api::V1::BaseController

  def index
    @items = Item.all
    @meta = { items_count: @items.count }
  end

end
