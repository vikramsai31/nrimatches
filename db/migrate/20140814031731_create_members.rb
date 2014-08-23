class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.integer :user_id
      t.date :dob

      t.timestamps
    end
  end
end
