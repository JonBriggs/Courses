class CreateCourseOfferings < ActiveRecord::Migration
  def change
    create_table :course_offerings do |t|
      t.integer :course_id
      t.integer :year_id
      t.string :grade_level_ids
      t.text :description
      t.timestamps
    end
  end
end
