class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.string :clue_img
      t.string :map_image
      t.string :pass

      t.timestamps
    end
  end
end
