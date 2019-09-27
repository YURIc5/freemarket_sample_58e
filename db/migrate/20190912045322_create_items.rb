class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,           null: false
      t.text       :description,    null: false
      t.integer    :status,         null: false
      t.boolean    :responsibility, null: false
      t.string     :location,       null: false
      t.integer    :day,            null: false
      t.integer    :price,          null: false
      t.integer    :user_id,        null: false,  foreign_key: true
      t.integer    :category_id,    null: false,  foreign_key: true
      t.integer    :purchase_id,    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
