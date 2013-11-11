class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.boolean :t1
      t.boolean :t2
      t.boolean :t3
      t.boolean :t4
      t.boolean :t5
      t.boolean :t6
      t.string :name
      t.boolean :current

      t.timestamps
    end
  end
end
