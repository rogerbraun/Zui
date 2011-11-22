# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20111120133951) do

  create_table "collaborations", :force => true do |t|
    t.integer   "user_id"
    t.integer   "project_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer   "user_id"
    t.integer   "fragment_id"
    t.string    "tags"
    t.text      "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "ancestry"
  end

  create_table "fragments", :force => true do |t|
    t.string   "image"
    t.text     "content"
    t.integer  "order"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "comments_count"
  end

  create_table "projects", :force => true do |t|
    t.string    "title"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer   "tag_id"
    t.integer   "taggable_id"
    t.string    "taggable_type"
    t.integer   "tagger_id"
    t.string    "tagger_type"
    t.string    "context"
    t.timestamp "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "translations", :force => true do |t|
    t.string   "source_lang"
    t.string   "target_lang"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "group"
    t.string    "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
