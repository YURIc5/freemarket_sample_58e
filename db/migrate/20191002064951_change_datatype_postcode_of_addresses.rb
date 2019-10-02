class ChangeDatatypePostcodeOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :postcode, :string
    change_column :addresses, :block, :string
  end
end
