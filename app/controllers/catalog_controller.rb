class CatalogController < ApplicationController
  def index
    #@year = Year.current 
    #@year = Year.next_year
    set_working_year    

    @courses = CourseOffering.joins(:course).where("year_id = ?",@year).order('department_id,sort_order').offset(0).collect {|co| co.course if co.course.graded?}.compact
    @departments = Department.all
    @info_departments = [16,17]
  end
end
