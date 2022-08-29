class AddAdditionalOfferingToCourseOfferings < ActiveRecord::Migration[5.1]
  def change
    add_column :course_offerings, :additional_offering, :boolean
  end
end
