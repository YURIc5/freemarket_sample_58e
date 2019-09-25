class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :brand, :string
    add_column :items, :size, :integer
  end
end
