class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :member_id
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
