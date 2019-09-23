class RemoveLocationFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :location, :string
  end
end
