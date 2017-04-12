class AddPhone1ToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :phone1, :string
  end
end
