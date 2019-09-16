class ChangeColumnToNotNullAddresses < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :prefecture, :string, null: true
    change_column :addresses, :city, :string, null: true
    change_column :addresses, :block, :int, null: true
    change_column :addresses, :building, :string, null: true
  end

  def down
    change_column :addresses, :prefecture, :string, null: false
    change_column :addresses, :city, :string, null: false
    change_column :addresses, :block, :int, null: false
    change_column :addresses, :building, :string, null: false
  end
end
