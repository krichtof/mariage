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

ActiveRecord::Schema.define(:version => 20150322215428) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.string   "arriving"
    t.string   "departing"
    t.string   "arriving_day"
    t.string   "departing_day"
    t.string   "nb_castle_nights"
    t.boolean  "friday_dinner"
    t.boolean  "saturday_lunch"
    t.boolean  "sunday_lunch"
    t.integer  "nb_people"
    t.integer  "nb_children"
    t.boolean  "nogo"
    t.integer  "nb_nights"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "remark"
    t.string   "token"
    t.boolean  "sunday_dinner"
  end

  add_index "guests", ["email"], :name => "index_guests_on_email"
  add_index "guests", ["mobile"], :name => "index_guests_on_mobile"
  add_index "guests", ["name"], :name => "index_guests_on_name"
  add_index "guests", ["sunday_dinner"], :name => "index_guests_on_sunday_dinner"
  add_index "guests", ["token"], :name => "index_guests_on_token"

end
