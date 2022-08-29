class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_working_year
    #@year ||= Year.where("current = 1") #Year.next_year or 
    @year = Year.find Courses::Application.config.catalog_year #Year.next_year
  end

  def republish
    %x(/var/www/org.eastsideprep.courses/publish.sh)
    flash[:notice] = "Courses.eastsideprep.org Republished"
    redirect_to course_offerings_path
  end
end
