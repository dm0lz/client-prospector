class AddPhone2ToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :phone2, :string
  end
end
