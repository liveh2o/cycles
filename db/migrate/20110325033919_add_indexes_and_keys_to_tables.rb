class AddIndexesAndKeysToTables < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    [:apps,:comments,:ideas,:people].each do |table|
      fk table, :created_by, :people
      fk table, :updated_by, :people
    end

    fk :comments, :idea_id
    fk :ideas, :app_id
    fk :votes, :idea_id
    fk :votes, :person_id, :people

    sti :ideas
    
    add_index :apps, :name
  end

  def self.down
    [:apps,:comments,:ideas,:people].each do |table|
      drop_fk table, :created_by, :people
      drop_fk table, :updated_by, :people
    end
    
    drop_fk :comments, :idea_id
    drop_fk :ideas, :app_id
    drop_fk :votes, :idea_id
    drop_fk :votes, :person_id, :people

    drop_sti :ideas
    
    remove_index :apps, :name
  end
end
