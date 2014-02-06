class CatalogController < ApplicationController
  def index
    @year = Year.next_year
    @courses = CourseOffering.joins(:course).where("year_id = ?",@year).order('courses.department_id,sort_order').collect {|co| co.course if co.course.graded?}.compact
    @departments = Department.all
  end
end
