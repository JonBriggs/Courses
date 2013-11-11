class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :shortname
      t.string :sisid
      t.integer :department_id
      t.integer :term_id
      t.boolean :graded
      t.boolean :archived
      t.boolean :list_in_catalog
      t.float :credits
      t.boolean :us_course
      t.boolean :ms_course
      t.boolean :ls_course
      t.string :rotation
      t.integer :previous_course_id
      t.integer :next_course_id
      t.string :prereq_ids
      t.string :type

      t.timestamps
    end
  end
end
