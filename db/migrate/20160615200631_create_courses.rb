class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.belongs_to :studio, foreign_key: true
      t.string :instructor
      t.string :title
      t.text :description
      t.string :category_tags, array: true

      t.timestamps
    end
  end
end
