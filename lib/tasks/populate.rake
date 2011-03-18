require 'seeder'

namespace :db do
  namespace :populate do
    desc "Erase and fill all tables"
    task :all => [:people,:ideas]

    desc "Erase and fill the comments table"
    task :comments => :environment do
      ActiveRecord::Migration.say_with_time "Populating comments..." do
        [Comment].each(&:delete_all)
        Seeder.seed_comments(1..10)
      end
    end

    desc "Erase and fill the ideas table"
    task :ideas => :environment do
      ActiveRecord::Migration.say_with_time "Populating ideas..." do
        [Comment,Idea].each(&:delete_all)
        Seeder.seed_ideas(50)
        Seeder.seed_comments(1..10)
      end
    end
    
    desc "Erase and fill the people table"
    task :people => :environment do
      ActiveRecord::Migration.say_with_time "Populating people..." do
        Person.where('id > 1').delete_all
        Seeder.seed_people(9)
      end
    end
  end
  task :populate => ["populate:all"]
end
