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

ActiveRecord::Schema.define(version: 20131111225240) do

  create_table "course_offerings", force: true do |t|
    t.integer  "course_id"
    t.integer  "year_id"
    t.string   "grade_level_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "sisid"
    t.integer  "department_id"
    t.integer  "term_id"
    t.boolean  "graded"
    t.boolean  "archived"
    t.boolean  "list_in_catalog"
    t.float    "credits"
    t.boolean  "us_course"
    t.boolean  "ms_course"
    t.boolean  "ls_course"
    t.string   "rotation"
    t.integer  "previous_course_id"
    t.integer  "next_course_id"
    t.string   "prereq_ids"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_levels", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "order"
    t.boolean  "ls_grade_level"
    t.boolean  "ms_grade_level"
    t.boolean  "us_grade_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", force: true do |t|
    t.boolean  "t1"
    t.boolean  "t2"
    t.boolean  "t3"
    t.boolean  "t4"
    t.boolean  "t5"
    t.boolean  "t6"
    t.string   "name"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
