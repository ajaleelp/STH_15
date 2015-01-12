class AddUserIdToSolvetimes < ActiveRecord::Migration
  def change
    add_column :solvetimes, :user_id, :integer
  end
end
