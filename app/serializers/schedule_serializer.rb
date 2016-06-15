class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :number_of_weeks, :day_of_week, :time
end
