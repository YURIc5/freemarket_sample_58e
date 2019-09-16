class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :postcode, :int, null: true
  end

  def down
    change_column :addresses, :postcode, :int, null: false
  end
end
