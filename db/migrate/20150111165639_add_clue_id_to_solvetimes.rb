class AddClueIdToSolvetimes < ActiveRecord::Migration
  def change
    add_column :solvetimes, :clue_id, :integer
  end
end
