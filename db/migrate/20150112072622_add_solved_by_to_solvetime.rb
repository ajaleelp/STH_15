class AddSolvedByToSolvetime < ActiveRecord::Migration
  def change
    add_column :solvetimes, :solved_by, :float
  end
end
