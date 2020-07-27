class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :prefecture
      t.string :zip_code
      t.string :city
      t.string :street
      t.string :building_name
      t.string :room_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
