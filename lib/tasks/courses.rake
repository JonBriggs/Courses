namespace :courses do
  desc "Move Course.eastsideprep.org into the new year"
  task(:setup_course_offerings => :environment) do
    puts "Have you already used wget to archive this year's offerings?"
    puts "have you setup nginx to serve that archive at courses.eastsideprep.org while you work on these?"
    puts "have you set the courses application to be at courses16.eastsideprep.org"
    if STDIN.gets.chomp == 'Y'
      course_offerings = CourseOffering.where("year_id = ?",Year.current).all
      course_offerings.each do |co|
        newco = co.dup
        newco.year_id = co.year_id + 1
        newco.save
        print '.'
      end
    end
     
  end
end
