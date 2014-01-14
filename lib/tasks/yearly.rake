namespace :annual_import do
  desc "Setup next year's course offerings"
  task(:move_course_offerings_forward => :environment) do
    courses = Course.where("list_in_catalog = 1")
	this_year = Year.current
	next_year = Year.next_year
    courses.each do |course|
      puts course.name
      unless CourseOffering.where("course_id = ? and year_id = ?",course.id,next_year.id).first
        co = CourseOffering.new
        co.course_id = course.id
        co.year_id = next_year.id
        last_course_offering = CourseOffering.where("course_id = ? and year_id = ?",course.id,this_year.id).first
        if last_course_offering
          co.grade_level_ids = last_course_offering.grade_level_ids
          co.description = last_course_offering.description
        end
        co.save
      end
    end
  end
end
