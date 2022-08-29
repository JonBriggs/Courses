namespace :annual_import do
  desc "Setup next year's course offerings"
  task(:move_course_offerings_forward => :environment) do
    courses = Course.where("catalog = 1")
    puts "What year are we moving to? (year_id)"
    year = STDIN.gets.chomp.to_i
	this_year = Year.find(year - 1)
	next_year = Year.find(year)
    #move forward discipline cards
    discipline_cards = CourseOffering.where("department_card_id is not null and year_id = ?",this_year).all
    discipline_cards.each do |dc|
      if CourseOffering.where("department_card_id = ? and year_id = ?",dc.department_card_id, next_year.id).first == nil
        new_dc = dc.dup
        new_dc.year_id = next_year.id
        new_dc.save
      end
    end
    #include courses marked as catalog
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
          co.grade_level_ids = last_course_offering.grade_level_ids
          co.gradelevels = last_course_offering.gradelevels
          co.info = last_course_offering.info
          co.sort_order = last_course_offering.sort_order
          co.gradelevels = last_course_offering.gradelevels
        elsif course.cat_entry
          co.sort_order = 20 
          co.info = "" 
          co.description = course.cat_entry
          co.gradelevels = course.gradelevels
        else
          co.sort_order = 20 
          co.info = ""
          co.description = course.description
          co.gradelevels = course.gradelevels
        end
        co.save
      end
    end

    # Roll forward the discipline cards
    CourseOffering.where("department_card_id > 0 and year_id = ?",this_year).all.each do |discipline_card|
      unless CourseOffering.where("department_card_id = ? and year_id = ?", discipline_card.department_card_id, next_year).first
        co = CourseOffering.new
        co.department_card_id = discipline_card.department_card_id
        co.year_id = next_year
        co.sort_order = discipline_card.sort_order
        co.info = discipline_card.info
        co.gradelevels = discipline_card.gradelevels
        co.description = discipline_card.description
        co.save
      end
    end
  end

  desc "Add in new courses for this year"
  task(:check_for_newly_catalogged_courses => :environment) do
    courses = Course.where("catalog = 1")
    puts "Which year id are we working with? Current year is #{Courses::Application.config.catalog_year}"

    year_id = STDIN.gets().chomp.to_i

    courses.each do |course|
      puts course.name
      unless CourseOffering.where("course_id = ? and year_id = ?",course.id,year_id).first
        puts "Missing course offering for #{course.inspect}, \n Create course offering? y/N"
        choice = STDIN.gets.chomp.downcase
        if choice == 'y'
          co = CourseOffering.new
          co.course_id = course.id
          co.year_id = year_id
          last_course_offering = CourseOffering.where("course_id = ? and year_id = ?",course.id,year_id - 1).first
          if last_course_offering
            #co.grade_level_ids = last_course_offering.grade_level_ids
            co.description = last_course_offering.description
            co.grade_level_ids = last_course_offering.grade_level_ids
            co.gradelevels = last_course_offering.gradelevels
            co.info = last_course_offering.info
            co.sort_order = last_course_offering.sort_order
            co.gradelevels = last_course_offering.gradelevels
          elsif course.cat_entry
            co.sort_order = 20 
            co.info = "" 
            co.description = course.cat_entry
            co.gradelevels = course.gradelevels
          else
            co.sort_order = 20 
            co.info = ""
            co.description = course.description
            co.gradelevels = course.gradelevels
          end
          co.save
        end
      end
    end
  end

  desc "Load course information"
  task(:old_load_course_information => :environment) do
    require 'csv'
    begin
      csv_courses = CSV.read('2014-course-catalog.csv')
    rescue
      csv_courses = CSV.read('2014-course-catalog.csv',encoding:'Windows-1252')
    end

    headers = csv_courses.shift
    sort_order = 0
    csv_courses.each do |csv_course|
      sort_order += 10
      target_course = nil
      department_id = csv_course[headers.index("Discipline")].to_i
      name = csv_course[headers.index("Title")]
      puts name
      possible_courses = Course.where("catalog = 1 and department_id = ? and name like ?",department_id,name[0,10] + "%").all
      if possible_courses.size == 0
        possible_courses = Course.where("catalog = 1 and department_id = ?",department_id).all
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
          puts count.to_s + ") [" + pc.sisid.to_s + "]" + pc.name
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
        #target_course.subdiscipline = csv_course[headers.index("SubDiscipline")]
        #target_course.catalog = true
        #target_course.credits = csv_course[headers.index("Credits")]
        #target_course.required = true if csv_course[headers.index("R-E")] == 'R'
        #target_course.gradelevels = csv_course[headers.index("Grade Level")]
        #target_course.requirements = csv_course[headers.index("Prerequisites")]
        #current_offering = target_course.current_course_offering
        #current_offering.description = csv_course[headers.index("CourseDescription")]
        #current_offering.gradelevels = target_course.gradelevels
        #current_offering.info = csv_course[headers.index("Prerequisites")]
        target_course.save
        #current_offering.sort_order = sort_order
        #current_offering.save
      end
    end
  end
end
