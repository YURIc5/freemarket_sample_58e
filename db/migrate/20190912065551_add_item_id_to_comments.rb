class AddItemIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :item, null: false,  foreign_key: true
  end
end
