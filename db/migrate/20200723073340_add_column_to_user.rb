class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :last_name_kanji, :string, null: false
    add_column :users, :first_name_kanji, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday, :integer, null: false
    add_column :users, :phone_number, :string, null: false
  end
end
