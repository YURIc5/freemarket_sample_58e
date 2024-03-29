class CreateItemLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_likes do |t|
      t.text       :content,  null: false
      t.references :item,     null: false,  foreign_key: true
      t.references :user,     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
