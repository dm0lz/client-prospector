
class Backend::MapsController < Backend::BaseController

  def index

  end

  def getAll
    @clients = Client.all
    render json: @clients.select(:name, :latitude, :longitude)
  end

end
