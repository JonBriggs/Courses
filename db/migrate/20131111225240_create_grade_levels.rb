class CreateGradeLevels < ActiveRecord::Migration
  def change
    create_table :grade_levels do |t|
      t.string :name
      t.string :short_name
      t.integer :order
      t.boolean :ls_grade_level
      t.boolean :ms_grade_level
      t.boolean :us_grade_level

      t.timestamps
    end
  end
end
