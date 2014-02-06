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

ActiveRecord::Schema.define(version: 20140203232951) do

  create_table "absence_codes", force: true do |t|
    t.string "code"
    t.string "description"
  end

  create_table "absences", force: true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.integer  "absence_code_id"
    t.boolean  "excused"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "absences", ["absence_code_id"], name: "absence_code_id", using: :btree
  add_index "absences", ["date"], name: "date", using: :btree
  add_index "absences", ["section_id"], name: "section_id", using: :btree
  add_index "absences", ["student_id"], name: "student_id", using: :btree

  create_table "access_points", force: true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.string   "mac_addr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accommodations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "group_name"
    t.integer  "order"
  end

  create_table "accommodations_students", id: false, force: true do |t|
    t.integer  "accommodation_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", force: true do |t|
    t.string    "address1",   limit: 60
    t.string    "address",    limit: 60
    t.string    "city",       limit: 60
    t.string    "state",      limit: 2
    t.string    "zip",        limit: 12
    t.timestamp "created_on",            null: false
    t.timestamp "updated_on",            null: false
  end

  create_table "admins", force: true do |t|
    t.string   "client_id"
    t.string   "client_pw"
    t.string   "client_school"
    t.date     "client_expdate"
    t.string   "client_fullname"
    t.text     "webinfo"
    t.date     "webinfodate"
    t.datetime "LastUpdate"
    t.string   "user_activation_key"
    t.string   "user_email"
  end

  create_table "advisors", force: true do |t|
    t.integer "student_id", limit: 3
    t.integer "teacher_id", limit: 3
    t.integer "year_id"
  end

  add_index "advisors", ["student_id"], name: "student_id_2", using: :btree
  add_index "advisors", ["student_id"], name: "teacher_id", using: :btree
  add_index "advisors", ["teacher_id"], name: "student_id", using: :btree
  add_index "advisors", ["teacher_id"], name: "teacher_id_2", using: :btree
  add_index "advisors", ["year_id"], name: "year_id", using: :btree

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "individual_id"
    t.integer  "section_id"
    t.integer  "year_id"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicant_datas", force: true do |t|
    t.integer "applicant_id"
    t.integer "year_id"
    t.integer "school_id"
    t.string  "notes"
    t.boolean "application_form_in"
    t.boolean "application_fee_in"
    t.boolean "parent_questionaire_in"
    t.float   "parent_questionaire_rating"
    t.boolean "student_questionaire_in"
    t.float   "student_questionaire_rating"
    t.boolean "personal_reference_in"
    t.float   "personal_reference_rating"
    t.boolean "record_request_form_in"
    t.boolean "grades_current_year_in"
    t.float   "grades_rating"
    t.boolean "grades_two_years_in"
    t.integer "isee_test_results_math"
    t.integer "isee_test_results_english"
    t.float   "isee_rating"
    t.float   "teacher_evals_rating"
    t.boolean "test_results_in"
    t.date    "visit_on"
    t.integer "host_id"
    t.date    "parent_interview_on"
    t.float   "parent_interview_rating"
    t.float   "student_interview_rating"
    t.integer "student_interviewer_id"
    t.integer "parent_interviewer_id"
    t.date    "sent_initial_receipt_letter_on"
    t.date    "sent_application_complete_letter_on"
    t.date    "sent_decision_letter_on"
    t.integer "reason_for_attending_elsewhere_id"
    t.integer "how_did_you_hear_about_eps_id"
  end

  create_table "assessment_responses", force: true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.string   "assessment"
    t.text     "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessments", force: true do |t|
    t.integer  "unit_plan_id"
    t.string   "name"
    t.string   "type"
    t.boolean  "written"
    t.boolean  "oral"
    t.boolean  "visual"
    t.boolean  "technology"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assignment_file_name"
    t.string   "assignment_content_type"
    t.integer  "assignment_file_size"
    t.string   "rubric_file_name"
    t.string   "rubric_content_type"
    t.integer  "rubric_file_size"
    t.string   "exceeds_expectations_file_name"
    t.string   "exceeds_expectations_content_type"
    t.integer  "exceeds_expectations_file_size"
    t.string   "meets_expectations_file_name"
    t.string   "meets_expectations_content_type"
    t.integer  "meets_expectations_file_size"
    t.string   "dnme_file_name"
    t.string   "dnme_content_type"
    t.integer  "dnme_file_size"
  end

  create_table "assessments_learning_targets", id: false, force: true do |t|
    t.integer "assessment_id"
    t.integer "learning_target_id"
  end

  create_table "assigned_surveys", force: true do |t|
    t.integer  "individual_id"
    t.integer  "section_id"
    t.integer  "survey_id"
    t.boolean  "visible"
    t.boolean  "enabled"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignment_audits", force: true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.integer  "missing"
    t.integer  "incomplete"
    t.integer  "absent"
    t.integer  "total"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignment_groups", force: true do |t|
    t.integer  "canvas_id"
    t.string   "name"
    t.text     "rules"
    t.integer  "position"
    t.integer  "canvas_course_id"
    t.string   "assignment_weighting_scheme"
    t.float    "group_weight"
    t.string   "workflow_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.integer  "canvas_id"
    t.string   "name"
    t.text     "description"
    t.datetime "due_at"
    t.datetime "lock_at"
    t.float    "points_possible"
    t.integer  "needs_grading_count"
    t.float    "min_score"
    t.float    "max_score"
    t.float    "mastery_score"
    t.string   "grading_type"
    t.string   "submission_types"
    t.string   "workflow_state"
    t.integer  "canvas_course_id"
    t.integer  "assignment_group_id"
    t.integer  "grading_scheme_id"
    t.integer  "grading_standard_id"
    t.string   "html_url"
    t.string   "grade_students_individually"
    t.boolean  "turnitin_enabled"
    t.boolean  "muted"
    t.text     "rubric_json"
    t.integer  "group_id"
    t.integer  "group_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "median"
    t.float    "first_quartile"
    t.float    "third_quartile"
    t.float    "tardiness_on_time"
    t.float    "tardiness_missing"
    t.float    "tardiness_late"
  end

  create_table "bdrb_job_queues", force: true do |t|
    t.binary   "args"
    t.string   "worker_name"
    t.string   "worker_method"
    t.string   "job_key"
    t.integer  "taken"
    t.integer  "finished"
    t.integer  "timeout"
    t.integer  "priority"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.string   "tag"
    t.string   "submitter_info"
    t.string   "runner_info"
    t.string   "worker_key"
    t.datetime "scheduled_at"
  end

  create_table "bins", force: true do |t|
    t.integer "period_id"
    t.time    "starttime"
    t.time    "endtime"
    t.string  "day"
  end

  add_index "bins", ["period_id"], name: "period_id", using: :btree

  create_table "books", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canvas_assignments", force: true do |t|
    t.integer  "canvas_assignment_id"
    t.integer  "canvas_course_id"
    t.integer  "canvas_assignment_group_id"
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.integer  "total_points"
    t.string   "assignment_type"
    t.integer  "term_id"
    t.integer  "year_id"
    t.datetime "due_date"
    t.string   "assignment_analytics"
    t.boolean  "rubric_graded"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canvas_courses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canvas_submissions", force: true do |t|
    t.integer  "canvas_assignment_id"
    t.integer  "student_id"
    t.float    "points_earned"
    t.datetime "submission_time"
    t.float    "submission_delta"
    t.boolean  "guided_study_hall"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_boxes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklists", force: true do |t|
    t.integer   "student_id",            limit: 3, default: 0,  null: false
    t.integer   "section_id",            limit: 3, default: 0,  null: false
    t.integer   "term_id",               limit: 2, default: 1
    t.integer   "year_id",               limit: 2, default: 0,  null: false
    t.integer   "grade_id",                        default: 15
    t.integer   "on_time",               limit: 2, default: 3
    t.integer   "with_materials",        limit: 2, default: 3
    t.integer   "homework",              limit: 2, default: 3
    t.integer   "ready_to_learn",        limit: 2, default: 3
    t.integer   "discussion_knowledge",  limit: 2, default: 3
    t.integer   "discussion_thinking",   limit: 2, default: 3
    t.integer   "written_knowledge",     limit: 2, default: 3
    t.integer   "written_thinking",      limit: 2, default: 3
    t.integer   "expands_ideas",         limit: 2, default: 3
    t.integer   "research",              limit: 2, default: 3
    t.integer   "questions_clarity",     limit: 2, default: 3
    t.integer   "questions_expands",     limit: 2, default: 3
    t.integer   "mistakes_learning",     limit: 2, default: 3
    t.integer   "creates_learning_envi", limit: 2, default: 3
    t.integer   "respects_eps",          limit: 2, default: 3
    t.integer   "exam_written",          limit: 2, default: 3
    t.integer   "exam_oral",             limit: 2, default: 3
    t.integer   "exam_creative",         limit: 2, default: 3
    t.integer   "discipline_think",      limit: 2, default: 3
    t.string    "custom1"
    t.integer   "custom1_grade",         limit: 2, default: 6
    t.string    "custom2"
    t.integer   "custom2_grade",         limit: 2, default: 6
    t.text      "body"
    t.timestamp "created_on",                                   null: false
    t.timestamp "updated_on",                                   null: false
  end

  add_index "checklists", ["section_id"], name: "section_id", using: :btree
  add_index "checklists", ["student_id"], name: "student_id", using: :btree
  add_index "checklists", ["term_id"], name: "term_id", using: :btree
  add_index "checklists", ["year_id"], name: "year_id", using: :btree

  create_table "classnotes", force: true do |t|
    t.string   "client_id"
    t.string   "cc"
    t.string   "schoolid"
    t.text     "notes"
    t.datetime "lastupdate"
  end

  create_table "comment_summaries", force: true do |t|
    t.integer "student_id"
    t.integer "term_id"
    t.integer "year_id"
    t.integer "author_id"
    t.float   "gpa"
    t.float   "old_gpa"
    t.integer "absences"
    t.integer "tardies"
    t.text    "body"
    t.text    "unofficial_notes"
    t.date    "created_on"
    t.date    "updated_on"
    t.integer "updater_id"
    t.integer "lock_version"
    t.text    "student_response"
  end

  add_index "comment_summaries", ["author_id"], name: "author_id", using: :btree
  add_index "comment_summaries", ["student_id"], name: "student_id", using: :btree
  add_index "comment_summaries", ["term_id"], name: "term_id", using: :btree
  add_index "comment_summaries", ["year_id"], name: "year_id", using: :btree

  create_table "commentlist", force: true do |t|
    t.string   "schoolid"
    t.integer  "commentnum"
    t.text     "commenttxt"
    t.datetime "LastUpdate"
  end

  create_table "companies", force: true do |t|
    t.string "name", limit: 120, default: "", null: false
  end

  create_table "config", force: true do |t|
    t.string "name"
    t.text   "value"
  end

  create_table "consumer_tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "type",       limit: 30
    t.string   "token",      limit: 1024
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consumer_tokens", ["token"], name: "index_consumer_tokens_on_token", length: {"token"=>767}, using: :btree

  create_table "contacts", force: true do |t|
    t.integer "individual_id"
    t.integer "group_id"
    t.string  "email",           limit: 120
    t.integer "phone",           limit: 8
    t.integer "extention"
    t.integer "contacttype_id"
    t.integer "okdirectory",                 default: 1
    t.integer "oksendmail",                  default: 1, null: false
    t.integer "emergenciesonly",             default: 0
    t.integer "preferred",                   default: 0
    t.text    "type"
    t.boolean "getsgrades"
  end

  create_table "contacttypes", force: true do |t|
    t.string "contacttype", limit: 60
  end

  create_table "course_offerings", force: true do |t|
    t.integer  "course_id"
    t.integer  "year_id"
    t.string   "grade_level_ids"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
    t.string   "info"
    t.string   "gradelevels"
  end

  create_table "courseinfo", force: true do |t|
    t.string   "cc"
    t.string   "schoolid"
    t.string   "facultyname"
    t.string   "facultycode"
    t.string   "period"
    t.string   "email"
    t.string   "phone"
    t.string   "misc"
    t.string   "coursename"
    t.text     "assignlist"
    t.text     "assignvals"
    t.text     "assigndates"
    t.text     "ealr"
    t.string   "modified"
    t.string   "type"
    t.datetime "LastUpdate"
  end

  create_table "courses", force: true do |t|
    t.string  "name"
    t.string  "sisid",         limit: 45
    t.string  "description"
    t.integer "division_id",   limit: 1
    t.integer "term_id",       limit: 1
    t.text    "cat_entry",     limit: 2147483647
    t.boolean "needalt"
    t.integer "graded"
    t.string  "short_name"
    t.boolean "catalog"
    t.boolean "offering"
    t.string  "subdiscipline"
    t.boolean "required"
    t.string  "gradelevels"
    t.string  "requirements"
  end

  add_index "courses", ["division_id"], name: "division_id", using: :btree
  add_index "courses", ["division_id"], name: "division_id_2", using: :btree
  add_index "courses", ["graded"], name: "graded", using: :btree
  add_index "courses", ["sisid"], name: "sisid", using: :btree
  add_index "courses", ["term_id"], name: "term_id", using: :btree
  add_index "courses", ["term_id"], name: "term_id_2", using: :btree

  create_table "current_ideas", force: true do |t|
    t.integer  "idea_id"
    t.integer  "year_id"
    t.boolean  "should_persist"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_logs", force: true do |t|
    t.date     "date"
    t.integer  "section_id"
    t.integer  "author_id"
    t.text     "warmup"
    t.text     "agenda"
    t.text     "what_worked"
    t.text     "what_didnt_work"
    t.text     "ideas"
    t.integer  "smoothness"
    t.integer  "learning_happened"
    t.integer  "students_engaged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.integer  "individual_id"
    t.string   "mac_addr"
    t.string   "ip_addr"
    t.integer  "access_point_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", force: true do |t|
    t.string "name"
    t.string "short_name"
  end

  create_table "drop_downs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.integer "student_id", limit: 3
    t.integer "section_id", limit: 3
    t.integer "year_id",    limit: 1
  end

  add_index "enrollments", ["section_id"], name: "section_id", using: :btree
  add_index "enrollments", ["student_id"], name: "student_id", using: :btree
  add_index "enrollments", ["year_id"], name: "year_id", using: :btree

  create_table "eventlog", force: true do |t|
    t.string   "eventid"
    t.string   "schoolid"
    t.string   "user"
    t.string   "ipaddr"
    t.datetime "LastUpdate"
  end

  create_table "expectations", force: true do |t|
    t.string "grade", limit: 50
  end

  create_table "facebook_infos", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "individual_id"
    t.integer  "facebook_id",            limit: 8
    t.string   "session_key"
    t.string   "email1"
    t.string   "email2"
    t.string   "street_address"
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.string   "university1"
    t.string   "university2"
    t.string   "university3"
    t.string   "university4"
    t.string   "employer1"
    t.string   "employer2"
    t.string   "employer3"
    t.string   "area_of_study1"
    t.string   "area_of_study2"
    t.string   "area_of_study3"
    t.string   "profession"
    t.integer  "street_address_privacy"
    t.integer  "email1_privacy"
    t.integer  "email2_privacy"
    t.integer  "city_privacy"
    t.integer  "phone1_privacy"
    t.integer  "phone2_privacy"
    t.integer  "phone3_privacy"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "phone1_type"
    t.string   "phone2_type"
    t.string   "phone3_type"
    t.string   "email1_type"
    t.string   "email2_type"
    t.boolean  "street_address_au"
    t.boolean  "city_au"
    t.boolean  "state_au"
    t.boolean  "country_au"
    t.boolean  "university1_au"
    t.boolean  "university2_au"
    t.boolean  "university3_au"
    t.boolean  "university4_au"
    t.boolean  "area_of_study1_au"
    t.boolean  "area_of_study2_au"
    t.boolean  "area_of_study3_au"
    t.boolean  "employer1_au"
    t.boolean  "employer2_au"
    t.boolean  "employer3_au"
    t.boolean  "profession_au"
    t.boolean  "phone1_au"
    t.boolean  "phone2_au"
    t.boolean  "phone3_au"
    t.boolean  "email1_au"
    t.boolean  "email2_au"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_templates", force: true do |t|
    t.string "template_name", null: false
    t.string "content_hash",  null: false
    t.string "bundle_id"
  end

  add_index "facebook_templates", ["template_name"], name: "index_facebook_templates_on_template_name", unique: true, using: :btree

  create_table "final_grades", force: true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.integer  "year_id"
    t.integer  "term_one_percent"
    t.integer  "term_one_grade"
    t.integer  "term_two_percent"
    t.integer  "term_two_grade"
    t.integer  "term_three_percent"
    t.integer  "term_three_grade"
    t.integer  "exam_percent"
    t.integer  "exam_grade"
    t.integer  "final_grade"
    t.integer  "updated_by"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "glos", force: true do |t|
    t.integer  "number"
    t.text     "name"
    t.text     "description"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gmscores", force: true do |t|
    t.integer  "sid"
    t.string   "cc"
    t.string   "schoolid"
    t.text     "scores"
    t.float    "percent"
    t.string   "grade"
    t.string   "comments"
    t.datetime "LastUpdate"
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

  create_table "grade_overrides", force: true do |t|
    t.integer  "student_id"
    t.integer  "year_id"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.string "grade", limit: 2
    t.float  "gpa"
  end

  create_table "gri", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "individual_id"
    t.integer "relationship_id"
    t.integer "year_id"
    t.string  "type",            limit: 30
  end

  add_index "gri", ["group_id", "relationship_id", "year_id", "individual_id"], name: "group_id_2", unique: true, using: :btree
  add_index "gri", ["group_id", "relationship_id", "year_id", "individual_id"], name: "group_id_3", unique: true, using: :btree
  add_index "gri", ["group_id", "relationship_id", "year_id", "type", "individual_id"], name: "group_id", unique: true, using: :btree

  create_table "groups", force: true do |t|
    t.integer   "nettyid"
    t.string    "name",                           limit: 60
    t.integer   "address_id",                                default: 0,    null: false
    t.string    "website",                        limit: 60
    t.integer   "status_id",                                 default: 0,    null: false
    t.string    "type",                           limit: 20, default: "",   null: false
    t.integer   "oksendmail",                                default: 1,    null: false
    t.text      "notes"
    t.text      "nettynotes"
    t.integer   "startgrade_id"
    t.integer   "endgrade_id"
    t.string    "specialty",                      limit: 60
    t.timestamp "created_on",                                               null: false
    t.timestamp "updated_on",                                               null: false
    t.string    "sisid",                          limit: 60
    t.integer   "okdirectory",                               default: 1,    null: false
    t.integer   "deleted",                                   default: 0,    null: false
    t.integer   "test"
    t.boolean   "okmap",                                     default: true
    t.string    "P_phone_H"
    t.string    "P_email_preferred"
    t.boolean   "DoNotPublish_P_phone_H"
    t.boolean   "DoNotPublish_P_email_preferred"
    t.string    "Pa_first"
    t.string    "Pa_last"
    t.string    "Pa_phone_W"
    t.string    "Pa_phone_cell"
    t.string    "Pa_email"
    t.boolean   "DoNotPublish_Pa_phone_W"
    t.boolean   "DoNotPublish_Pa_phone_cell"
    t.boolean   "DoNotPublish_Pa_email"
    t.string    "Pb_first"
    t.string    "Pb_last"
    t.string    "Pb_phone_W"
    t.string    "Pb_phone_cell"
    t.string    "Pb_email"
    t.boolean   "DoNotPublish_Pb_phone_W"
    t.boolean   "DoNotPublish_Pb_phone_cell"
    t.boolean   "DoNotPublish_Pb_email"
    t.boolean   "DoNotPublish_P1address"
    t.string    "P_street"
    t.string    "P_city"
    t.string    "P_state"
    t.string    "P_zip"
    t.boolean   "DoNotPublish_car_pool_map"
    t.string    "pa_canvas_api_key"
    t.string    "pb_canvas_api_key"
    t.string    "lat"
    t.string    "long"
    t.string    "home_lang"
    t.boolean   "forms_due"
    t.boolean   "account_due"
    t.boolean   "pledge_due"
    t.boolean   "lunch_acct_due"
    t.boolean   "emergencies_only"
    t.boolean   "no_sms_a"
    t.boolean   "no_sms_b"
    t.boolean   "do_not_call_pa"
    t.boolean   "do_not_call_pb"
  end

  add_index "groups", ["address_id"], name: "address_id", using: :btree

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individuals", force: true do |t|
    t.integer   "nettyid"
    t.string    "sisid",                   limit: 55
    t.string    "sisid_fac",               limit: 18
    t.string    "login",                   limit: 60
    t.string    "lastname",                limit: 60, default: ""
    t.string    "firstname",               limit: 60, default: ""
    t.string    "middlename",              limit: 60
    t.string    "prefix",                  limit: 10
    t.string    "suffix",                  limit: 10
    t.string    "gender",                  limit: 2
    t.date      "birthday"
    t.integer   "locker"
    t.integer   "combo"
    t.integer   "gradyear"
    t.string    "degree",                  limit: 8
    t.string    "salutation",              limit: 60
    t.string    "company_id",              limit: 60
    t.string    "title",                   limit: 60
    t.string    "website",                 limit: 60
    t.text      "notes"
    t.text      "nettynotes"
    t.integer   "source_id"
    t.string    "oksendmail",              limit: 2,  default: "1", null: false
    t.integer   "address_id",                         default: 0,   null: false
    t.integer   "status_id",                          default: 0,   null: false
    t.string    "type",                    limit: 20, default: "",  null: false
    t.integer   "updater_id"
    t.timestamp "created_on",                                       null: false
    t.timestamp "updated_on",                                       null: false
    t.integer   "deleted",                            default: 0,   null: false
    t.string    "nickname"
    t.string    "ethnicity"
    t.string    "citizenship"
    t.integer   "living_situation_id"
    t.integer   "lunch_id"
    t.string    "mac_addr"
    t.string    "ip_addr"
    t.string    "user_activation_key"
    t.string    "client_pw"
    t.text      "notes_to_admin"
    t.text      "notes_to_instructor"
    t.boolean   "internet_off"
    t.integer   "facebook_id"
    t.boolean   "facebook_connected"
    t.integer   "rediker_id"
    t.string    "idfamily1"
    t.string    "idfamily2"
    t.string    "idfamily3"
    t.string    "idfamily4"
    t.integer   "default_vlan"
    t.string    "canvas_api_key"
    t.integer   "canvas_id",               limit: 8
    t.integer   "year_of_entry_id"
    t.boolean   "leaving"
    t.boolean   "rainier_scholar"
    t.string    "house"
    t.string    "home_phone"
    t.string    "cell_phone"
    t.string    "emergency_contact_cell"
    t.string    "emergency_contact_email"
    t.string    "department"
    t.string    "clubs"
    t.string    "play"
    t.string    "sports"
    t.string    "bus_route"
  end

  add_index "individuals", ["address_id"], name: "address_id", using: :btree
  add_index "individuals", ["gradyear"], name: "gradyear", using: :btree
  add_index "individuals", ["login"], name: "login", using: :btree
  add_index "individuals", ["status_id"], name: "status_id", using: :btree

  create_table "individuals_roles", id: false, force: true do |t|
    t.integer  "individual_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individuals_sources", id: false, force: true do |t|
    t.integer "individual_id", default: 0, null: false
    t.integer "source_id",     default: 0, null: false
  end

  create_table "individuals_strengths", id: false, force: true do |t|
    t.integer  "individual_id"
    t.integer  "strength_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.integer  "prospective_id"
    t.integer  "current_school_id"
    t.integer  "schgrade_id"
    t.integer  "applying_for_year_id"
    t.integer  "parent1_id"
    t.integer  "parent2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries_sources", id: false, force: true do |t|
    t.integer "inquiry_id"
    t.integer "source_id"
  end

  create_table "integration_events", force: true do |t|
    t.string   "name"
    t.integer  "idea_pathway_id"
    t.integer  "skill_pathway_id"
    t.string   "stand_alone_activities"
    t.string   "joint_activities"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integration_supports", force: true do |t|
    t.integer  "teacher_id"
    t.boolean  "like"
    t.text     "support"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integrations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "collaboration_id"
    t.integer  "unit_plan_id"
    t.string   "collaboration_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "integration_event_id"
    t.integer  "idea_id"
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.integer  "year_id"
    t.date     "date"
  end

  create_table "learning_targets", force: true do |t|
    t.integer  "glo_id"
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: true do |t|
    t.integer "nettyid"
    t.string  "listof",       limit: 5
    t.string  "name",         limit: 120, default: "", null: false
    t.string  "listcategory", limit: 120
  end

  create_table "lists_contacts", id: false, force: true do |t|
    t.integer "list_id",       default: 0, null: false
    t.integer "individual_id"
    t.integer "group_id"
  end

  create_table "living_situations", force: true do |t|
    t.string "situation"
  end

  create_table "locations", force: true do |t|
    t.string "name"
    t.string "description"
    t.string "calendar_url"
  end

  create_table "messages", force: true do |t|
    t.string   "title"
    t.string   "image_url"
    t.string   "type"
    t.text     "message_text"
    t.integer  "creator_id"
    t.integer  "visibility_range_low"
    t.integer  "visibility_range_high"
    t.boolean  "visible_to_parents"
    t.boolean  "visible_to_students"
    t.boolean  "visible_to_alumni"
    t.boolean  "visible_to_teachers"
    t.integer  "notification"
    t.boolean  "notification_sent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiple_choice_answers", force: true do |t|
    t.text    "answer_text"
    t.integer "question_id"
    t.string  "letter",      limit: 2
  end

  create_table "notes", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.integer  "author_id"
    t.integer  "notation_id"
    t.string   "notation_type"
    t.boolean  "escallate"
    t.boolean  "admin_viewable",   default: true
    t.boolean  "teacher_viewable", default: true
  end

  add_index "notes", ["notation_id"], name: "notation_id", using: :btree
  add_index "notes", ["notation_type"], name: "notation_type", using: :btree

  create_table "old_enrollments", force: true do |t|
    t.integer "student_id", limit: 3
    t.integer "section_id", limit: 3
    t.integer "year_id",    limit: 1
  end

  add_index "old_enrollments", ["section_id"], name: "section_id", using: :btree
  add_index "old_enrollments", ["section_id"], name: "section_id_2", using: :btree
  add_index "old_enrollments", ["student_id"], name: "student_id", using: :btree
  add_index "old_enrollments", ["student_id"], name: "student_id_2", using: :btree
  add_index "old_enrollments", ["year_id"], name: "year_id", using: :btree
  add_index "old_enrollments", ["year_id"], name: "year_id_2", using: :btree

  create_table "one_to_fives", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pathways", force: true do |t|
    t.boolean  "skill"
    t.boolean  "idea"
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", force: true do |t|
    t.string  "name"
    t.boolean "us_period"
    t.boolean "ms_period"
  end

  add_index "periods", ["ms_period"], name: "ms_period", using: :btree
  add_index "periods", ["us_period"], name: "us_period", using: :btree

  create_table "portal_syncs", force: true do |t|
    t.string   "IDFAMILY"
    t.string   "Pa_prefix"
    t.string   "Pa_first"
    t.string   "Pa_middle"
    t.string   "Pa_last"
    t.string   "Pa_suffix"
    t.string   "Pb_prefix"
    t.string   "Pb_first"
    t.string   "Pb_middle"
    t.string   "Pb_last"
    t.string   "Pb_suffix"
    t.string   "P_phone_H"
    t.string   "Pa_phone_W"
    t.string   "Pb_phone_W"
    t.string   "Pa_phone_cell"
    t.string   "Pb_phone_cell"
    t.string   "Pa_email"
    t.string   "Pb_email"
    t.string   "Pub_Pa_email"
    t.string   "Pub_Pb_email"
    t.string   "Pa_occupation"
    t.string   "Pb_occupation"
    t.string   "Pa_business_name"
    t.string   "Pb_business_name"
    t.string   "P_street"
    t.string   "P_city"
    t.string   "P_state"
    t.integer  "P_zip"
    t.integer  "zz_pwsKey"
    t.integer  "zz_gIDTempInq"
    t.string   "IDInquiryArc"
    t.string   "StudentResidence"
    t.integer  "pa_four11_id"
    t.integer  "pb_four11_id"
    t.date     "Modification_date"
    t.time     "Modification_time"
    t.string   "Modifier_name"
    t.boolean  "approve_modification_to_four11"
    t.boolean  "approve_modification_to_portal"
    t.integer  "modified_in_four11_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prenotes", force: true do |t|
    t.integer  "course_id"
    t.integer  "author_id"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "star"
    t.string   "title"
    t.text     "raw"
    t.text     "homework"
    t.text     "coursework"
    t.text     "reflection"
    t.integer  "section_num"
    t.integer  "attachments"
    t.integer  "owshiddenversion"
    t.integer  "rating"
    t.integer  "learning_type_id"
    t.integer  "ows_id"
    t.string   "calendar_guid"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.string   "topics"
  end

  create_table "privnotes", force: true do |t|
    t.integer  "sid"
    t.string   "cc"
    t.string   "schoolid"
    t.text     "notes"
    t.datetime "LastUpdate"
  end

  create_table "progressreports", force: true do |t|
    t.integer  "section_id"
    t.integer  "student_id"
    t.integer  "grade_id",            default: 15
    t.integer  "term_id"
    t.integer  "year_id"
    t.text     "preparedness_body"
    t.text     "performance_body"
    t.text     "improve_body"
    t.integer  "updated_by"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.boolean  "arrives_on_time"
    t.boolean  "assignments_on_time"
  end

  add_index "progressreports", ["section_id"], name: "section_id", using: :btree
  add_index "progressreports", ["student_id"], name: "student_id", using: :btree
  add_index "progressreports", ["term_id"], name: "term_id", using: :btree
  add_index "progressreports", ["year_id"], name: "year_id", using: :btree

  create_table "question_groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "question_text"
    t.integer  "question_number"
    t.integer  "message_id"
    t.string   "title"
    t.string   "body"
    t.string   "options"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer "group_id"
    t.integer "individual_id"
    t.integer "relationship_id"
    t.integer "year_id"
    t.string  "type",            limit: 30
    t.integer "test"
    t.boolean "custodial"
  end

  create_table "resources", force: true do |t|
    t.string   "allocation_type"
    t.string   "type"
    t.integer  "allocation_id"
    t.integer  "year_id"
    t.integer  "requestor_id"
    t.string   "author"
    t.string   "title"
    t.string   "isbn"
    t.string   "isbn13"
    t.float    "estimated_price"
    t.float    "final_price"
    t.float    "shipping"
    t.float    "return_cost"
    t.boolean  "edit_lock"
    t.boolean  "required"
    t.boolean  "division_head_approved"
    t.integer  "number_teachers_editions_needed"
    t.integer  "number_regular_editions_needed"
    t.integer  "student_order_quantity"
    t.integer  "number_returned"
    t.string   "sourced_from"
    t.date     "arrival_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "kindle_price"
    t.string   "kindle_id"
    t.boolean  "kindle_available"
    t.float    "nook_price"
    t.string   "nook_id"
    t.boolean  "nook_available"
    t.text     "ebook_notes"
    t.text     "ebook_available_notes"
    t.boolean  "paper_version_required"
    t.integer  "inventory_count"
    t.float    "other_ebook_price"
    t.integer  "parent_id"
    t.boolean  "other_ebook_available"
    t.text     "admin_notes"
  end

  create_table "responses", force: true do |t|
    t.integer  "question_id"
    t.boolean  "true_false"
    t.text     "fill_in_blank"
    t.string   "multiple_choice"
    t.integer  "num_response"
    t.integer  "message_id"
    t.text     "response_text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name",              limit: 40
    t.string   "authorizable_type", limit: 30
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "satchels", force: true do |t|
    t.string   "name"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "cloned_from_id"
    t.string   "type"
    t.integer  "holder_id"
    t.string   "holder_type"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_requests", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "alternate_one_id"
    t.integer  "alternate_two_id"
    t.integer  "year_id"
    t.datetime "updated_on"
    t.datetime "created_on"
  end

  create_table "schgrades", force: true do |t|
    t.string "schgrade", limit: 2
  end

  create_table "schoolhistories", force: true do |t|
  end

  create_table "seccomments", force: true do |t|
    t.integer   "term_id",    limit: 2
    t.integer   "year_id",    limit: 2
    t.integer   "section_id", limit: 3, default: 0, null: false
    t.text      "body"
    t.timestamp "created_on",                       null: false
    t.timestamp "updated_on",                       null: false
  end

  add_index "seccomments", ["section_id"], name: "section_id", using: :btree
  add_index "seccomments", ["term_id"], name: "term_id", using: :btree
  add_index "seccomments", ["year_id"], name: "year_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer "term_id",              limit: 1
    t.integer "year_id",              limit: 2, default: 0,     null: false
    t.integer "course_id",            limit: 3
    t.integer "section"
    t.integer "period_id"
    t.integer "location_id"
    t.string  "epsnet_path"
    t.string  "epsnet_announcements"
    t.string  "epsnet_events"
    t.boolean "skip_attendance",                default: false
    t.integer "canvas_course_id"
  end

  add_index "sections", ["course_id"], name: "course_id", using: :btree
  add_index "sections", ["course_id"], name: "course_id_2", using: :btree
  add_index "sections", ["location_id"], name: "location_id", using: :btree
  add_index "sections", ["period_id"], name: "period_id", using: :btree
  add_index "sections", ["term_id"], name: "term_id", using: :btree
  add_index "sections", ["term_id"], name: "term_id_2", using: :btree
  add_index "sections", ["year_id"], name: "year_id", using: :btree
  add_index "sections", ["year_id"], name: "year_id_2", using: :btree

  create_table "sections_teachers", primary_key: "oldid", force: true do |t|
    t.integer "teacher_id", limit: 3
    t.integer "section_id", limit: 3
    t.integer "year_id",    limit: 1
  end

  add_index "sections_teachers", ["section_id"], name: "section_id", using: :btree
  add_index "sections_teachers", ["section_id"], name: "section_id_2", using: :btree
  add_index "sections_teachers", ["teacher_id"], name: "teacher_id", using: :btree
  add_index "sections_teachers", ["teacher_id"], name: "teacher_id_2", using: :btree
  add_index "sections_teachers", ["year_id"], name: "year_id", using: :btree
  add_index "sections_teachers", ["year_id"], name: "year_id_2", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_reports", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "sql"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.string  "source",   limit: 60
    t.boolean "internal"
    t.integer "order"
  end

  create_table "statuses", force: true do |t|
    t.string "status", limit: 60
  end

  create_table "strengths", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stucomments", force: true do |t|
    t.integer   "term_id",       limit: 2
    t.integer   "year_id",       limit: 2
    t.integer   "student_id",    limit: 3, default: 0,  null: false
    t.integer   "section_id",    limit: 3, default: 0,  null: false
    t.integer   "grade_id",      limit: 2, default: 15
    t.text      "body"
    t.timestamp "created_on",                           null: false
    t.timestamp "updated_on",                           null: false
    t.integer   "lock_version",            default: 0
    t.boolean   "final_grade"
    t.integer   "exam_grade_id",           default: 15
  end

  add_index "stucomments", ["section_id"], name: "section_id", using: :btree
  add_index "stucomments", ["section_id"], name: "section_id_2", using: :btree
  add_index "stucomments", ["student_id"], name: "student_id", using: :btree
  add_index "stucomments", ["student_id"], name: "student_id_2", using: :btree
  add_index "stucomments", ["term_id"], name: "term_id", using: :btree
  add_index "stucomments", ["term_id"], name: "term_id_2", using: :btree
  add_index "stucomments", ["year_id"], name: "year_id", using: :btree
  add_index "stucomments", ["year_id"], name: "year_id_2", using: :btree

  create_table "student_self_assessments", force: true do |t|
    t.integer  "progressreport_id"
    t.integer  "student_id"
    t.text     "body"
    t.float    "acted_on_suggestions"
    t.float    "best_effort"
    t.float    "challenging"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "expected_grade_id"
    t.float    "preparedness"
    t.float    "engagement"
  end

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_individuals", id: false, force: true do |t|
    t.integer "student_id",      default: 0, null: false
    t.integer "individual_id",   default: 0, null: false
    t.integer "relationship_id", default: 0, null: false
  end

  create_table "submissions", force: true do |t|
    t.integer  "canvas_id"
    t.text     "body"
    t.string   "url"
    t.integer  "attachment_id"
    t.string   "grade"
    t.float    "score"
    t.datetime "submitted_at"
    t.integer  "assignment_id"
    t.integer  "canvas_user_id"
    t.string   "submission_type"
    t.string   "workflow_state"
    t.integer  "group_id"
    t.string   "attachment_ids"
    t.boolean  "processed"
    t.integer  "process_attempts"
    t.boolean  "grade_matches_current_submission"
    t.float    "published_score"
    t.string   "publihsed_grade"
    t.datetime "graded_at"
    t.integer  "canvas_grader_id",                 limit: 8
    t.text     "submission_comments_json"
    t.integer  "submission_commnets_count"
    t.boolean  "changed_since_publish"
    t.string   "media_comment_id"
    t.string   "media_comment_type"
    t.boolean  "has_rubric_assessment"
    t.integer  "attempt"
    t.integer  "canvas_course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "html_url"
    t.string   "preview_url"
  end

  create_table "survey_questions", force: true do |t|
    t.integer  "survey_id"
    t.integer  "question_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "anon_individual"
    t.boolean  "anon_section"
    t.integer  "year_id"
    t.string   "submit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "election"
  end

  create_table "teacher_evaluations", force: true do |t|
    t.string "applicantion_data_id"
    t.string "lastname"
    t.string "firstname"
    t.string "title"
    t.string "relationship"
    t.string "how_long_have_you_known_the_applicant"
    t.string "evaluation_body"
    t.string "notes_on_evaluations"
  end

  create_table "teachers", force: true do |t|
    t.string "sisid",     limit: 8
    t.string "lastname",  limit: 50
    t.string "firstname", limit: 50
    t.string "gender",    limit: 1
    t.date   "birthday"
    t.string "degree"
    t.string "login"
  end

  add_index "teachers", ["login"], name: "login", using: :btree

  create_table "teaching_assignments", force: true do |t|
    t.integer "teacher_id", limit: 3
    t.integer "section_id", limit: 3
    t.integer "year_id",    limit: 1
  end

  add_index "teaching_assignments", ["section_id"], name: "section_id", using: :btree
  add_index "teaching_assignments", ["section_id"], name: "section_id_2", using: :btree
  add_index "teaching_assignments", ["teacher_id"], name: "teacher_id", using: :btree
  add_index "teaching_assignments", ["teacher_id"], name: "teacher_id_2", using: :btree
  add_index "teaching_assignments", ["year_id"], name: "year_id", using: :btree
  add_index "teaching_assignments", ["year_id"], name: "year_id_2", using: :btree

  create_table "terms", force: true do |t|
    t.boolean "t1"
    t.boolean "t2"
    t.boolean "t3"
    t.string  "name",           limit: 30
    t.boolean "current",                   default: false
    t.boolean "current_graded"
  end

  create_table "thought_categories", force: true do |t|
    t.integer  "order"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thought_votes", force: true do |t|
    t.integer  "thought_id"
    t.integer  "voter_id"
    t.boolean  "funny"
    t.boolean  "so_eps"
    t.boolean  "great_idea"
    t.boolean  "thumbs_up"
    t.boolean  "thumbs_down"
    t.string   "custom_tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thoughts", force: true do |t|
    t.text     "body"
    t.integer  "thought_category_id"
    t.integer  "author_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_plans", force: true do |t|
    t.integer  "course_id"
    t.integer  "year_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.text     "description"
    t.text     "how_addresses_big_question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "topics"
    t.text     "genres"
    t.text     "geographies"
    t.text     "period"
    t.text     "works"
    t.integer  "updated_by_id"
    t.integer  "parent_id"
  end

  add_index "unit_plans", ["course_id"], name: "course_id", using: :btree

  create_table "vlan_overrides", force: true do |t|
    t.integer  "new_vlan"
    t.integer  "individual_id"
    t.integer  "requester_id"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yeargrades", force: true do |t|
    t.integer "student_id", limit: 3
    t.integer "year_id",    limit: 1
    t.integer "grade_id",   limit: 1
    t.string  "subgrade",   limit: 1
  end

  create_table "years", force: true do |t|
    t.string  "name",           limit: 9
    t.boolean "current",                  default: false
    t.boolean "current_graded"
  end

end
