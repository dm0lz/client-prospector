class Backend::SessionsController < Devise::SessionsController
  # layout "admin"

  def create
    super
  end

  def new
    #binding.pry
    #self.resource = resource_class.new(sign_in_params)
    #store_location_for(resource, params[:redirect_to])
    super
  end

  def after_sign_in_path_for(resource)
    #sign_in_url = new_user_session_url
    #if request.referer == sign_in_url
    #  super
    #else
    #  stored_location_for(resource) || request.referer || root_path
    #end
    backend_clients_path
  end

end
