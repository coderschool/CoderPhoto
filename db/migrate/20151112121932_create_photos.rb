class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :username
      t.text :caption
      t.datetime :created_at
      t.integer :likes_count
      t.string :url

      t.timestamps null: false
    end
  end
end
