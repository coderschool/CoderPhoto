class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true
      t.references :voter, polymorphic: true

      t.timestamps null: false
    end
  end
end
