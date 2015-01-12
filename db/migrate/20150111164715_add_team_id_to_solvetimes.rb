class AddTeamIdToSolvetimes < ActiveRecord::Migration
  def change
    add_column :solvetimes, :team_id, :integer
  end
end
