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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_15_213103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "triples", force: :cascade do |t|
    t.string "country"
    t.integer "year_established"
    t.boolean "dirt_track"
  end

  create_table "winners", force: :cascade do |t|
    t.string "name"
    t.integer "year_won"
    t.string "jockey"
    t.string "trainer"
    t.boolean "sired_TC_winner"
    t.bigint "triple_id"
    t.index ["triple_id"], name: "index_winners_on_triple_id"
  end

  add_foreign_key "winners", "triples"
end
