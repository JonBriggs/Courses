class AddSubdisciplineRequiredGradelevelsRequirementsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :subdiscipline, :string
    add_column :courses, :required, :boolean
    add_column :courses, :gradelevels, :string
    add_column :courses, :requirements, :string
  end
end
