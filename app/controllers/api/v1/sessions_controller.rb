class Api::V1::SessionsController < ActionController::Base
  
  protect_from_forgery with: :null_session
  include ErrorsConcern
  layout 'api.v1.json.jbuilder'

  def create
    @user = User.find_by(email: user_params["email"])
    if @user && @user.valid_password?(user_params["password"])
      @jwt = JsonWebToken.encode(user_id: @user.id)
    else
      render_error(code: 404, message: "Invalid Credentials", error_fields: {}) && return
    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end

end
