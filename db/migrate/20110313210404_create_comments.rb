class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.integer :idea_id

      t.identities
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
