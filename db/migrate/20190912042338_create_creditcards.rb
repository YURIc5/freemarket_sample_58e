class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|
      t.integer :creditcard_number, null: false
      t.integer :exp_month,         null: false
      t.integer :exp_year,          null: false
      t.string  :name,              null: false
      t.timestamps
    end
  end
end
