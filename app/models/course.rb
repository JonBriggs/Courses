class Course < ActiveRecord::Base
  has_many :course_offerings
  belongs_to :department
  has_one :current_course_offering, class_name: CourseOffering, conditions: proc {["year_id = ?",Year.current.id]}
end
