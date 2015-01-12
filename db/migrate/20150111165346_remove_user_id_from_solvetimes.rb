class RemoveUserIdFromSolvetimes < ActiveRecord::Migration
  def change
    remove_column :solvetimes, :user_id, :string
  end
end
