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

ActiveRecord::Schema.define(:version => 20150222193733) do

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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
