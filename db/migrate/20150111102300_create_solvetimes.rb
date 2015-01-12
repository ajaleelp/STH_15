class CreateSolvetimes < ActiveRecord::Migration
  def change
    create_table :solvetimes do |t|
      t.datetime :solved_at

      t.timestamps
    end
  end
end
