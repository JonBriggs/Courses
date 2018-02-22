module CatalogHelper


  def modalities_for_course_offering(course_offering)
    #change this into a looped partial call to modalities
    #image_tag("icon.png")
  end
  
  def department_card_for(dept_id)
    dept_card = CourseOffering.where("year_id = ? and department_card_id = ?",@year, dept_id).first
    dept = Department.find(dept_id)
    render partial: "department", locals: {department_card: dept_card, department: dept} if dept_card
  end
end
