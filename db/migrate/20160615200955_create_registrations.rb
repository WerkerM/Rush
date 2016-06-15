class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
