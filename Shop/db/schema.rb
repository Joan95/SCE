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

ActiveRecord::Schema.define(version: 20180523131657) do

  create_table "assemblies", id: false, force: :cascade do |t|
    t.integer "piece_id"
    t.integer "toy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_assemblies_on_piece_id"
    t.index ["toy_id"], name: "index_assemblies_on_toy_id"
  end

  create_table "packs", force: :cascade do |t|
    t.float "price"
    t.string "image"
    t.string "description"
    t.string "ageRange"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packs_toys", force: :cascade do |t|
    t.integer "toy_id"
    t.integer "pack_id"
    t.index ["pack_id"], name: "index_packs_toys_on_pack_id"
    t.index ["toy_id"], name: "index_packs_toys_on_toy_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "description"
    t.float "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toys", force: :cascade do |t|
    t.string "name"
    t.integer "numberPieces"
    t.string "description"
    t.float "price"
    t.string "image"
    t.string "ageRange"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
