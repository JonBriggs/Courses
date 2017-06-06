class Course < ActiveRecord::Base
  has_many :course_offerings
  belongs_to :department
  has_one :current_course_offering, class_name: CourseOffering, conditions: proc {["year_id = ?",Courses::Application.config.catalog_year]} #change to next for next year

  def fitted_name
    if name.size > 41
      name[0,38] + "..."
    else
      name
    end
  end
end
