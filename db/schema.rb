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

ActiveRecord::Schema.define(version: 20180130220437) do

  create_table "#tableau_0_sid_0396899c_4_filter", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "none_answer_nk"
    t.integer "_Tableau_join_flag", default: 0, null: false
    t.index ["none_answer_nk"], name: "_tidx_#Tableau_0_sid_0396899C_4_Filter_1a", length: { none_answer_nk: 63 }
  end

  create_table "absence_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.string "description"
  end

  create_table "absences", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "student_id"
    t.integer "section_id"
    t.integer "absence_code_id"
    t.boolean "excused"
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "offsite_location"
    t.string "contact"
    t.index ["absence_code_id"], name: "absence_code_id"
    t.index ["date"], name: "date"
    t.index ["section_id"], name: "section_id"
    t.index ["student_id"], name: "student_id"
  end

  create_table "access_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "location_id"
    t.string "mac_addr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accommodations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "category"
    t.string "group_name"
    t.integer "order"
  end

  create_table "accommodations_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "accommodation_id"
    t.integer "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "address1", limit: 60
    t.string "address", limit: 60
    t.string "city", limit: 60
    t.string "state", limit: 2
    t.string "zip", limit: 12
    t.timestamp "created_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_on", null: false
  end

  create_table "admins", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "client_id"
    t.string "client_pw"
    t.string "client_school"
    t.date "client_expdate"
    t.string "client_fullname"
    t.text "webinfo"
    t.date "webinfodate"
    t.datetime "LastUpdate"
    t.string "user_activation_key"
    t.string "user_email"
  end

  create_table "advisors", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "student_id", limit: 3
    t.integer "teacher_id", limit: 3
    t.integer "year_id"
    t.text "goal_notes"
    t.string "goal1"
    t.string "goal2"
    t.string "goal3"
    t.index ["student_id"], name: "student_id_2"
    t.index ["student_id"], name: "teacher_id"
    t.index ["teacher_id"], name: "student_id"
    t.index ["teacher_id"], name: "teacher_id_2"
    t.index ["year_id"], name: "year_id"
  end

  create_table "answers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "question_id"
    t.integer "individual_id"
    t.integer "section_id"
    t.integer "year_id"
    t.text "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicant_datas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "applicant_id"
    t.integer "year_id"
    t.integer "school_id"
    t.string "notes"
    t.boolean "application_form_in"
    t.boolean "application_fee_in"
    t.boolean "parent_questionaire_in"
    t.float "parent_questionaire_rating", limit: 24
    t.boolean "student_questionaire_in"
    t.float "student_questionaire_rating", limit: 24
    t.boolean "personal_reference_in"
    t.float "personal_reference_rating", limit: 24
    t.boolean "record_request_form_in"
    t.boolean "grades_current_year_in"
    t.float "grades_rating", limit: 24
    t.boolean "grades_two_years_in"
    t.integer "isee_test_results_math"
    t.integer "isee_test_results_english"
    t.float "isee_rating", limit: 24
    t.float "teacher_evals_rating", limit: 24
    t.boolean "test_results_in"
    t.date "visit_on"
    t.integer "host_id"
    t.date "parent_interview_on"
    t.float "parent_interview_rating", limit: 24
    t.float "student_interview_rating", limit: 24
    t.integer "student_interviewer_id"
    t.integer "parent_interviewer_id"
    t.date "sent_initial_receipt_letter_on"
    t.date "sent_application_complete_letter_on"
    t.date "sent_decision_letter_on"
    t.integer "reason_for_attending_elsewhere_id"
    t.integer "how_did_you_hear_about_eps_id"
  end

  create_table "assessment_responses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "section_id"
    t.string "assessment"
    t.text "response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "unit_plan_id"
    t.string "name"
    t.string "type"
    t.boolean "written"
    t.boolean "oral"
    t.boolean "visual"
    t.boolean "technology"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "assignment_file_name"
    t.string "assignment_content_type"
    t.integer "assignment_file_size"
    t.string "rubric_file_name"
    t.string "rubric_content_type"
    t.integer "rubric_file_size"
    t.string "exceeds_expectations_file_name"
    t.string "exceeds_expectations_content_type"
    t.integer "exceeds_expectations_file_size"
    t.string "meets_expectations_file_name"
    t.string "meets_expectations_content_type"
    t.integer "meets_expectations_file_size"
    t.string "dnme_file_name"
    t.string "dnme_content_type"
    t.integer "dnme_file_size"
  end

  create_table "assessments_learning_targets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "assessment_id"
    t.integer "learning_target_id"
  end

  create_table "assigned_surveys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "individual_id"
    t.integer "section_id"
    t.integer "survey_id"
    t.boolean "visible"
    t.boolean "enabled"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignment_audits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "student_id"
    t.integer "section_id"
    t.integer "missing"
    t.integer "incomplete"
    t.integer "absent"
    t.integer "total"
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignment_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "canvas_id"
    t.string "name"
    t.text "rules"
    t.integer "position"
    t.integer "canvas_course_id"
    t.string "assignment_weighting_scheme"
    t.float "group_weight", limit: 24
    t.string "workflow_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "canvas_id"
    t.string "name"
    t.text "description"
    t.datetime "due_at"
    t.datetime "lock_at"
    t.float "points_possible", limit: 24
    t.integer "needs_grading_count"
    t.float "min_score", limit: 24
    t.float "max_score", limit: 24
    t.float "mastery_score", limit: 24
    t.string "grading_type"
    t.string "submission_types"
    t.string "workflow_state"
    t.integer "canvas_course_id"
    t.integer "assignment_group_id"
    t.integer "grading_scheme_id"
    t.integer "grading_standard_id"
    t.string "html_url"
    t.string "grade_students_individually"
    t.boolean "turnitin_enabled"
    t.boolean "muted"
    t.text "rubric_json"
    t.integer "group_id"
    t.integer "group_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "median", limit: 24
    t.float "first_quartile", limit: 24
    t.float "third_quartile", limit: 24
    t.float "tardiness_on_time", limit: 24
    t.float "tardiness_missing", limit: 24
    t.float "tardiness_late", limit: 24
  end

  create_table "bdrb_job_queues", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.binary "args"
    t.string "worker_name"
    t.string "worker_method"
    t.string "job_key"
    t.integer "taken"
    t.integer "finished"
    t.integer "timeout"
    t.integer "priority"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.string "tag"
    t.string "submitter_info"
    t.string "runner_info"
    t.string "worker_key"
    t.datetime "scheduled_at"
  end

  create_table "bins", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "period_id"
    t.time "starttime"
    t.time "endtime"
    t.string "day"
    t.integer "day_id"
    t.index ["period_id"], name: "period_id"
  end

  create_table "books", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canvas_assignments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "canvas_assignment_id"
    t.integer "canvas_course_id"
    t.integer "canvas_assignment_group_id"
    t.integer "course_id"
    t.integer "teacher_id"
    t.integer "total_points"
    t.string "assignment_type"
    t.integer "term_id"
    t.integer "year_id"
    t.datetime "due_date"
    t.string "assignment_analytics"
    t.boolean "rubric_graded"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canvas_courses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canvas_submissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "canvas_assignment_id"
    t.integer "student_id"
    t.float "points_earned", limit: 24
    t.datetime "submission_time"
    t.float "submission_delta", limit: 24
    t.boolean "guided_study_hall"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_boxes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklists", id: :integer, limit: 3, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "student_id", limit: 3, default: 0, null: false
    t.integer "section_id", limit: 3, default: 0, null: false
    t.integer "term_id", limit: 2, default: 1
    t.integer "year_id", limit: 2, default: 0, null: false
    t.integer "grade_id", default: 15
    t.integer "on_time", limit: 2, default: 3
    t.integer "with_materials", limit: 2, default: 3
    t.integer "homework", limit: 2, default: 3
    t.integer "ready_to_learn", limit: 2, default: 3
    t.integer "discussion_knowledge", limit: 2, default: 3
    t.integer "discussion_thinking", limit: 2, default: 3
    t.integer "written_knowledge", limit: 2, default: 3
    t.integer "written_thinking", limit: 2, default: 3
    t.integer "expands_ideas", limit: 2, default: 3
    t.integer "research", limit: 2, default: 3
    t.integer "questions_clarity", limit: 2, default: 3
    t.integer "questions_expands", limit: 2, default: 3
    t.integer "mistakes_learning", limit: 2, default: 3
    t.integer "creates_learning_envi", limit: 2, default: 3
    t.integer "respects_eps", limit: 2, default: 3
    t.integer "exam_written", limit: 2, default: 3
    t.integer "exam_oral", limit: 2, default: 3
    t.integer "exam_creative", limit: 2, default: 3
    t.integer "discipline_think", limit: 2, default: 3
    t.string "custom1", collation: "latin1_swedish_ci"
    t.integer "custom1_grade", limit: 2, default: 6
    t.string "custom2", collation: "latin1_swedish_ci"
    t.integer "custom2_grade", limit: 2, default: 6
    t.text "body"
    t.timestamp "created_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_on", null: false
    t.index ["section_id"], name: "section_id"
    t.index ["student_id"], name: "student_id"
    t.index ["term_id"], name: "term_id"
    t.index ["year_id"], name: "year_id"
  end

  create_table "classnotes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "client_id"
    t.string "cc"
    t.string "schoolid"
    t.text "notes"
    t.datetime "lastupdate"
  end

  create_table "comment_summaries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "student_id"
    t.integer "term_id"
    t.integer "year_id"
    t.integer "author_id"
    t.float "gpa", limit: 24
    t.float "old_gpa", limit: 24
    t.integer "absences"
    t.integer "tardies"
    t.text "body"
    t.text "unofficial_notes"
    t.date "created_on"
    t.date "updated_on"
    t.integer "updater_id"
    t.integer "lock_version"
    t.text "student_response"
    t.index ["author_id"], name: "author_id"
    t.index ["student_id"], name: "student_id"
    t.index ["term_id"], name: "term_id"
    t.index ["year_id"], name: "year_id"
  end

  create_table "commentlist", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "schoolid"
    t.integer "commentnum"
    t.text "commenttxt"
    t.datetime "LastUpdate"
  end

  create_table "companies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.string "name", limit: 120, default: "", null: false
  end

  create_table "config", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "value"
  end

  create_table "consumer_tokens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "type", limit: 30
    t.string "token", limit: 1024
    t.string "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_consumer_tokens_on_token", length: { token: 767 }
  end

  create_table "contacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "individual_id"
    t.integer "group_id"
    t.string "email", limit: 120
    t.bigint "phone"
    t.integer "extention"
    t.integer "contacttype_id"
    t.integer "okdirectory", default: 1
    t.integer "oksendmail", default: 1, null: false
    t.integer "emergenciesonly", default: 0
    t.integer "preferred", default: 0
    t.text "type"
    t.boolean "getsgrades"
  end

  create_table "contacttypes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "contacttype", limit: 60
  end

  create_table "course_offerings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "course_id"
    t.integer "year_id"
    t.string "grade_level_ids"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "sort_order"
    t.string "info"
    t.string "gradelevels"
  end

  create_table "courseinfo", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "cc"
    t.string "schoolid"
    t.string "facultyname"
    t.string "facultycode"
    t.string "period"
    t.string "email"
    t.string "phone"
    t.string "misc"
    t.string "coursename"
    t.text "assignlist"
    t.text "assignvals"
    t.text "assigndates"
    t.text "ealr"
    t.string "modified"
    t.string "type"
    t.datetime "LastUpdate"
  end

  create_table "courses", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.string "name", collation: "latin1_swedish_ci"
    t.string "sisid", limit: 45, collation: "latin1_swedish_ci"
    t.string "description", collation: "latin1_swedish_ci"
    t.integer "division_id", limit: 1
    t.integer "term_id", limit: 1
    t.text "cat_entry", limit: 4294967295, collation: "latin1_swedish_ci"
    t.boolean "needalt"
    t.integer "graded"
    t.string "short_name"
    t.boolean "catalog"
    t.boolean "offering"
    t.string "subdiscipline"
    t.boolean "required"
    t.string "gradelevels"
    t.string "requirements"
    t.integer "department_id"
    t.string "shortname"
    t.boolean "archived"
    t.float "credits", limit: 24
    t.integer "sort_tier"
    t.string "course_image_file_name"
    t.string "course_image_content_type"
    t.integer "course_image_file_size"
    t.datetime "course_image_updated_at"
    t.index ["division_id"], name: "division_id"
    t.index ["division_id"], name: "division_id_2"
    t.index ["graded"], name: "graded"
    t.index ["sisid"], name: "sisid"
    t.index ["term_id"], name: "term_id"
    t.index ["term_id"], name: "term_id_2"
  end

  create_table "current_ideas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idea_id"
    t.integer "year_id"
    t.boolean "should_persist"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "date"
    t.integer "section_id"
    t.integer "author_id"
    t.text "warmup"
    t.text "agenda"
    t.text "what_worked"
    t.text "what_didnt_work"
    t.text "ideas"
    t.integer "smoothness"
    t.integer "learning_happened"
    t.integer "students_engaged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.boolean "special"
    t.boolean "course_schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "short_name"
  end

  create_table "devices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "individual_id"
    t.string "mac_addr_wifi"
    t.string "ip_addr"
    t.integer "access_point_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "mac_addr_eth"
    t.string "make"
    t.string "model"
    t.string "serial"
  end

  create_table "divisions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "short_name"
  end

  create_table "drop_downs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "student_id", limit: 3, unsigned: true
    t.integer "section_id", limit: 3, unsigned: true
    t.integer "year_id", limit: 1
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["section_id"], name: "section_id"
    t.index ["student_id"], name: "student_id"
    t.index ["year_id"], name: "year_id"
  end

  create_table "eventlog", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "eventid"
    t.string "schoolid"
    t.string "user"
    t.string "ipaddr"
    t.datetime "LastUpdate"
  end

  create_table "expectations", id: :integer, limit: 2, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.string "grade", limit: 50, collation: "latin1_swedish_ci"
  end

  create_table "facebook_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "individual_id"
    t.bigint "facebook_id"
    t.string "session_key"
    t.string "email1"
    t.string "email2"
    t.string "street_address"
    t.string "country"
    t.string "city"
    t.string "state"
    t.string "university1"
    t.string "university2"
    t.string "university3"
    t.string "university4"
    t.string "employer1"
    t.string "employer2"
    t.string "employer3"
    t.string "area_of_study1"
    t.string "area_of_study2"
    t.string "area_of_study3"
    t.string "profession"
    t.integer "street_address_privacy"
    t.integer "email1_privacy"
    t.integer "email2_privacy"
    t.integer "city_privacy"
    t.integer "phone1_privacy"
    t.integer "phone2_privacy"
    t.integer "phone3_privacy"
    t.string "phone1"
    t.string "phone2"
    t.string "phone3"
    t.string "phone1_type"
    t.string "phone2_type"
    t.string "phone3_type"
    t.string "email1_type"
    t.string "email2_type"
    t.boolean "street_address_au"
    t.boolean "city_au"
    t.boolean "state_au"
    t.boolean "country_au"
    t.boolean "university1_au"
    t.boolean "university2_au"
    t.boolean "university3_au"
    t.boolean "university4_au"
    t.boolean "area_of_study1_au"
    t.boolean "area_of_study2_au"
    t.boolean "area_of_study3_au"
    t.boolean "employer1_au"
    t.boolean "employer2_au"
    t.boolean "employer3_au"
    t.boolean "profession_au"
    t.boolean "phone1_au"
    t.boolean "phone2_au"
    t.boolean "phone3_au"
    t.boolean "email1_au"
    t.boolean "email2_au"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_templates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "template_name", null: false
    t.string "content_hash", null: false
    t.string "bundle_id"
    t.index ["template_name"], name: "index_facebook_templates_on_template_name", unique: true
  end

  create_table "final_grades", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.integer "year_id"
    t.integer "term_one_percent"
    t.integer "term_one_grade"
    t.integer "term_two_percent"
    t.integer "term_two_grade"
    t.integer "term_three_percent"
    t.integer "term_three_grade"
    t.integer "exam_percent"
    t.integer "exam_grade"
    t.integer "final_grade"
    t.integer "updated_by"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "flags", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "progressreport_id"
    t.boolean "student_not_known"
    t.boolean "needs_next_steps"
    t.boolean "worried"
    t.boolean "grade_does_not_correlate"
    t.boolean "many_edits"
    t.boolean "best_of"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "glos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "number"
    t.text "name"
    t.text "description"
    t.integer "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gmscores", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "sid"
    t.string "cc"
    t.string "schoolid"
    t.text "scores"
    t.float "percent", limit: 24
    t.string "grade"
    t.string "comments"
    t.datetime "LastUpdate"
  end

  create_table "grade_levels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "short_name"
    t.integer "order"
    t.boolean "ls_grade_level"
    t.boolean "ms_grade_level"
    t.boolean "us_grade_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_overrides", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "student_id"
    t.integer "year_id"
    t.integer "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", id: :integer, limit: 2, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.string "grade", limit: 2, collation: "latin1_swedish_ci"
    t.float "gpa", limit: 24
  end

  create_table "gri", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "group_id"
    t.integer "individual_id"
    t.integer "relationship_id"
    t.integer "year_id"
    t.string "type", limit: 30
    t.index ["group_id", "relationship_id", "year_id", "individual_id"], name: "group_id_2", unique: true
    t.index ["group_id", "relationship_id", "year_id", "individual_id"], name: "group_id_3", unique: true
    t.index ["group_id", "relationship_id", "year_id", "type", "individual_id"], name: "group_id", unique: true
  end

  create_table "groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "nettyid"
    t.string "name", limit: 60
    t.integer "address_id", default: 0, null: false
    t.string "website", limit: 60
    t.integer "status_id", default: 0, null: false
    t.string "type", limit: 20, default: "", null: false
    t.integer "oksendmail", default: 1, null: false
    t.text "notes"
    t.text "nettynotes"
    t.integer "startgrade_id"
    t.integer "endgrade_id"
    t.string "specialty", limit: 60
    t.timestamp "created_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_on", null: false
    t.string "sisid", limit: 60
    t.integer "okdirectory", default: 1, null: false
    t.integer "deleted", default: 0, null: false
    t.integer "test"
    t.boolean "okmap", default: true
    t.string "P_phone_H"
    t.string "P_email_preferred"
    t.boolean "DoNotPublish_P_phone_H"
    t.boolean "DoNotPublish_P_email_preferred"
    t.string "Pa_first"
    t.string "Pa_last"
    t.string "Pa_phone_W"
    t.string "Pa_phone_cell"
    t.string "Pa_email"
    t.boolean "DoNotPublish_Pa_phone_W"
    t.boolean "DoNotPublish_Pa_phone_cell"
    t.boolean "DoNotPublish_Pa_email"
    t.string "Pb_first"
    t.string "Pb_last"
    t.string "Pb_phone_W"
    t.string "Pb_phone_cell"
    t.string "Pb_email"
    t.boolean "DoNotPublish_Pb_phone_W"
    t.boolean "DoNotPublish_Pb_phone_cell"
    t.boolean "DoNotPublish_Pb_email"
    t.boolean "DoNotPublish_P1address"
    t.string "P_street"
    t.string "P_city"
    t.string "P_state"
    t.string "P_zip"
    t.boolean "DoNotPublish_car_pool_map"
    t.string "pa_canvas_api_key"
    t.string "pb_canvas_api_key"
    t.string "lat"
    t.string "long"
    t.string "home_lang"
    t.boolean "forms_due"
    t.boolean "account_due"
    t.boolean "pledge_due"
    t.boolean "lunch_acct_due"
    t.boolean "emergencies_only"
    t.boolean "no_sms_a"
    t.boolean "no_sms_b"
    t.boolean "do_not_call_pa"
    t.boolean "do_not_call_pb"
    t.string "geo_address"
    t.index ["address_id"], name: "address_id"
  end

  create_table "ideas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individuals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "nettyid"
    t.string "sisid", limit: 55
    t.string "sisid_fac", limit: 18
    t.string "login", limit: 60
    t.string "lastname", limit: 60, default: ""
    t.string "firstname", limit: 60, default: ""
    t.string "middlename", limit: 60
    t.string "prefix", limit: 10
    t.string "suffix", limit: 10
    t.string "gender", limit: 2
    t.date "birthday"
    t.integer "locker"
    t.integer "combo"
    t.integer "gradyear"
    t.string "degree", limit: 8
    t.string "salutation", limit: 60
    t.string "company_id", limit: 60
    t.string "title", limit: 60
    t.string "website", limit: 60
    t.text "notes"
    t.text "nettynotes"
    t.integer "source_id"
    t.string "oksendmail", limit: 2, default: "1", null: false
    t.integer "address_id", default: 0, null: false
    t.integer "status_id", default: 0, null: false
    t.string "type", limit: 20, default: "", null: false
    t.integer "updater_id"
    t.timestamp "created_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_on", null: false
    t.integer "deleted", default: 0, null: false
    t.string "nickname"
    t.string "ethnicity"
    t.string "citizenship"
    t.integer "living_situation_id"
    t.integer "lunch_id"
    t.string "mac_addr"
    t.string "ip_addr"
    t.string "user_activation_key"
    t.string "client_pw"
    t.text "notes_to_admin"
    t.text "notes_to_instructor"
    t.boolean "internet_off"
    t.integer "facebook_id"
    t.boolean "facebook_connected"
    t.integer "rediker_id"
    t.string "idfamily1"
    t.string "idfamily2"
    t.string "idfamily3"
    t.string "idfamily4"
    t.integer "default_vlan"
    t.string "canvas_api_key"
    t.bigint "canvas_id"
    t.integer "year_of_entry_id"
    t.boolean "leaving"
    t.boolean "rainier_scholar"
    t.string "house"
    t.string "home_phone"
    t.string "cell_phone"
    t.string "emergency_contact_cell"
    t.string "emergency_contact_email"
    t.string "department"
    t.string "clubs"
    t.string "play"
    t.string "sports"
    t.string "bus_route"
    t.boolean "contract_hold"
    t.string "idphoto_file_name"
    t.string "idphoto_content_type"
    t.integer "idphoto_file_size"
    t.datetime "idphoto_updated_at"
    t.string "webphoto_file_name"
    t.string "webphoto_content_type"
    t.integer "webphoto_file_size"
    t.datetime "webphoto_updated_at"
    t.boolean "allergies"
    t.text "whatallergies"
    t.text "allergicdescription"
    t.text "allergictreatment"
    t.string "communication_plan"
    t.index ["address_id"], name: "address_id"
    t.index ["gradyear"], name: "gradyear"
    t.index ["login"], name: "login"
    t.index ["status_id"], name: "status_id"
    t.index ["type"], name: "type"
  end

  create_table "individuals_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "individual_id"
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individuals_sources", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "individual_id", default: 0, null: false
    t.integer "source_id", default: 0, null: false
  end

  create_table "individuals_strengths", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "individual_id"
    t.integer "strength_id"
    t.integer "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "prospective_id"
    t.integer "current_school_id"
    t.integer "schgrade_id"
    t.integer "applying_for_year_id"
    t.integer "parent1_id"
    t.integer "parent2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries_sources", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "inquiry_id"
    t.integer "source_id"
  end

  create_table "integration_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "idea_pathway_id"
    t.integer "skill_pathway_id"
    t.string "stand_alone_activities"
    t.string "joint_activities"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integration_supports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "teacher_id"
    t.boolean "like"
    t.text "support"
    t.integer "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integrations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.integer "collaboration_id"
    t.integer "unit_plan_id"
    t.string "collaboration_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "integration_event_id"
    t.integer "idea_id"
    t.integer "course_id"
    t.integer "teacher_id"
    t.integer "year_id"
    t.date "date"
  end

  create_table "learning_targets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "glo_id"
    t.string "name"
    t.string "type"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "nettyid"
    t.string "listof", limit: 5
    t.string "name", limit: 120, default: "", null: false
    t.string "listcategory", limit: 120
  end

  create_table "lists_contacts", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "list_id", default: 0, null: false
    t.integer "individual_id"
    t.integer "group_id"
  end

  create_table "living_situations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "situation"
  end

  create_table "locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description"
    t.string "calendar_url"
    t.boolean "archived"
    t.string "pco_key"
    t.integer "pco_id"
    t.string "rediker_id"
  end

  create_table "messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.string "image_url"
    t.string "type"
    t.text "message_text"
    t.integer "creator_id"
    t.integer "visibility_range_low"
    t.integer "visibility_range_high"
    t.boolean "visible_to_parents"
    t.boolean "visible_to_students"
    t.boolean "visible_to_alumni"
    t.boolean "visible_to_teachers"
    t.integer "notification"
    t.boolean "notification_sent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiple_choice_answers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "answer_text"
    t.integer "question_id"
    t.string "letter", limit: 2
  end

  create_table "notes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "subject"
    t.text "body"
    t.datetime "created_at"
    t.integer "author_id"
    t.integer "notation_id"
    t.string "notation_type"
    t.boolean "escallate"
    t.boolean "admin_viewable", default: true
    t.boolean "teacher_viewable", default: true
    t.index ["notation_id"], name: "notation_id"
    t.index ["notation_type"], name: "notation_type"
  end

  create_table "old_enrollments", id: :integer, limit: 3, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "student_id", limit: 3, unsigned: true
    t.integer "section_id", limit: 3, unsigned: true
    t.integer "year_id", limit: 1
    t.index ["section_id"], name: "section_id"
    t.index ["section_id"], name: "section_id_2"
    t.index ["student_id"], name: "student_id"
    t.index ["student_id"], name: "student_id_2"
    t.index ["year_id"], name: "year_id"
    t.index ["year_id"], name: "year_id_2"
  end

  create_table "one_to_fives", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pathways", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "skill"
    t.boolean "idea"
    t.string "name"
    t.string "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.boolean "us_period"
    t.boolean "ms_period"
    t.integer "position"
    t.index ["ms_period"], name: "ms_period"
    t.index ["us_period"], name: "us_period"
  end

  create_table "portal_syncs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "IDFAMILY"
    t.string "Pa_prefix"
    t.string "Pa_first"
    t.string "Pa_middle"
    t.string "Pa_last"
    t.string "Pa_suffix"
    t.string "Pb_prefix"
    t.string "Pb_first"
    t.string "Pb_middle"
    t.string "Pb_last"
    t.string "Pb_suffix"
    t.string "P_phone_H"
    t.string "Pa_phone_W"
    t.string "Pb_phone_W"
    t.string "Pa_phone_cell"
    t.string "Pb_phone_cell"
    t.string "Pa_email"
    t.string "Pb_email"
    t.string "Pub_Pa_email"
    t.string "Pub_Pb_email"
    t.string "Pa_occupation"
    t.string "Pb_occupation"
    t.string "Pa_business_name"
    t.string "Pb_business_name"
    t.string "P_street"
    t.string "P_city"
    t.string "P_state"
    t.integer "P_zip"
    t.integer "zz_pwsKey"
    t.integer "zz_gIDTempInq"
    t.string "IDInquiryArc"
    t.string "StudentResidence"
    t.integer "pa_four11_id"
    t.integer "pb_four11_id"
    t.date "Modification_date"
    t.time "Modification_time"
    t.string "Modifier_name"
    t.boolean "approve_modification_to_four11"
    t.boolean "approve_modification_to_portal"
    t.integer "modified_in_four11_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prenotes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "course_id"
    t.integer "author_id"
    t.datetime "start"
    t.datetime "end"
    t.boolean "star"
    t.string "title"
    t.text "raw"
    t.text "homework"
    t.text "coursework"
    t.text "reflection"
    t.integer "section_num"
    t.integer "attachments"
    t.integer "owshiddenversion"
    t.integer "rating"
    t.integer "learning_type_id"
    t.integer "ows_id"
    t.string "calendar_guid"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "nickname"
    t.string "topics"
  end

  create_table "privnotes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "sid"
    t.string "cc"
    t.string "schoolid"
    t.text "notes"
    t.datetime "LastUpdate"
  end

  create_table "progressreports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "section_id"
    t.integer "student_id"
    t.integer "grade_id", default: 15
    t.integer "term_id"
    t.integer "year_id"
    t.text "preparedness_body"
    t.text "performance_body"
    t.text "improve_body"
    t.integer "updated_by"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.boolean "arrives_on_time"
    t.boolean "assignments_on_time"
    t.boolean "responsible_tech_use"
    t.index ["section_id"], name: "section_id"
    t.index ["student_id"], name: "student_id"
    t.index ["term_id"], name: "term_id"
    t.index ["year_id"], name: "year_id"
  end

  create_table "question_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "question_text"
    t.integer "question_number"
    t.integer "message_id"
    t.string "title"
    t.string "body"
    t.string "options"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "group_id"
    t.integer "individual_id"
    t.integer "relationship_id"
    t.integer "year_id"
    t.string "type", limit: 30
    t.integer "test"
    t.boolean "custodial"
  end

  create_table "resources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "allocation_type"
    t.string "type"
    t.integer "allocation_id"
    t.integer "year_id"
    t.integer "requestor_id"
    t.string "author"
    t.string "title"
    t.string "isbn"
    t.string "isbn13"
    t.float "estimated_price", limit: 24
    t.float "final_price", limit: 24
    t.float "shipping", limit: 24
    t.float "return_cost", limit: 24
    t.boolean "edit_lock"
    t.boolean "required"
    t.boolean "division_head_approved"
    t.integer "number_teachers_editions_needed"
    t.integer "number_regular_editions_needed"
    t.integer "student_order_quantity"
    t.integer "number_returned"
    t.string "sourced_from"
    t.date "arrival_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "kindle_price", limit: 24
    t.string "kindle_id"
    t.boolean "kindle_available"
    t.float "nook_price", limit: 24
    t.string "nook_id"
    t.boolean "nook_available"
    t.text "ebook_notes"
    t.text "ebook_available_notes"
    t.boolean "paper_version_required"
    t.integer "inventory_count"
    t.float "other_ebook_price", limit: 24
    t.integer "parent_id"
    t.boolean "other_ebook_available"
    t.text "admin_notes"
  end

  create_table "responses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "question_id"
    t.boolean "true_false"
    t.text "fill_in_blank"
    t.string "multiple_choice"
    t.integer "num_response"
    t.integer "message_id"
    t.text "response_text"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 40
    t.string "authorizable_type", limit: 30
    t.integer "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "satchels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "lft"
    t.integer "rgt"
    t.integer "cloned_from_id"
    t.string "type"
    t.integer "holder_id"
    t.string "holder_type"
    t.boolean "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_change_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "student_id"
    t.integer "requester_id"
    t.string "intent"
    t.integer "year_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.integer "alternate_one_id"
    t.integer "alternate_two_id"
    t.integer "year_id"
    t.datetime "updated_on"
    t.datetime "created_on"
  end

  create_table "schedules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "date"
    t.integer "day_id"
    t.integer "activity_day_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "term_id"
    t.integer "year_id"
  end

  create_table "schgrades", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "schgrade", limit: 2
  end

  create_table "schoolhistories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
  end

  create_table "seccomments", id: :integer, limit: 3, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "term_id", limit: 2
    t.integer "year_id", limit: 2
    t.integer "section_id", limit: 3, default: 0, null: false
    t.text "body", collation: "latin1_swedish_ci"
    t.timestamp "created_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_on", null: false
    t.index ["section_id"], name: "section_id"
    t.index ["term_id"], name: "term_id"
    t.index ["year_id"], name: "year_id"
  end

  create_table "secprogressreports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "term_id"
    t.integer "year_id"
    t.integer "section_id"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_change_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "schedule_change_request_id"
    t.string "action"
    t.integer "section_id"
    t.string "status"
    t.integer "reviewer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "term_id", limit: 1
    t.integer "year_id", limit: 2, default: 0, null: false
    t.integer "course_id", limit: 3
    t.integer "section"
    t.integer "period_id"
    t.integer "location_id"
    t.string "epsnet_path"
    t.string "epsnet_announcements"
    t.string "epsnet_events"
    t.boolean "skip_attendance", default: false
    t.integer "canvas_course_id"
    t.string "canvas_sisid"
    t.index ["course_id"], name: "course_id"
    t.index ["course_id"], name: "course_id_2"
    t.index ["location_id"], name: "location_id"
    t.index ["period_id"], name: "period_id"
    t.index ["term_id"], name: "term_id"
    t.index ["term_id"], name: "term_id_2"
    t.index ["year_id"], name: "year_id"
    t.index ["year_id"], name: "year_id_2"
  end

  create_table "sections_teachers", primary_key: "oldid", id: :integer, limit: 3, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "teacher_id", limit: 3, unsigned: true
    t.integer "section_id", limit: 3, unsigned: true
    t.integer "year_id", limit: 1
    t.index ["section_id"], name: "section_id"
    t.index ["section_id"], name: "section_id_2"
    t.index ["teacher_id"], name: "teacher_id"
    t.index ["teacher_id"], name: "teacher_id_2"
    t.index ["year_id"], name: "year_id"
    t.index ["year_id"], name: "year_id_2"
  end

  create_table "sessions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "session_id"
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_reports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "category"
    t.text "sql"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "source", limit: 60
    t.boolean "internal"
    t.integer "order"
  end

  create_table "statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "status", limit: 60
  end

  create_table "strengths", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description"
    t.string "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stucomments", id: :integer, limit: 3, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "term_id", limit: 2
    t.integer "year_id", limit: 2
    t.integer "student_id", limit: 3, default: 0, null: false
    t.integer "section_id", limit: 3, default: 0, null: false
    t.integer "grade_id", limit: 2, default: 15
    t.text "body", collation: "latin1_swedish_ci"
    t.timestamp "created_on", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_on", null: false
    t.integer "lock_version", default: 0
    t.boolean "final_grade"
    t.integer "exam_grade_id", default: 15
    t.index ["section_id"], name: "section_id"
    t.index ["section_id"], name: "section_id_2"
    t.index ["student_id"], name: "student_id"
    t.index ["student_id"], name: "student_id_2"
    t.index ["term_id"], name: "term_id"
    t.index ["term_id"], name: "term_id_2"
    t.index ["year_id"], name: "year_id"
    t.index ["year_id"], name: "year_id_2"
  end

  create_table "student_self_assessments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "progressreport_id"
    t.integer "student_id"
    t.text "body"
    t.float "acted_on_suggestions", limit: 24
    t.float "best_effort", limit: 24
    t.float "challenging", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "expected_grade_id"
    t.float "preparedness", limit: 24
    t.float "engagement", limit: 24
  end

  create_table "students", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_individuals", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "student_id", default: 0, null: false
    t.integer "individual_id", default: 0, null: false
    t.integer "relationship_id", default: 0, null: false
  end

  create_table "submissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "canvas_id"
    t.text "body"
    t.string "url"
    t.integer "attachment_id"
    t.string "grade"
    t.float "score", limit: 24
    t.datetime "submitted_at"
    t.integer "assignment_id"
    t.integer "canvas_user_id"
    t.string "submission_type"
    t.string "workflow_state"
    t.integer "group_id"
    t.string "attachment_ids"
    t.boolean "processed"
    t.integer "process_attempts"
    t.boolean "grade_matches_current_submission"
    t.float "published_score", limit: 24
    t.string "publihsed_grade"
    t.datetime "graded_at"
    t.bigint "canvas_grader_id"
    t.text "submission_comments_json"
    t.integer "submission_commnets_count"
    t.boolean "changed_since_publish"
    t.string "media_comment_id"
    t.string "media_comment_type"
    t.boolean "has_rubric_assessment"
    t.integer "attempt"
    t.integer "canvas_course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "html_url"
    t.string "preview_url"
  end

  create_table "survey_questions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "survey_id"
    t.integer "question_id"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "end"
    t.boolean "anon_individual"
    t.boolean "anon_section"
    t.integer "year_id"
    t.string "submit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "election"
  end

  create_table "teacher_evaluations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "applicantion_data_id"
    t.string "lastname"
    t.string "firstname"
    t.string "title"
    t.string "relationship"
    t.string "how_long_have_you_known_the_applicant"
    t.string "evaluation_body"
    t.string "notes_on_evaluations"
  end

  create_table "teachers", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.string "sisid", limit: 8, collation: "latin1_swedish_ci"
    t.string "lastname", limit: 50, collation: "latin1_swedish_ci"
    t.string "firstname", limit: 50, collation: "latin1_swedish_ci"
    t.string "gender", limit: 1, collation: "latin1_swedish_ci"
    t.date "birthday"
    t.string "degree", collation: "latin1_swedish_ci"
    t.string "login", collation: "latin1_swedish_ci"
    t.index ["login"], name: "login"
  end

  create_table "teaching_assignments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "teacher_id", limit: 3, unsigned: true
    t.integer "section_id", limit: 3, unsigned: true
    t.integer "year_id", limit: 1
    t.index ["section_id"], name: "section_id"
    t.index ["section_id"], name: "section_id_2"
    t.index ["teacher_id"], name: "teacher_id"
    t.index ["teacher_id"], name: "teacher_id_2"
    t.index ["year_id"], name: "year_id"
    t.index ["year_id"], name: "year_id_2"
  end

  create_table "terms", id: :integer, limit: 1, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.boolean "t1"
    t.boolean "t2"
    t.boolean "t3"
    t.string "name", limit: 30, collation: "latin1_swedish_ci"
    t.boolean "current", default: false
    t.boolean "current_graded"
    t.string "span"
  end

  create_table "thought_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order"
    t.string "name"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thought_votes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "thought_id"
    t.integer "voter_id"
    t.boolean "funny"
    t.boolean "so_eps"
    t.boolean "great_idea"
    t.boolean "thumbs_up"
    t.boolean "thumbs_down"
    t.string "custom_tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thoughts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "body"
    t.integer "thought_category_id"
    t.integer "author_id"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "course_id"
    t.integer "year_id"
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.text "description"
    t.text "how_addresses_big_question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "topics"
    t.text "genres"
    t.text "geographies"
    t.text "period"
    t.text "works"
    t.integer "updated_by_id"
    t.integer "parent_id"
    t.index ["course_id"], name: "course_id"
  end

  create_table "vlan_overrides", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "new_vlan"
    t.integer "individual_id"
    t.integer "requester_id"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yeargrades", id: :integer, limit: 3, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.integer "student_id", limit: 3, unsigned: true
    t.integer "year_id", limit: 1, unsigned: true
    t.integer "grade_id", limit: 1, unsigned: true
    t.string "subgrade", limit: 1, collation: "latin1_swedish_ci"
  end

  create_table "years", id: :integer, limit: 1, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci" do |t|
    t.string "name", limit: 9, collation: "latin1_swedish_ci"
    t.boolean "current", default: false
    t.boolean "current_graded"
  end

end
