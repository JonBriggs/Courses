class CourseOffering < ActiveRecord::Base
  belongs_to :course
  belongs_to :year
end
