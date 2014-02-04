class AddGradelevelsToCourseOfferings < ActiveRecord::Migration
  def change
    add_column :course_offerings, :gradelevels, :string
  end
end
