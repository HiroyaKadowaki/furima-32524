class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :burden_id
      t.integer :category_id
      t.integer :province_id
      t.integer :ship_day_id
      t.integer :state_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
