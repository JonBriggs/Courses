class AddCourseTileImageToCourses < ActiveRecord::Migration[5.1]
  def up
    add_attachment :courses, :course_image
  end
  def down
    remove_attachment :courses, :course_image
  end
end
