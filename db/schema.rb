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

ActiveRecord::Schema.define(:version => 20101209164513) do

  create_table "loto_facil_games", :force => true do |t|
    t.string   "n1"
    t.string   "n2"
    t.string   "n3"
    t.string   "n4"
    t.string   "n5"
    t.string   "n6"
    t.string   "n7"
    t.string   "n8"
    t.string   "n9"
    t.string   "n10"
    t.string   "n11"
    t.string   "n12"
    t.string   "n13"
    t.string   "n14"
    t.string   "n15"
    t.text     "hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
