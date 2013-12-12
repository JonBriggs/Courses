namespace :annual_import do
  desc "Setup next year's course offerings"
  task(:move_course_offerings_forward => :environment) do
    courses = Course.where("list_in_catalog = 1")
    courses.each do |course|
      puts course.name
    end
  end
end
