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
  def age_level
    if gradelevels == nil || gradelevels == '' || gradelevels.size == 0
      return "all"
    elsif gradelevels.size < 3 #single course grade
      if gradelevels.to_i < 9
        return "ms"
      elsif gradelevels.to_i > 8
        return "us"
      else
        return "all"
      end
    elsif gradelevels.size == 0
      return "all"
    else
      if gradelevels.split("-").size > 1 #age span
        levels = gradelevels.split("-")
      elsif gradelevels.split(",").size > 1 #comma list
        levels = gradelevels.split(",")
      end
      ms = false
      us = false
      if levels[0].to_i < 9
        ms = true
      end
      if levels[-1].to_i > 8
        us = true
      end
      if ms && us
        return "all"
      elsif ms
        return "ms"
      elsif us
        return "us"
      end
    end
  end
end
