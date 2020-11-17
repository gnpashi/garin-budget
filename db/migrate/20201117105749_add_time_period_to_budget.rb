class AddTimePeriodToBudget < ActiveRecord::Migration[6.0]
  def change
    add_reference :budgets, :time_period, foreign_key: true
  end
end
