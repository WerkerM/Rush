class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :course, foreign_key: true
      t.date :start_date
      t.integer :number_of_weeks
      t.string :day_of_week
      t.datetime :time

      t.timestamps
    end
  end
end
