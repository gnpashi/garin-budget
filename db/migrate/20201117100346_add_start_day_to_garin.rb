class AddStartDayToGarin < ActiveRecord::Migration[6.0]
  def change
    add_column :garins, :start_day, :integer
  end
end
