class AddCompanyNameToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :company_name, :string
  end
end
