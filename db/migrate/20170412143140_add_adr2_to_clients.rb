class AddAdr2ToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :adr2, :string
  end
end
