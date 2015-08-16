class UpdateEventTimesFromDateToDatetime < ActiveRecord::Migration
  def change
    change_column(:events, :time_start, :datetime)
    change_column(:events, :time_end, :datetime)
  end
end
