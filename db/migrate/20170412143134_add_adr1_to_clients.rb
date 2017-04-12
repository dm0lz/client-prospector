class AddAdr1ToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :adr1, :string
  end
end
