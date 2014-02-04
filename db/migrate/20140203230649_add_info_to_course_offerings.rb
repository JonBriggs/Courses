class AddInfoToCourseOfferings < ActiveRecord::Migration
  def change
    add_column :course_offerings, :info, :string
  end
end
