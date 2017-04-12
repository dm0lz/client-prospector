class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :postal_code
      t.string :city

      t.timestamps
    end
  end
end
