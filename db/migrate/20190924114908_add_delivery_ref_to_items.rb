class AddDeliveryRefToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :delivery, foreign_key: true
  end
end
