class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :type
      t.string :title
      t.integer :position
      t.integer :comments_count
      t.integer :votes_count
      t.integer :app_id

      t.identities
      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
