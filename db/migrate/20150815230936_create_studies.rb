class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|

      belongs_to :user
      belongs_to :subject
      
      t.timestamps null: false
    end
  end
end
