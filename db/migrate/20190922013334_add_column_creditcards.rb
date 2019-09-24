class AddColumnCreditcards < ActiveRecord::Migration[5.2]
  def change
    add_reference :creditcards, :user, foreign_key: true
    add_column :creditcards, :customer_id, :string
    add_column :creditcards, :card_token, :string
  end
end
