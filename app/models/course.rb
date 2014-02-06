class Course < ActiveRecord::Base
  has_many :course_offerings
  belongs_to :department
  has_one :current_course_offering, class_name: CourseOffering, conditions: proc {["year_id = ?",Year.next_year.id]}

  def fitted_name
    if name.size > 41
      name[0,38] + "..."
    else
      name
    end
  end
  def department_id
    #stub to convert four11 to courses
    division_id
  end
end
