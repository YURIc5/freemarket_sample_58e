class RemoveResponsibilityFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :responsibility, :boolean
  end
end
