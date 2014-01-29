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
          #co.grade_level_ids = last_course_offering.grade_level_ids
          co.description = last_course_offering.description
        else
          co.description = course.description
        end
        co.save
      end
    end
  end

  desc "Load course information"
  task(:load_course_information => :environment) do
    require 'csv'
    begin
      csv_courses = CSV.read('2014-course-catalog.csv')
    rescue
      csv_courses = CSV.read('2014-course-catalog.csv',encoding:'Windows-1252')
    end

    headers = csv_courses.shift
    csv_courses.each do |csv_course|
      target_course = nil
      department_id = csv_course[headers.index("Discipline")].to_i
      name = csv_course[headers.index("Title")]
      puts name
      possible_courses = Course.where("department_id = ? and name like ?",department_id,name[0,10] + "%").all
      if possible_courses.size == 0
        possible_courses = Course.where("department_id = ?",department_id).all
      end
      if possible_courses.size == 1
        puts name
        puts possible_courses[0].name
        if name == possible_courses[0].name
          target_course = possible_courses[0]
        else
          puts "do we have a match?"
          answer = STDIN.gets.chomp
          if answer.downcase == 'y'
            target_course = possible_courses[0]
          end
        end
      else
        puts "\n---" + name
        count = 0
        possible_courses.each do |pc|
          puts count.to_s + ")" + pc.name
          count += 1
        end
        puts "what number matches? (enter a bigger number to skip)"
        answer = STDIN.gets.chomp.to_i
        if answer < possible_courses.size && answer >= 0
          target_course = possible_courses[answer]
        else
          puts "skip or build a new course?"
          puts "this is not implemented yet"
          sleep 2
        end
      end

      if target_course
        target_course.name = name
        target_course.subdiscipline = csv_course[headers.index("SubDiscipline")]
        target_course.list_in_catalog = true
        target_course.credits = csv_course[headers.index("Credits")]
        target_course.required = true if csv_course[headers.index("R-E")] == 'R'
        target_course.gradelevels = csv_course[headers.index("Grade Level")]
        target_course.requirements = csv_course[headers.index("Prerequisites")]
        current_offering = target_course.current_course_offering
        current_offering.description = csv_course[headers.index("CourseDescription")]
        target_course.save
        current_offering.save
      end
    end
  end
end
