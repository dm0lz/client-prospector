class AddLatitudeToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :latitude, :float
  end
end
