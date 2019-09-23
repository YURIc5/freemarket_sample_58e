class RemoveUserIdFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pictures, :user, foreign_key: true
  end
end
