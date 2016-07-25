class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.string :location
      t.string :help_time
      t.string :img
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
