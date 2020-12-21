class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string :zip
      t.string :city
      t.string :address
      t.string :phone_number
      t.integer :province_id
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
