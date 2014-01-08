class CatalogController < ApplicationController
  def index
    @year = Year.where("current =1").first
    @courses = CourseOffering.where("year_id = ?",@year).collect {|co| co.course if co.course.graded?}.compact
    @departments = Department.all
  end
end
