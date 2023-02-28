class CatalogController < ApplicationController
  def index
    #@year = Year.current 
    #@year = Year.next_year
    set_working_year    

    @courses = CourseOffering.joins(:course).where("year_id = ? and (additional_offering = 0 or additional_offering IS NULL)",@year).order('department_id,sort_order').offset(0).collect {|co| co.course if co.course.graded?}.compact
    @departments = Department.all
    @info_departments = [16,17]
  end

  def full_catalog
    api()
  end
  
  def api
    if params[:course_id]
      courses = [Course.find(params[:course_id])]
      year = params[:year_id]
    elsif params[:term_id]
      year = params[:year_id]
      term = params[:term_id]
      courses = Course.where("offering = 1 and (archived != 1 or archived is null) and term_id = ?",term).all #now includes seminars in api
    else
      year = params[:year_id]
      courses = Course.where("(archived != 1 or archived is null) and catalog=1").all #now includes seminars in api
    end

    @course_offerings = []
    courses.each do |course|
      course_offering =  CourseOffering.where("year_id = ? and course_id in (?)", year, course.sibling_course_ids << course.id).first
      if course_offering
        course_hash = {
              "course_id" => course_offering.course_id, 
              "sort_order" => course_offering.sort_order, 
              "gradelevels" => course_offering.gradelevels,
              "info" => course_offering.info,
              "course" => {
                  "sisid" => course.sisid,
                  "id" => course.id,
                  "credits" => course.credits,
                  "division_id" => course.division_id,
                  "department_id" => course.department_id,
                  "term_id" => course.term_id,
                  "needalt" => course.needalt,
                  "shortname" => course.short_name,
                  "name" => course_offering.course.name,
                  "required" => course.required,
                  "siblings" => course.siblings,
                  "meets_grad_requirements" => course.meets_grad_requirements,
                  "can_take_multiple" => course.can_take_multiple,
                  "department" => {
                    "name" => course.department.name,
                    "short_name" => course.department.short_name
                  }
             }
             }
        @course_offerings << course_hash
      end
    end
      
    render json: @course_offerings.to_json #( :include => {:course => {include: :department}} )
    
  end

end
