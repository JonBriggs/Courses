class Course < ApplicationRecord
  has_many :course_offerings
  belongs_to :department
  #has_one :current_course_offering, -> {CourseOffering.current_course_offering}

  def current_course_offering
    course_offerings.where("year_id = ?",Courses::Application.config.catalog_year).first
  end

  def fitted_name
    if name.size > 41
      name[0,38] + "..."
    else
      name
    end
  end
end
