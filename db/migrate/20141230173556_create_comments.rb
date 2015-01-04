class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :type
      t.datetime :posted_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
