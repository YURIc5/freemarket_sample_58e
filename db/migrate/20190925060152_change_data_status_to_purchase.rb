class ChangeDataStatusToPurchase < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :status, :string
  end
end
