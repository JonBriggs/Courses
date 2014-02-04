class AddSortOrderToCourseOfferings < ActiveRecord::Migration
  def change
    add_column :course_offerings, :sort_order, :integer
  end
end
