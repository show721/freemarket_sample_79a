class AddIndexToProducts < ActiveRecord::Migration[6.0]
  def change
    add_index :products, :brand 
  end
end
