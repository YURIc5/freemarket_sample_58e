class AddStopToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :stop, :integer
  end
end
