class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :suite
      t.string :city
      t.string :state
      t.string :zip
      t.string :name
      t.string :phone
      t.string :contact

      t.timestamps null: false
    end
  end
end



