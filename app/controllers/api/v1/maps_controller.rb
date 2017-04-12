
class Api::V1::MapsController < ActionController::Base

  protect_from_forgery with: :null_session
  include ErrorsConcern
  layout 'api.v1.json.jbuilder'

  def getAll
    @clients = Client.all
    @clients.select(:name, :latitude, :longitude)
  end

end
