require 'seeder'

namespace :db do
  namespace :populate do
    desc "Erase and fill all tables"
    task :all => [:people,:ideas]

    desc "Erase and fill the comments table"
    task :comments => :environment do
      ActiveRecord::Migration.say_with_time "Populating comments..." do
        Comment.delete_all
        Seeder.seed_comments(1..10)
      end
    end

    desc "Erase and fill the ideas table"
    task :ideas => :environment do
      ActiveRecord::Migration.say_with_time "Populating ideas..." do
        count = Person.count
        
        [Comment,AbstractIdea,Vote].each(&:delete_all)
        Seeder.seed_ideas(50)
        Seeder.seed_votes(1..count)
        Seeder.seed_comments(1..count)
        
        Idea.order('votes_count desc').each_with_index do |idea,index|
          idea.insert_at(index+1)
        end
      end
    end
    
    desc "Erase and fill the people table"
    task :people => :environment do
      ActiveRecord::Migration.say_with_time "Populating people..." do
        Person.where('id > 1').delete_all
        Seeder.seed_people(9)
      end
    end
    
    desc "Erase and fill the votes table"
    task :votes => :environment do
      ActiveRecord::Migration.say_with_time "Populating votes..." do
        Vote.delete_all
        Seeder.seed_votes(1..Person.count)
      end
    end
  end
  task :populate => ["populate:all"]
end
