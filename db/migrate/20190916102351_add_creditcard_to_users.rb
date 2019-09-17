class AddCreditcardToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :creditcard, foreign_key: true
  end
end
