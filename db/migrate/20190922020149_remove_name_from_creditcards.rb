class RemoveNameFromCreditcards < ActiveRecord::Migration[5.2]
  def change
    remove_column :creditcards, :name, :string
    remove_column :creditcards, :exp_month, :integer
    remove_column :creditcards, :exp_year, :integer
    remove_column :creditcards, :creditcard_number, :integer
  end
end
