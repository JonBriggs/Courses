class Course < ApplicationRecord
  has_many :course_offerings
  belongs_to :department
  has_attached_file :course_image, styles: {tile: "800x450>", thumb: '32x32#', preview: '150x150#'}, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :course_image, :content_type => /^image\/(png|gif|jpeg)/, :message => 'only (png/gif/jpeg) images'
  #has_one :current_course_offering, -> {CourseOffering.current_course_offering}

  def current_course_offering
    course_offerings.where("year_id = ?",Courses::Application.config.catalog_year).first
  end
  
  def sibling_course_ids
    if self.siblings
      self.siblings.split(",").map {|c| c.to_i}
    else
      [] 
    end
  end

  def sibling_courses
    Course.where("id in (?)", self.sibling_course_ids).all
  end

  def fitted_name
    if name.size > 41
      name[0,38] + "..."
    else
      name
    end
  end
end
