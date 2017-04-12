class Backend::ClientsController < Backend::BaseController
  before_action :find_client, only: [:show, :edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @client.update_attributes(client_params)
      redirect_to backend_client_path(@client)
    else
      redirect_to :back
    end
  end

  private
  def find_client
    client_id = params.permit(:id)[:id]
    @client = Client.find(client_id)
  end

  def client_params
    params.require(:client).permit(:id, :company_name, :gender, :name, :city, :country, :adr1, :adr2, :postal_code, :phone1, :phone2, :more_infos)
  end

end
