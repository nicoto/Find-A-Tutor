class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :title
      t.text :description

      t.integer :subject_id
      t.integer :user_id
      t.integer :location_id


      t.timestamps null: false
    end
  end
end
