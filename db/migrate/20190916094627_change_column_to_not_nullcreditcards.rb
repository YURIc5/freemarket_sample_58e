class ChangeColumnToNotNullcreditcards < ActiveRecord::Migration[5.2]
  def up
    change_column :creditcards, :creditcard_number, :int, null: true
    change_column :creditcards, :exp_month, :int, null: true
    change_column :creditcards, :exp_year, :int, null: true
    change_column :creditcards, :name, :string, null: true

  end

  def down
    change_column :creditcards, :creditcard_number, :int, null: false
    change_column :creditcards, :exp_month, :int, null: false
    change_column :creditcards, :exp_year, :int, null: false
    change_column :creditcards, :name, :string, null: false
  end
end
