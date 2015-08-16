class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|

      t.integer :user_id
      t.integer :subject_id
      
      t.timestamps null: false
    end
  end
end
