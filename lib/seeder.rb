require 'faker'
require 'populator'

class Seeder
  def self.seed_comments(records)
    people = Person.select(:id).map {|o| o.id}

    Idea.all.each do |idea|
      Comment.populate records do |comment|
        comment.body       = Faker::Lorem.paragraphs(Populator.interpret_value(1..3))
        comment.created_by = Populator.interpret_value(people)
        comment.updated_by = comment.created_by
        comment.idea_id    = idea.id
        Idea.increment_counter(:comments_count,idea.id)
      end
    end
  end
  
  def self.seed_ideas(records)
    apps = App.select(:id).map {|o| o.id}
    people = Person.select(:id).map {|o| o.id}
    
    Idea.populate records do |idea|
      idea.title      = Faker::Company.bs
      idea.app_id     = Populator.interpret_value(apps)
      idea.created_by = Populator.interpret_value(people)
      idea.updated_by = idea.created_by
    end
  end
  
  def self.seed_people(records,options={})
    Person.populate records do |person|
      person.name  = Faker::Name.name
      person.email = Faker::Internet.email
    end
  end
  
  def self.seed_votes(records)
    people = Person.select(:id).map {|o| o.id}
        
    Idea.all.each do |idea|
      Vote.populate records do |vote|
        vote.person_id = people.pop
        vote.idea_id   = idea.id
        Idea.increment_counter(:votes_count,idea.id)
      end
    end
  end
end