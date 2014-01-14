class CatalogController < ApplicationController
  def index
    @year = Year.next_year
    @courses = CourseOffering.where("year_id = ?",@year).collect {|co| co.course if co.course.graded?}.compact
    @departments = Department.all
  end
end
