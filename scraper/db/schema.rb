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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160426073500) do

  create_table "wiki_countries", force: :cascade do |t|
    t.string   "alpha_2"
    t.string   "alpha_3"
    t.integer  "numeric"
    t.string   "iso_name"
    t.integer  "year_added"
    t.string   "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wiki_country_subdivisions", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "alpha"
    t.string   "native_name"
    t.string   "iso_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "native_transcription"
  end

  add_index "wiki_country_subdivisions", ["country_id"], name: "index_wiki_country_subdivisions_on_country_id"

end
