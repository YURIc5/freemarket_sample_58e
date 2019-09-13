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
      t.references :user,           null: false,  foreign_key: true
      t.references :category,       null: false,  foreign_key: true
      t.references :purchase,       null: false,  foreign_key: true
      t.timestamps
    end
  end
end
