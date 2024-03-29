class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string     :name,     null: false
      t.references :item,     null: false,  foreign_key: true
      t.references :user,     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
