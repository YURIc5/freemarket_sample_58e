class RemovePurchaseFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :purchase_id, :integer
  end
end
