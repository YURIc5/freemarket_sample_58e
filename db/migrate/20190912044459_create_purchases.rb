class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer    :status, null: false
      t.references :user,   null: false,  foreign_key: true
      t.timestamps
    end
  end
end
