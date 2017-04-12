class AddMoreInfosToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :more_infos, :text
  end
end
