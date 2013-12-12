class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :name
      t.string :short_name
      t.boolean :current
      t.boolean :current_graded

      t.timestamps
    end
  end
end
