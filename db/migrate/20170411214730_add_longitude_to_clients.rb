class AddLongitudeToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :longitude, :float
  end
end
