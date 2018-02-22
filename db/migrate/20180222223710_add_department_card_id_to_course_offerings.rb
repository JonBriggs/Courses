class AddDepartmentCardIdToCourseOfferings < ActiveRecord::Migration[5.1]
  def change
    add_column :course_offerings, :department_card_id, :integer
  end
end
