class ChangeInitialAndEndDateInService < ActiveRecord::Migration[7.0]
  def change
    change_column :services, :initial_date, :datetime
    change_column :services, :end_date, :datetime
  end
end
