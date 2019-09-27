class RemoveUserIdFromPurchases < ActiveRecord::Migration[5.2]
  def change
    remove_reference :purchases, :user, foreign_key: true
  end
end
