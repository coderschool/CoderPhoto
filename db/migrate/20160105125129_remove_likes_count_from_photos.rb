class RemoveLikesCountFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :likes_count, :integer
  end
end
