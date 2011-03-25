# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110325033919) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apps", ["created_by"], :name => "fk_apps_created_by"
  add_index "apps", ["name"], :name => "index_apps_on_name"
  add_index "apps", ["updated_by"], :name => "fk_apps_updated_by"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "idea_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["created_by"], :name => "fk_comments_created_by"
  add_index "comments", ["idea_id"], :name => "fk_comments_idea_id"
  add_index "comments", ["updated_by"], :name => "fk_comments_updated_by"

  create_table "ideas", :force => true do |t|
    t.string   "type"
    t.string   "title"
    t.integer  "position"
    t.integer  "comments_count"
    t.integer  "votes_count"
    t.integer  "app_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["app_id"], :name => "fk_ideas_app_id"
  add_index "ideas", ["created_by"], :name => "fk_ideas_created_by"
  add_index "ideas", ["id", "type"], :name => "index_ideas_on_id_and_type"
  add_index "ideas", ["updated_by"], :name => "fk_ideas_updated_by"

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["created_by"], :name => "fk_people_created_by"
  add_index "people", ["updated_by"], :name => "fk_people_updated_by"

  create_table "votes", :force => true do |t|
    t.integer  "idea_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["idea_id"], :name => "fk_votes_idea_id"
  add_index "votes", ["person_id"], :name => "fk_votes_person_id"

end
