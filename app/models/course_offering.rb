class CourseOffering < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :year
  
  def passed_course_img=(params)
    self.course.course_image = params
    self.course.save
  end

  def sibling_offerings
    CourseOffering.where("year_id = ? and course_id in (?)", self.year_id, self.course.sibling_course_ids).all
  end

  def add_sibling_offering(term_id)
    if self.course.term_id != term_id
      new_course_id = self.course.sibling_courses.where("courses.term_id = ?", term_id).first.id
      if new_course_id && CourseOffering.where("course_id = ? and year_id = ?", new_course_id, self.year_id).first.nil?
        co = self.dup
        co.course_id = new_course_id
        co.additional_offering = true
        co.save
        puts "Course offering added"
      else
        puts "Already added that term or no courses available to add that term"
      end
    else
      puts "ERROR, courses is in the same term"
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
