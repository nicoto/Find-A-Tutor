class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :attendees
      t.date :time_start
      t.date :time_end
      t.text :description

      t.integer :subject_id
      t.integer :user_id
      t.integer :location_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
